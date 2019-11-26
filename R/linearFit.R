#'linearFit
#'
#'Gets the fitted linear regression model results
#'
#'@param X input indicator variable matrix, not including intercept 1
#'@param Y input response variable vector
#'
#'@return a list
#' $coefficient: the coefficient of each indicator variable and corresponding;
#' $test: single variable t-statistics and corresponding p-value
#' $CI: 95% confidence interval of coefficient estimate.
#' $MSE, $df.res
#'
#'
#'@examples
#'n = 1e3
#'p = 20
#'Y = runif(n,-5,5)
#'X = matrix(rnorm(n*p,0,1),n,p)
#'
#'@export
#'

linearFit = function(X, Y){
  obs = nrow(X)
  X = cbind(rep(1,obs),X)
  q = ncol(X)
  isfullrk = tryCatch(solve(t(X)%*%X), error = function(e) e)
  if (!any(class(isfullrk) == "error")){
    X_part = solve(t(X)%*%X) %*% t(X)
    beta = X_part %*% Y
    hat_matrix = X %*% X_part
    Y_hat = hat_matrix %*% Y

    # estimate \sigma^2
    SSE = sum((Y - Y_hat)^2)
    MSE = SSE / (obs - q)
    SSY = sum((Y - mean(Y))^2)
    R_square = 1 - SSE / SSY

    # variance & single variable test
    cov_beta = MSE * solve(t(X)%*%X)
    se_beta = sqrt(diag(cov_beta))

    result = list()
    result$coefficients = beta
    result$test = t_test(beta, se_beta)
    result$CI = confidInt(beta, se_beta)
    result$estimate = Y_hat
    result$MSE = MSE
    result$df.res = obs - q
    result$R_square = R_square
    result$cov_beta = cov_beta
    return(result)
  } else print('Design matrix is not a full rank matrix, please cheak it')
}

# 95% confidence Interval
confidInt = function(point, se){
  lowCI = point - 1.96 * se
  uppCI = point + 1.96 * se
  result = cbind(lowCI,uppCI)
  colnames(result) = c('lowCI','uppCI')
  return(c(lowCI, uppCI))
}

# t-test, return t_statistics and corresponding p-value
t_test = function(point, se){
  t = point / se
  p = stats::pnorm(-abs(t)) + 1 - stats::pnorm(abs(t))
  result = cbind(t,p)
  colnames(result) = c('t_stats','p_value')
  return(result)
}


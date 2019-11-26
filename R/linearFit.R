#'linearFit
#'
#'Gets the fitted linear regression model results
#'
#'@param X input indicator variable matrix/design matrix
#'@param Y input response variable vector
#'
#'@return the coefficient of each indicator variable and corresponding
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
  if (det(t(X)%*%X)!=0){
    X_part = solve(t(X)%*%X) %*% t(X)
    beta = X_part %*% Y
    hat_matrix = X %*% X_part
    Y_hat = hat_matrix %*% Y

    # estimate \sigma^2
    SSE = sum((Y - Y_hat)^2)
    MSE = SSE / (obs - q)
    SSY = sum((Y - mean(Y))^2)
    R_square = 1 - SSE / SSY

    # variance
    # cov_beta = MSE * solve(t(X)%*%X)
    # se_beta = sqrt(diag(cov_beta))
    # SingleTest = t_test(beta, se_beta)
    result = list()
    result$coefficient = beta
    result$estimate = Y_hat
    result$MSE = MSE
    result$R_square = R_square
    return(result)
  } else print('Design matrix is not a full rank matrix, please cheak it')
}

# # confidence Interval
# confidInt = function(point, se){
#   lowCI = point - 1.96 * se
#   uppCI = point + 1.96 * se
#   return(c(lowCI, uppCI))
# }
#
# # t-test, return corresponding p-value
# t_test = function(point, se){
#   t = point / se
#   p = stats::pnorm(-abs(t)) + 1 - stats::pnorm(abs(t))
#   result = list()
#   result$t_value = t
#   result$p_value = p
#   return(result)
# }

# TypeIII test -- C++

# TypeI test -- C++

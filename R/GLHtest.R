#'GLHtest
#'
#'General Linear Hypothesis Test
#'
#'@param model input fitted linear model
#'@param T contrast matrix, each row specifies a linear combination of the coefficients
#'@param c vector, specifying the null hypothis values for each linear combination,
#' Default value is zero vector.
#'
#'@return F-statistics of the GLH test and corresponding p-value
#'
#'@examples
#'n = 1e3
#'p = 20
#'Y = runif(n,-5,5)
#'X = matrix(rnorm(n*p,0,1),n,p)
#'T = matrix(sample(-5:5, p+1, replace = TRUE),nrow=1)
#'model = linearFit(X,Y)
#'GLHtest(model,T)
#'
#'@export
#'

GLHtest = function(model, T, c = rep(0, nrow(T)) ){
  beta = model$coefficients
  rk = qr(T)$rank
  main = T%*%beta - c

  F_stats = t(main) %*% solve(T %*% model$cov_beta %*% t(T)) %*% main / rk
  p_value = stats::pf(F_stats, rk, model$df.res, lower.tail = FALSE)
  result = c(F_stats, p_value)
  names(result) = c('F','p_value')
  return(result)
}

test_that("coefficients",{
  # Y = Xbeta + epsilon
  n = 1e3; p = 20
  beta = runif(p+1, -5, 5)
  X = matrix(rnorm(n*p, 10, 0.1),n,p)
  error = rnorm(n, 0, 1)
  Y = cbind(rep(1,n),X) %*% beta + error
  lm1 = lm(Y~X)
  lm2 = linearFit(X, Y)
  expect_equal(as.vector(lm2[[1]]), as.vector(lm1$coefficients))
}
)

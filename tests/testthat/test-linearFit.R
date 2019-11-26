test_that("fit",{
  # Y = Xbeta + epsilon
  n = 1e3; p = 20
  beta = runif(p+1, -5, 5)
  X = matrix(rnorm(n*p, 10, 0.1),n,p)
  error = rnorm(n, 0, 1)
  Y = cbind(rep(1,n),X) %*% beta + error
  lm1 = lm(Y~X)
  lm2 = linearFit(X, Y)
  expect_equal(as.vector(lm2$coefficients), as.vector(lm1$coefficients))

  X2 = matrix(c(1,0,0,
                0,1,0,
                0,0,1), nrow=3)
  Y2 = runif(3)
  expect_equal(linearFit(X2, Y2),"Design matrix is not a full rank matrix, please cheak it")

  # # test predict function
  # newX = matrix(rnorm(p),ncol=p)
  # predict(lm1, data.frame(X = newX))

  # test GLH_test
  library(gmodels)
  T1 = matrix(sample(-5:5, p+1, replace = TRUE),nrow=1)
  expect_equal( (GLHtest(lm2, T1))['F'], (glh.test(lm1, T1))$statistic )

  T2 = matrix(sample(-5:5, 2*(p+1), replace = TRUE), nrow = 2)
  expect_equal( (GLHtest(lm2, T2))['F'], (glh.test(lm1, T2))$statistic )

  }


)

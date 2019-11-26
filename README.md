# LinearModel
<!-- badges: start -->
  [![Travis build status](https://travis-ci.org/xietian99/LinearModel.svg?branch=master)](https://travis-ci.org/xietian99/LinearModel)
<!-- badges: end -->

  <!-- badges: start -->
  [![Codecov test coverage](https://codecov.io/gh/xietian99/LinearModel/branch/master/graph/badge.svg)](https://codecov.io/gh/xietian99/LinearModel?branch=master)
  <!-- badges: end -->

## Overview
LinearModel provide analysis of linear regression model for data, providing model estimation, model prediction, and Genaralized Linear Hypothesis testing:

- `linearFit()` fit linear regression model over data, return a list contaning each variables' coefficients estimators, its corresponding stand error, confidence interval, single variable t-test, and model performance(R_square). 
- `lmPredict()` return the estimate response value of new observations, based on the fitted model
- `GLHtest()` conduct Genaralized Linear Hypothesis testing.

## Package Installation
You can install `LinearModel` from Github:
```r
devtools::install_github("xietian99/LinearModel", build_vignettes = T)
```

## Tutorio
For detailed usage of the packge, please use `browseVignettes("LinearModel")` to see examples after package installation.

## Getting Help
For detailed usage of each function, please use `?linearFit`, `?lmPredict`, `?GLHtest` to view the help page. 

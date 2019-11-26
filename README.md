# LinearModel
<!-- badges: start -->
  [![Travis build status](https://travis-ci.org/xietian99/LinearModel.svg?branch=master)](https://travis-ci.org/xietian99/LinearModel)
<!-- badges: end -->

  <!-- badges: start -->
  [![Codecov test coverage](https://codecov.io/gh/xietian99/LinearModel/branch/master/graph/badge.svg)](https://codecov.io/gh/xietian99/LinearModel?branch=master)
  <!-- badges: end -->

## Overview
LinearModel provide analysis of linear regression model for data, providing model estimation, model prediction, and Genaralized Linear Hypothesis testing:

- `linearFit()` fit linear regression model based on indicator variable matrix, and response variable vector, return a list contaning the estimators of each variables' coefficients, its corresponding stand error, confidence interval, single variable t-test, and model performance(R_square). 
- `lmPredict()` return the estimate response value of new observations, based on the fitted model
- `GLHtest()` conduct Genaralized Linear Hypothesis testing.

## Package Installation
You can install `LinearModel` from Github:
```r
devtools::install_github("xietian99/LinearModel")
```

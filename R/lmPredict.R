#'lmPredict
#'
#'Use the fitted linear model to predict value for a new observation.
#'
#'@param model input fitted linear model
#'@param newX input indicator variable matrix, without intercept 1.
#'one-dimension vector works as well
#'
#'@return the estimated Y-value
#'
#'@examples
###########To be editted!!!!!!!
#'n = 1e3
#'p = 20
#'Y = runif(n,-5,5)
#'X = matrix(rnorm(n*p,0,1),n,p)
#'newX = matrix(rnorm(p),ncol=p)
#'model = linearFit(X,Y)
#'lmPredict(model,newX)
#'
#'@export
#'

lmPredict = function(model, newX){
  if (!is.matrix(newX)){
    newX = matrix(newX, nrow=1)
  }
  x = cbind(rep(1,nrow(newX)), newX)
  y = x %*% (model$coefficients)
  return(y)
}

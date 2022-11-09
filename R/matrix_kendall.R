single_tau = function(x) {
  y <- seq_along(x)
  n <- length(x)
  ix <- order(x)
  x <- x[ix]
  y <- y[ix]
  NC <- sum(sapply(1:(n-1), function(i) sum(x[i]<x[(i+1):n] & y[i]<y[(i+1):n])))
  ND <- sum(sapply(1:(n-1), function(i) sum(x[i]<x[(i+1):n] & y[i]>y[(i+1):n])))
  tau <- (NC - ND)/((n*(n-1))/2)
}

matrix_kendall = function(X) {
  X <- t(X)
  cl <- parallel::makeCluster(getOption("cl.cores", 5))
  tau <- parallel::parApply(cl, X, 2, single_tau)
  parallel::stopCluster(cl)
  return(max(tau))
}

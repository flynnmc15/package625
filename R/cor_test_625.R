#' Correlation Package
#'
#' @param x A numerical vector.
#' @param y A numerical vector.
#' @param method Method used to calculate correlation value. Methods include Pearson, Spearman, Kendall, All. Default is Pearson.
#'
#' @return A numerical vector of one containing the correlation value (All creates a 1x3 data frame containing all 3 values).
#' @export
#'
#' @examples
#' Creating two numerical vectors:
#' x <- c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32)
#' y <- c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81)
#' cortest625(x, y, method = "pearson")
#'
#' Using the mtcars dataset:
#' cortest625(mtcars$mpg, mtcars$drat, method = "spearman")
#'
#' Randomly generating data:
#' cortest625(rnorm(100), rnorm(100), method = "kendall")
cortest625 = function(x, y, method = "pearson") {

  #Calculating Pearson Correlation
  pearson_cor = function(x, y) {
    x_diff <- sapply(1:length(x), function(i) x[i] - mean(x))
    y_diff <- sapply(1:length(x), function(i) y[i] - mean(y))
    den <- sum(x_diff^2) * sum(y_diff^2)
    num <- sum(x_diff*y_diff)
    return((num/(sqrt(den))))
  }

  #Calculating Kendall Tau
  kendall_cor = function(x, y) {
    n <- length(x)
    ix <- order(x)
    x <- x[ix] #Ordering x to find concordant/discordant pairs
    y <- y[ix] #Ordering y to find concordant/discordant pairs
    NC <- sum(sapply(1:(n-1), function(i) sum(x[i]<x[(i+1):n] & y[i]<y[(i+1):n]))) #Concordant Pairs
    ND <- sum(sapply(1:(n-1), function(i) sum(x[i]<x[(i+1):n] & y[i]>y[(i+1):n]))) #Discordant Pairs
    tau <- (NC - ND)/((n*(n-1))/2)
    return((tau))
  }

  #Calculating Spearman Correlation
  spearman_cor = function(x, y) {
    num <- sum(abs((rank(-x) - rank(-y))^2))
    den <- (length(x)*(length(x)^2-1))
    return(1 - (6*num)/den)
  }

  if(method == "pearson") {

    return(pearson_cor(x, y))

  } else if(method == "kendall") {

    return(kendall_cor(x, y))

  } else if(method == "spearman") {

    return(spearman_cor(x, y))

  } else if (method == "all") {

    #Method = All returns all 3 correlations in a data frame
    return(data.frame(Pearson = pearson_cor(x, y), Kendall = kendall_cor(x, y), Spearman = spearman_cor(x, y)))

  } else {

    print("Error: Method Not Recognized")

  }
}


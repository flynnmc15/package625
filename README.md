# package625
<!-- badges: start -->
[![R-CMD-check](https://github.com/flynnmc15/package625/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/flynnmc15/package625/actions/workflows/R-CMD-check.yaml)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
<!-- badges: end -->

# cortest625() - A Correlation Package

## Project Description
An R package to calculate the correlation coefficient between two vectors of data using 3 different methods: Spearman's rank correlation coefficient, Kendall rank correlation coefficient and Pearson correlation coefficient. All 3 methods were coded from scratch as their own function and implemented into the larger cortest625 function that allows choosing between all 3 methods. A final method called 'all' is also included as an option which gives the output from all 3 methods in a data frame. Future versions of this package will focus more on formatting output, including more output description and including other calculations such as p-values. 

### Installation
```
githubinstall("cortest625")
library(cortest625)
```

### Examples
1) Creating Two Numerical Vectors:
```
x <- c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32)
y <- c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81)
cortest625(x, y, method = "pearson")
```
The default method is pearson, does not need to be specified.

2) Using the mtcars Dataset:
```
cortest625(mtcars$mpg, mtcars$drat, method = "spearman")
```
Spearman rank correlation measures the strength and direction of association between two ranked variables (mpg and drat from mtcars dataset).

3) Randomly Generating Data:
```
cortest625(rnorm(100), rnorm(100), method = "kendall")
```
Spearman rank correlation measures the strength and direction of association between two ranked variables (100 random values generated from normal distribution).

### Credits
Thank you to Professor Jiang and Jingyi Zhai in BIOSTAT 625 for the knowledge on building R packages and hosting them on Github. Hadley Wickham's [R Packages 2nd Edition](https://r-pkgs.org/) was also used to help build this package along with the built-in R dataset mtcars.

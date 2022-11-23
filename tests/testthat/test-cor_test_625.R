test_that("Spearman Correlation", {
  set.seed(18465)
  x <- rnorm(50)
  y <- rnorm(50)
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "spearman"), 0.91515152)
  expect_equal(cortest625(x, y, method = "spearman"), 0.168019208)
})

test_that("Pearson Correlation", {
  set.seed(18465)
  x <- rnorm(50)
  y <- rnorm(50)
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "pearson"), 0.94721925)
  expect_equal(cortest625(x, y, method = "pearson"), 0.14440676)
})


test_that("Kendall Tau", {
  set.seed(18465)
  x <- rnorm(50)
  y <- rnorm(50)
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "kendall"), 0.77777778)
  expect_equal(cortest625(x, y, method = "kendall"), 0.12)
})

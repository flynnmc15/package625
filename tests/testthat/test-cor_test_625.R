test_that("Spearman Correlation", {
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "spearman"), 0.91515152)
})

test_that("Pearson Correlation", {
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "pearson"), 0.94721925)
})


test_that("Kendall Tau", {
  expect_equal(cortest625(c(6, 12, 13, 17, 22, 25, 27, 29, 30, 32), c(45, 47, 39, 58, 68, 76, 75, 74, 78, 81), method = "kendall"), 0.77777778)
})

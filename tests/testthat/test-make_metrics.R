test_that("make_metrics", {
  metrics_list <- make_metrics(metrics = list("example"))
  expect_equal(length(metrics_list), 1)
})

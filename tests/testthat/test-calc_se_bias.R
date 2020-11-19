test_that("calc_se_bias works", {
  data1 <- tibble(metric = "estimate1", value = 1:10, Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data2 <- tibble(metric = "estimate2", value = c(1:5, 11:15), Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data3 <- tibble(metric = "estimate3", value = c(1:5, 11:15), Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data4 <- tibble(metric = "se1", value = 1:10, Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data5 <- tibble(metric = "se2", value = c(1:5, 11:15), Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data6 <- tibble(metric = "se3", value = c(1:5, 11:15), Model = c(1,2,1,2,1,2,1,2,1,2), Method = "hello")
  data <- bind_rows(data1, data2, data3, data4, data5, data6)
  se_by_n <- data %>%
    calc_se_bias(estimates = c("estimate1", "estimate2"), est_se = c("se1", "se2"))

  expect_equal(nrow(se_by_n), 80)
  expect_equal(ncol(se_by_n), 4)
})

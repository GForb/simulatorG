test_that("make_methods", {
  methods <- make_methods(list("example"), list("this is an example") )
  expect_equal(length(methods), 1)
})

test_that("make_method_extensions works", {
  methods <- make_method_extensions(list("example"), list("this is an example") )
  expect_equal(length(methods), 1)

  methods2 <- make_method_extensions(list("example"))
  expect_equal(length(methods2), 1)
})


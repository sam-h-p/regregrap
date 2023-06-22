# Doing the testing for a hypothetical figure_2 function
# before even making function

x <- phase_date_data(regreg)

test_that("figure_2 runs without errors", {
  expect_silent(figure_2(x))
})

test_that("figure_2 outputs a gg, ggplot class", {
  expect_equal(class(figure_2(x)), c("gg", "ggplot"))
})

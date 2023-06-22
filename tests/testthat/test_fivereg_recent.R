# Test failed before when running ctrl shift T
# because x was not defined. Create object before

x <- phase_date_data(regreg)

# pass faulty data frame to second test_that
mtcars_df_slot <- mtcars
mtcars_df_slot$df <- mtcars

manual_fivereg <- "c(\"clinical-commissioning-group\", \"further-education-college-uk\", \"further-education-college-region-uk\", \"school-type-eng\", \"information-sharing-agreement-specified-person-0001\"), c(\"2019-02-07T14:35:35Z\", \"2018-12-19T10:39:48Z\", \"2018-12-19T10:34:35Z\", \"2018-12-13T16:19:41Z\", \"2018-11-01T13:54:08Z\")"

test_that("fivereg_recent runs without errors", {
  expect_silent(fivereg_recent(x)) # this just means
  # silent run without errors
})

test_that("fivereg_recent errors if input is not suitable data.frame", {
  expect_error(fivereg_recent(15))
  expect_error(fivereg_recent(mtcars_df_slot))

})

test_that("fivereg_recent equals manual sorting, with n default to 5", {
  expect_equal(fivereg_recent(x), manual_fivereg)

})



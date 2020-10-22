test_that("present_table", {
  expect_error(present_table(usa_covid_data))
  expect_error(present_table("present_table"))
})

test_that("random_states()", {
  test <- random_states(usa_state_map)
  states <- unique(toupper(usa_state_map$region))
  expect_length(test, 2)
  expect_true(test[1] %in% states)
  expect_true(test[2] %in% states)
})

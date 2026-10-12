# TEMPLATE: tests of the STRUCTURE of your data (columns, types, keys).
# Written-down expectations: if the data changes shape, a test fails.
#
# Extension: the testdat package offers ready-made data expectations
# (e.g. expect_unique(), expect_no_na()-style checks on columns).

testthat::test_that("check_dataset accepts a well-formed table", {
  good <- data.frame(id = 1:3, site = c("a", "b", "c"))
  testthat::expect_no_error(
    check_dataset(x = good, required_columns = "site", id_column = "id")
  )
})

testthat::test_that("check_dataset rejects duplicated ids", {
  bad <- data.frame(id = c(1, 1), site = c("a", "b"))
  testthat::expect_error(
    check_dataset(x = bad, required_columns = "site", id_column = "id")
  )
})

testthat::test_that("processed data has the expected columns", {
  testthat::skip("TEMPLATE: point this at your data")
  # processed <- readRDS(project_path("data", "processed", "my_data.rds"))
  # testthat::expect_named(processed, c("id", "site", "date"), ignore.order = TRUE)
})

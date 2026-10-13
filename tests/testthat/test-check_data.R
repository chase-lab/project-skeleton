# Tests of the FUNCTIONS in R/, here check_dataset() from R/check_data.R.
# Your data is not tested here: it is checked inside the scripts, with
# testthat's expect_*() functions, every time they run. Add one test file per
# file in R/.

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

testthat::test_that("check_dataset rejects a missing required column", {
  bad <- data.frame(id = 1:2)
  testthat::expect_error(
    check_dataset(x = bad, required_columns = "site", id_column = "id")
  )
})

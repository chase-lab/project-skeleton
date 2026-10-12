# TEMPLATE: tests of the VALUES in your data (ranges, allowed categories).
# Extension: the testdat package provides column-level expectations for this.

testthat::test_that("values are in plausible ranges", {
  testthat::skip("TEMPLATE: point this at your data")
  # processed <- readRDS(project_path("data", "processed", "my_data.rds"))
  # testthat::expect_true(all(processed[["temperature"]] > -90))
  # testthat::expect_true(all(is.element(processed[["site"]], c("a", "b", "c"))))
})

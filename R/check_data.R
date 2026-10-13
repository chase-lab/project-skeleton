# Generic data checks built on testthat expectations. This is a TEMPLATE, not a
# package: copy, rename and extend it for your own data.
#
# Why: outside a test file, a failed testthat expectation simply stops the
# script with a clear message, so a wrong input stops the pipeline at the step
# that caused it, not three scripts later.

#' Check the basic structure of a dataset
#'
#' @param x A data frame (or tibble) to check.
#' @param required_columns Character vector of column names that must exist.
#' @param id_column Name of the column that identifies a row. It must have no
#'   missing values and no duplicates.
#'
#' @return `x`, invisibly, so the call can sit inside a pipe.
#'   Stops with an informative error if a check fails.
check_dataset <- function(x, required_columns, id_column) {
  # 1. Is it a table at all?
  testthat::expect_s3_class(object = x, class = "data.frame")
  testthat::expect_gt(object = nrow(x), expected = 0)

  # 2. Are the columns we rely on there?
  testthat::expect_true(
    object = all(is.element(required_columns, colnames(x))),
    info = "a required column is missing"
  )
  testthat::expect_true(
    object = is.element(id_column, colnames(x)),
    info = "the id column is missing"
  )

  # 3. Does the id column identify rows? (no NA, no duplicates)
  testthat::expect_false(
    object = anyNA(x[[id_column]]),
    info = "the id column has missing values"
  )
  testthat::expect_false(
    object = anyDuplicated(x[[id_column]]) > 0,
    info = "the id column has duplicates"
  )

  invisible(x)
}

# Example use in a script, between two wrangling steps:
#   raw |>
#     check_dataset(required_columns = c("site", "date"), id_column = "id") |>
#     dplyr::mutate(...)

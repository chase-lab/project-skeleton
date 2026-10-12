# Generic data checks built on checkmate. This is a TEMPLATE, not a package:
# copy, rename and extend it for your own data.
#
# Why: checkmate asserts fail fast with a clear message, so a wrong input stops
# the pipeline at the step that caused it, not three scripts later.

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
  checkmate::assert_data_frame(x = x, min.rows = 1L)

  # 2. Are the columns we rely on there?
  checkmate::assert_character(x = required_columns, any.missing = FALSE)
  checkmate::assert_subset(x = required_columns, choices = colnames(x))

  # 3. Does the id column identify rows? (no NA, no duplicates)
  checkmate::assert_string(x = id_column)
  checkmate::assert_subset(x = id_column, choices = colnames(x))
  checkmate::assert_vector(
    x = x[[id_column]],
    any.missing = FALSE,
    unique = TRUE,
    .var.name = id_column
  )

  invisible(x)
}

# Example use in a script, between two wrangling steps:
#   raw |>
#     check_dataset(required_columns = c("site", "date"), id_column = "id") |>
#     dplyr::mutate(...)

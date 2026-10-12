# testthat sources every helper-*.R file before running any test, however the
# tests are launched, so shared setup lives here.

# Path to a file in the project root, independent of the working directory.
project_path <- function(...) {
  testthat::test_path("..", "..", ...)
}

# Load every project function so tests can call them directly.
for (function_file in list.files(
  path = project_path("R"),
  pattern = "\\.R$",
  full.names = TRUE
)) {
  source(file = function_file)
}
rm(function_file)

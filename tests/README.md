# tests/

Automated checks of your data and functions, run with testthat.

- `testthat.R`: entry point used by `R CMD check`-style runners.
- `testthat/`: test files (`test-*.R`) and helpers (`helper-*.R`).
- Tracked: everything.

Run all tests: `testthat::test_dir("tests/testthat")`.

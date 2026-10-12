# tests/

Automated tests of the **functions** in `R/`, run with testthat. Your data is
not tested here: it is checked inside the scripts in `scripts/`, with checkmate.

- `testthat.R`: entry point that runs all tests.
- `testthat/`: test files (`test-*.R`) and helpers (`helper-*.R`).
- Tracked: everything.

This project is not a package, so run all tests with:

```r
testthat::test_dir("tests/testthat")
```

# Git hooks

Hooks are small scripts git runs at certain moments. Here they check your work
before it leaves your machine, so mistakes are caught in seconds instead of in
review.

| Hook | Runs | Checks |
|---|---|---|
| `pre-commit` | on `git commit` | `air format --check` and `jarl check` on the staged R files, then the tests |
| `pre-push` | on `git push` | the tests |

## Activate (once per clone)

```sh
git config core.hooksPath .githooks
```

Git does not track `.git/hooks`, so hooks cannot be shared that way. This
folder is tracked, and the line above tells git to look here instead. The
setting is local to your clone: every colleague runs it once.

## Tools

- [air](https://posit-dev.github.io/air/) formats R code. If a file is not
  formatted, the commit is blocked: run `air format .`, `git add` the files, and
  commit again. air formats `.R` files; `.Rmd` and `.qmd` are passed to it too,
  but it may leave them alone depending on the version.
- [jarl](https://jarl.etiennebacher.com/) is a linter that catches likely mistakes.
- Tests run with `Rscript tests/testthat.R`.

air and jarl are optional: if one is not on your `PATH`, the hook prints a
warning with the install link and skips that check. Without `tests/testthat.R`
the tests are skipped with a notice.

## Skip

```sh
git commit --no-verify
git push --no-verify
```

Use it for a work-in-progress commit, not as a habit.

## Turn off

```sh
git config --unset core.hooksPath
```

## Notes

- The checks look at the files in your working folder, not only at what is
  staged. Stage what you want to commit, but format the whole file first.
- The hooks are plain `sh` and must stay executable. If you add one, run
  `chmod +x .githooks/<name>` before `git add`.

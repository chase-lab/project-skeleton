# TEMPLATE step 1: get raw data into data/raw/.
# Keep this script re-runnable: it should recreate data/raw/ from scratch.
# If the data lives outside the repo, read it from a pins board here instead.

raw_dir <- fs::path("data", "raw")
fs::dir_create(path = raw_dir)

# utils::download.file(url = "<DATA URL>", destfile = fs::path(raw_dir, "my_data.csv"))

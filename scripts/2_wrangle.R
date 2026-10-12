# TEMPLATE step 2: clean data/raw/ into data/processed/.
#
# Your DATA is checked here, in the script, at three points: at the door
# (input), after every join or reshaping step, and on the way out (output).
# tests/ only tests the FUNCTIONS in R/, not your data.

library(dplyr)

source(file = fs::path("R", "check_data.R"))

# raw <- utils::read.csv(file = fs::path("data", "raw", "my_data.csv"))
# sites <- utils::read.csv(file = fs::path("data", "raw", "sites.csv"))
#
# # 1. At the door: is the input what you think it is?
# raw |>
#   check_dataset(required_columns = c("id", "site_id"), id_column = "id")
#
# # 2. After a join: say what the join may and may not do.
# #    relationship = "many-to-one": a duplicated site_id in `sites` would
# #    multiply rows, so it stops the script instead.
# #    unmatched = "drop": sites that no row uses are dropped on purpose.
# processed <- left_join(
#   x = raw,
#   y = sites,
#   by = join_by(site_id),
#   relationship = "many-to-one",
#   unmatched = "drop"
# )
# #    A row of `raw` without a site gets NA: stop (`region` comes from `sites`).
# checkmate::assert_character(x = processed[["region"]], any.missing = FALSE)
#
# # 3. On the way out: nothing lost or gained, values plausible.
# checkmate::assert_data_frame(x = processed, nrows = nrow(raw))
# checkmate::assert_numeric(
#   x = processed[["temperature"]],
#   lower = -90,
#   upper = 60,
#   any.missing = FALSE
# )
#
# saveRDS(object = processed, file = fs::path("data", "processed", "my_data.rds"))

# TEMPLATE step 2: clean data/raw/ into data/processed/.
# Check the data at the door and on the way out (see R/check_data.R).

source(file = fs::path("R", "check_data.R"))

# raw <- utils::read.csv(file = fs::path("data", "raw", "my_data.csv"))
# processed <- raw |>
#   check_dataset(required_columns = c("id", "site"), id_column = "id")
# saveRDS(object = processed, file = fs::path("data", "processed", "my_data.rds"))

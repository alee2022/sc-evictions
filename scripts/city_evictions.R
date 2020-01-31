# Download: South Carolina City Eviction Data
# https://data-downloads.evictionlab.org/

# Author: Andrew Lee
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(vroom)
library(here)

# Parameters
cities_csv_url <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
write_path = here::here("data/city_evictions.rds")
col_types = cols_only(
  GEOID = col_integer(),
  year = col_integer(),
  name = col_character(),
  evictions = col_double()
)
vars_rename = c(
  geoid = "GEOID"
)
#===============================================================================
cities_csv_url %>%
  vroom(col_types = col_types) %>%
  rename(!!! vars_rename) %>%
  filter(year == 2016) %>%
  write_rds(write_path, compress = "gz")

# Join: South Carolina City Eviction Data and South Carolina City Boundaries Data

# Author: Andrew Lee
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
city_evictions_loc <- here::here("data/city_evictions.rds")
city_boundaries_loc <- here::here("data/city_boundaries.rds")
write_path <- here::here("data/city_evictions_boundaries.rds")
#===============================================================================
city_evictions <- read_rds(city_evictions_loc)
city_boundaries <- read_rds(city_boundaries_loc)
city_evictions %>%
  left_join(city_boundaries, by = "geoid") %>%
  select(-city_name) %>%
  write_rds(write_path)

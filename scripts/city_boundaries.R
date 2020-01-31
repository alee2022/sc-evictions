# Download: South Carolina City Boundaries Data

# Author: Andrew Lee
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(vroom)
library(here)

# Parameters
boundaries_csv_url <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
write_path = here::here("data/city_boundaries.rds")
vars_rename = c(
  geoid = "GEOID",
  city_name = "n"
)
#===============================================================================
boundaries_csv_url %>%
  sf::read_sf() %>%
  select(GEOID, n, geometry) %>%
  rename(!!! vars_rename) %>%
  mutate(geoid = as.integer(geoid)) %>%
  write_rds(write_path, compress = "gz")


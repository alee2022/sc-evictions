city\_evictions\_boundaries
================
Andrew Lee
2020-01-30

  - [Reading in Data](#reading-in-data)
      - [Finding the City with the Most Evictions in
        2016](#finding-the-city-with-the-most-evictions-in-2016)

``` r
# Libraries
library(tidyverse)

# Parameters
joined_data <- here::here("data/city_evictions_boundaries.rds")
```

## Reading in Data

``` r
df <- read_rds(joined_data)
```

### Finding the City with the Most Evictions in 2016

``` r
df %>% 
  top_n(1, wt = evictions)
```

    ## # A tibble: 1 x 5
    ##     geoid  year name             evictions geometry
    ##     <int> <int> <chr>                <dbl> <list>  
    ## 1 4550875  2016 North Charleston     3660. <XY>

We found that North Charleston had the most evictions in 2016 among the
cities in South Carolina.


<!-- README.md is generated from README.Rmd. Please edit that file -->

# lubrilog <img src="man/figures/lubrilog.png" align="right" height="150" width="150"/>

<!-- badges: start -->

[![R-CMD-check](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/arrismo/lubrilog/graph/badge.svg)](https://app.codecov.io/gh/arrismo/lubrilog)

<!-- badges: end -->

The goal of lubrilog is to provide feedback from a subset of `lubridate`
functions such as `ymd`, `dmy`, `mdy` and `year`.

lubrilog contains a `games` dataset which is a subset of data from games
on Steam. For more information use:

## Inspirations

`lubrilog` would not be possible without the following packages:

- [tidylog](https://github.com/elbersb/tidylog/tree/master?tab=readme-ov-file)
  package
- [lubridate](https://github.com/tidyverse/lubridate) package

`lubrilog` is not affiliated with Posit/RStudio company or the
`lubridate` developer team.

## Installation

## Example

Load `lubrilog` and `lubridate`:

Using the `games` data set let’s clean our `release_date` column:

``` r
head(games)
#>   id                      name release_date platform_windows platform_linux
#> 1  1            Counter-Strike   Nov 1 2000             TRUE           TRUE
#> 2  2     Team Fortress Classic   Apr 1 1999             TRUE           TRUE
#> 3  3             Day of Defeat   May 1 2003             TRUE           TRUE
#> 4  4        Deathmatch Classic   Jun 1 2001             TRUE           TRUE
#> 5  5 Half-Life: Opposing Force   Nov 1 1999             TRUE           TRUE
#> 6  6                  Ricochet   Nov 1 2000             TRUE           TRUE
#>   platform_mac price
#> 1         TRUE  9.99
#> 2         TRUE  4.99
#> 3         TRUE  4.99
#> 4         TRUE  4.99
#> 5         TRUE  4.99
#> 6         TRUE  4.99
```

Lubrilog will give you information about the `lubridate` operation.:

``` r
head(mdy(games$release_date))
#> ✖ NA values created by parsing: 465
#> ✔ Example successful parse:
#> →   Original: Nov 1 2000
#> →   Parsed:   2000-11-01
#> ✖ Example failed parse:
#> →   Original: Coming Soon
#> →   Parsed:   NA
#> [1] "2000-11-01" "1999-04-01" "2003-05-01" "2001-06-01" "1999-11-01"
#> [6] "2000-11-01"
```

## Suggestions

Lubrilog, when paired with `tidylog`, offers a powerful and effective
solution, making it a highly valuable tool:

``` r
library("dplyr")
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library("tidylog",warn.conflicts = FALSE)
games_parsed <- games %>% 
  tidylog::mutate(new_data = mdy(release_date))
#> ✖ NA values created by parsing: 465
#> ✔ Example successful parse:
#> →   Original: Nov 1 2000
#> →   Parsed:   2000-11-01
#> ✖ Example failed parse:
#> →   Original: Coming Soon
#> →   Parsed:   NA
#> mutate: new variable 'new_data' (Date) with 1,932 unique values and 4% NA
```

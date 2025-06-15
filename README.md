
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lubrilog <img src="man/figures/lubrilog.png" align="right" height="150" width="150"/>

<!-- badges: start -->

[![R-CMD-check](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/arrismo/lubrilog/graph/badge.svg)](https://app.codecov.io/gh/arrismo/lubrilog)
[![CRAN](https://img.shields.io/cran/v/lubrilog)](https://cran.r-project.org/package=lubrilog)
![CRAN](https://cranlogs.r-pkg.org/badges/lubrilog)

<!-- badges: end -->

The goal of lubrilog is to provide feedback from a subset of `lubridate`
functions such as `ymd`, `dmy`, `mdy` and `year`.

lubrilog contains a `games` dataset which is a subset of data from games
on Steam. For more information use:

``` r
library(lubrilog)
?games
```

## Inspirations

`lubrilog` would not be possible without the following packages:

- [tidylog](https://github.com/elbersb/tidylog/tree/master?tab=readme-ov-file)
  package
- [lubridate](https://github.com/tidyverse/lubridate) package

## Installation

``` r
# The easiest way to install lubrilog is directly from CRAN:
install.packages("lubrilog")

# Or you can install the development version of lubrilog from GitHub with:
# install.packages("devtools")
devtools::install_github("arrismo/lubrilog")
```

## Example

Load `lubrilog`:

``` r
library("lubrilog")
```

Using the `games` data set let’s clean our `release_date` column:

``` r
head(games$release_date)
#> [1] "Nov 1 2000" "Apr 1 1999" "May 1 2003" "Jun 1 2001" "Nov 1 1999"
#> [6] "Nov 1 2000"
```

Lubrilog will give you information about the `lubridate` operation:

``` r
head(mdy(games$release_date))
#> ✖ NA values created by parsing: 465
#> ✔ Successful parse:
#> →   Original: Nov 1 2000
#> →   Parsed:   2000-11-01
#> ✖ Failed parse:
#> →   Original: Coming Soon
#> →   Parsed:   NA
#> [1] "2000-11-01" "1999-04-01" "2003-05-01" "2001-06-01" "1999-11-01"
#> [6] "2000-11-01"
```

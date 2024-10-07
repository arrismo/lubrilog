
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lubrilog <img src="man/figures/lubrilog.png" align="right" height="140" width="139"/>

<!-- badges: start -->

[![R-CMD-check](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/arrismo/lubrilog/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/arrismo/lubrilog/graph/badge.svg)](https://app.codecov.io/gh/arrismo/lubrilog)

<!-- badges: end -->

The goal of lubrilog is to provide feedback from a subset of `lubridate`
functions such as `ymd`, `dmy`, and `year`.

## Inspirations

`lubrilog` would not be possible without the following packages:

- [tidylog](https://github.com/elbersb/tidylog/tree/master?tab=readme-ov-file)
  package
- [lubridate](https://github.com/tidyverse/lubridate) package

`lubrilog` is not affiliated with Posit/RStudio company or the
`lubridate` developer team.

## Installation

You can install the development version of lubrilog from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("arrismo/lubrilog")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(lubrilog)
## basic example code
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

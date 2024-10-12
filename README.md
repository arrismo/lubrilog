
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

``` r
# The easiest way to install lubrilog is directly from cran:
install.packages("lubrilog")
#> Installing package into 'C:/Users/mmois/AppData/Local/Temp/RtmpCaW2Rb/temp_libpath103c6d7e6211'
#> (as 'lib' is unspecified)
#> Warning: package 'lubrilog' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages

# Or you can install the development version of lubrilog from GitHub with:
# install.packages("devtools")
devtools::install_github("arrismo/lubrilog")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo arrismo/lubrilog@HEAD
#> cpp11 (0.4.7 -> 0.5.0) [CRAN]
#> Installing 1 packages: cpp11
#> Installing package into 'C:/Users/mmois/AppData/Local/Temp/RtmpCaW2Rb/temp_libpath103c6d7e6211'
#> (as 'lib' is unspecified)
#> package 'cpp11' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\mmois\AppData\Local\Temp\RtmpkRztol\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>       ✔  checking for file 'C:\Users\mmois\AppData\Local\Temp\RtmpkRztol\remotes30406ccb361e\arrismo-lubrilog-dba3c8e/DESCRIPTION' (358ms)
#>       ─  preparing 'lubrilog':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts (525ms)
#>   ─  checking for empty or unneeded directories
#>       ─  building 'lubrilog_1.0.0.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/mmois/AppData/Local/Temp/RtmpCaW2Rb/temp_libpath103c6d7e6211'
#> (as 'lib' is unspecified)
```

## Example

Load `lubrilog` and `lubridate`:

``` r
library("lubridate")
#> 
#> Attaching package: 'lubridate'
#> The following objects are masked from 'package:base':
#> 
#>     date, intersect, setdiff, union
library("lubrilog")
#> 
#> Attaching package: 'lubrilog'
#> The following objects are masked from 'package:lubridate':
#> 
#>     dmy, mdy, myd, ydm, year, ymd
```

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

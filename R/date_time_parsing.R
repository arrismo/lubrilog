#' @import lubridate
#' @import cli
#' @export
ymd <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::ymd)
}
#' @export
mdy <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::mdy)
}
#' @export
ydm <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::ydm)
}
#' @export
myd <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::myd)
}
#' @export
dmy <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::dmy)
}
#' @export
year <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::year)
}

#' @export
yq <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::yq)
}
#' @export
ym <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ym)
}
#' @export
my <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::my)
}

#' @export
ydm_h <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ydm_h)
}
#' @export
ymd_h <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ymd_h)
}
#' @export
dmy_h <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::dmy_h)
}
#' @export
mdy_h <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::mdy_h)
}
#' @export
ymd_hms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ymd_hms)
}
#' @export
dmy_hms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::dmy_hms)
}
#' @export
mdy_hms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::mdy_hms)
}
#' @export
ydm_hms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ydm_hms)
}
#' @export
ms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::ms)
}
#' @export
hm <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::hm)
}
#' @export
hms <- function(.data, ...) {
  log_date_time_parse(.data, .fun = lubridate::hms)
}




log_date_time_parse <- function(.data, .fun){
    dates_char <- as.character(.data)

    # Silence the warning message from the lubridate package
    parsed_dates <- tryCatch({
      expr = {parsed_dates <- .fun(dates_char, quiet = TRUE)
      }
    },
    error = function(e){
      parsed_dates <- .fun(dates_char)

      }
    )

    na_count_original <- sum(is.na(dates_char))
    na_count_parsed <- sum(is.na(parsed_dates))
    new_na_count <- na_count_parsed - na_count_original
    success_index <- which(!is.na(parsed_dates))[1]
    failed_index <- which(!is.na(dates_char) & is.na(parsed_dates))[1]

    if(new_na_count > 0){
      cli_alert_danger("NA values created by parsing: {new_na_count}")
    } else {
      cli_alert_success("NA values created by parsing: {new_na_count}")
    }

    # Add successful parse example if exists
    if (!is.na(success_index)) {
        cli_alert_success("Successful parse:")
        cli_alert("  Original: {dates_char[success_index]}")
        cli_alert("  Parsed:   {parsed_dates[success_index]}")
    }

    # Add failed parse example if exists
    if (!is.na(failed_index)) {

      cli_alert_danger("Failed parse:")
      cli_alert("  Original: {dates_char[failed_index]}")
      cli_alert("  Parsed:   NA")
    }
    parsed_dates
}








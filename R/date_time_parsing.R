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

    if(new_na_count ){


    }
    cli_alert_danger("NA values created by parsing: {new_na_count}")

    # Add successful parse example if exists
    if (!is.na(success_index)) {
        cli_alert_success("Example successful parse:")
        cli_alert("  Original: {dates_char[success_index]}")
        cli_alert("  Parsed:   {parsed_dates[success_index]}")
    }

    # Add failed parse example if exists
    if (!is.na(failed_index)) {

      cli_alert_danger("Example failed parse:")
      cli_alert("  Original: {dates_char[failed_index]}")
      cli_alert("  Parsed:   NA")
    }
    parsed_dates
}








#' @import cli
#' @import glue


ymd <- function(.data, ...){
  log_date_time_parse(.data, .fun = lubridate::ymd)
}


log_date_time_parse <- function(.data, .fun){
    dates_char <- as.character(.data)

    parsed_dates <- .fun(dates_char)

    na_count_original <- sum(is.na(dates_char))
    na_count_parsed <- sum(is.na(parsed_dates))
    new_na_count <- na_count_parsed - na_count_original

    success_index <- which(!is.na(parsed_dates))[1]
    failed_index <- which(!is.na(dates_char) & is.na(parsed_dates))[1]
    log_messages <- c(
      glue::glue("NA values created by parsing: {new_na_count}")
    )


    # Add successful parse example if exists
    if (!is.na(success_index)) {
      log_messages <- c(log_messages,
                        glue::glue("Example successful parse:"),
                        glue::glue("  Original: {dates_char[success_index]}"),
                        glue::glue("  Parsed:   {parsed_dates[success_index]}")
      )
    }

    # Add failed parse example if exists
    if (!is.na(failed_index)) {
      log_messages <- c(log_messages,
                        glue::glue("Example failed parse:"),
                        glue::glue("  Original: {dates_char[failed_index]}"),
                        glue::glue("  Parsed:   NA")
      )
    }

    # Print all messages
    cat(paste(log_messages, collapse = "\n"), "\n")

}







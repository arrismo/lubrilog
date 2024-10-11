library(lubrilog)
library(cli)

data <- lubrilog::games


f <- function(){
  cli_alert_danger("NA values created by parsing:")
  cli_alert_danger("Example failed parse:")
  cli_alert("  Original: {dates_char[failed_index]}")
  cli_alert("  Parsed:   NA")
}

test_that("dmy works", {
  expect_message(
    out <- lubrilog::dmy(data$release_date)
    )
  expect_equal(length(out), nrow(data))

})


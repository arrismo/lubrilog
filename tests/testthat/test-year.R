library(lubrilog)
library(cli)

data <- lubrilog::games
data$parsed_date <- lubrilog::mdy(data$release_date)


f <- function(){
  lubrilog::year(data$parsed_date)
}

test_that("year works", {
  expect_message(
    out <- lubrilog::year(data$parsed_date)
  )
  expect_equal(length(out), nrow(data))

  expect_message(f(), "NA values created by parsing")
  expect_message(f(), "Original:")
  expect_message(f(), "Parsed:")
})


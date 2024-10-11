library(lubrilog)
library(cli)

data <- lubrilog::games


f <- function(){
  lubrilog::dmy(data$release_date)
}

test_that("dmy works", {
  expect_message(
    out <- lubrilog::dmy(data$release_date)
    )
  expect_equal(length(out), nrow(data))

  expect_message(f(), "NA values created by parsing")
  expect_message(f(), "Original:")
  expect_message(f(), "Parsed:")
})


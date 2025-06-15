test_that("yq parses year-quarter", {
  expect_equal(as.character(yq("2023-Q2")), as.character(lubridate::yq("2023-Q2")))
})

test_that("ym parses year-month", {
  expect_equal(as.character(ym("2023-06")), as.character(lubridate::ym("2023-06")))
})

test_that("my parses month-year", {
  expect_equal(as.character(my("06-2023")), as.character(lubridate::my("06-2023")))
})

test_that("ydm_h parses year-day-month hour", {
  expect_equal(as.character(ydm_h("2023-15-06 13")), as.character(lubridate::ydm_h("2023-15-06 13")))
})

test_that("ymd_h parses year-month-day hour", {
  expect_equal(as.character(ymd_h("2023-06-15 13")), as.character(lubridate::ymd_h("2023-06-15 13")))
})

test_that("dmy_h parses day-month-year hour", {
  expect_equal(as.character(dmy_h("15-06-2023 13")), as.character(lubridate::dmy_h("15-06-2023 13")))
})

test_that("mdy_h parses month-day-year hour", {
  expect_equal(as.character(mdy_h("06-15-2023 13")), as.character(lubridate::mdy_h("06-15-2023 13")))
})

test_that("ymd_hms parses year-month-day hour:min:sec", {
  expect_equal(as.character(ymd_hms("2023-06-15 13:14:15")), as.character(lubridate::ymd_hms("2023-06-15 13:14:15")))
})

test_that("dmy_hms parses day-month-year hour:min:sec", {
  expect_equal(as.character(dmy_hms("15-06-2023 13:14:15")), as.character(lubridate::dmy_hms("15-06-2023 13:14:15")))
})

test_that("mdy_hms parses month-day-year hour:min:sec", {
  expect_equal(as.character(mdy_hms("06-15-2023 13:14:15")), as.character(lubridate::mdy_hms("06-15-2023 13:14:15")))
})

test_that("ydm_hms parses year-day-month hour:min:sec", {
  expect_equal(as.character(ydm_hms("2023-15-06 13:14:15")), as.character(lubridate::ydm_hms("2023-15-06 13:14:15")))
})

test_that("ms parses minute:second", {
  expect_equal(as.character(ms("10:15")), as.character(lubridate::ms("10:15")))
})

test_that("hm parses hour:minute", {
  expect_equal(as.character(hm("13:14")), as.character(lubridate::hm("13:14")))
})

test_that("hms parses hour:minute:second", {
  expect_equal(as.character(hms("13:14:15")), as.character(lubridate::hms("13:14:15")))
})

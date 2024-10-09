library(lubrilog)


cli::test_that_cli("danger",{
  test_that("dmy works", {
    expect_error(lubrilog::dmy(games$release_date))
  })
})



test_that("dmy works", {
  expect_error(lubrilog::dmy(games$release_date),NA)
})

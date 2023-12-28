test_that("qto_link works", {
  expect_snapshot(
    qto_link("https://quarto.org")
  )

  expect_snapshot(
    qto_link("https://quarto.org", "Quarto website")
  )
})

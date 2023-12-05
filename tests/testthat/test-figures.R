test_that("qto_fig works", {
  expect_snapshot(
    qto_fig("image.jpeg", "Image caption", alt = "Image alt text")
  )
  expect_snapshot(
    qto_fig("graphic.pdf", title = "Title of the graphic")
  )
})

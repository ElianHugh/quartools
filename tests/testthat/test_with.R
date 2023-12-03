test_that("with_*() output is as expected", {
  input <- list(
    with_body_column("foo", attr = ".bar"),
    with_page_column("foo", attr = ".bar"),
    with_screen_inset_column("foo", attr = ".bar"),
    with_screen_column("foo", attr = ".bar"),
    with_margin_column("foo", attr = ".bar")
  )

  lapply(seq_along(input), function(i) {
    expect_snapshot(input[[i]])
  })

  extensions_input <- list(
    with_body_column("foo", attr = ".bar", extension = "left"),
    with_page_column("foo", attr = ".bar", extension = "right"),
    with_screen_inset_column("foo", attr = ".bar", extension = "shaded"),
    with_screen_column("foo", attr = ".bar", extension = "left")
  )

  lapply(seq_along(extensions_input), function(i) {
    expect_snapshot(extensions_input[[i]])
  })
})

test_that("with_*() disallows invalid extensions", {
  input <- list(
    quote(with_body_column(extension = "shaded")),
    quote(with_page_column(extension = "shaded")),
    quote(with_screen_inset_column(extension = "bad")),
    quote(with_screen_column(extension = "shaded")),
    quote(with_margin_column(extension = "shaded"))
  )
  lapply(input, function(x) {
    expect_error(eval(x))
  })
})

test_that("element output is accurate", {
    expect_snapshot(div("Hello world!"))
    expect_snapshot(div("This is a tip!", attr = ".callout-tip"))
    expect_snapshot(span())
    expect_snapshot(span("Hello world!", attr = ".bold"))
})

test_that("unnamed dots throw errors", {
    expect_error(div(x = 1L))
    expect_error(span(x = 2L))
})

test_that("div() output is accurate", {
    expect_true(div() == "\n\n:::{}\n\n\n\n:::\n")
    expect_true(div("Hello world!") == "\n\n:::{}\n\nHello world!\n\n:::\n")
    expect_true(div("This is a tip!", attr = ".callout-tip") == "\n\n:::{.callout-tip}\n\nThis is a tip!\n\n:::\n")
})

test_that("span output is accurate", {
    expect_true(span() == "[]{}")
    expect_true(span("Hello world!", attr = ".bold") == "[Hello world!]{.bold}")
})

test_that("unnamed dots throw errors", {
    expect_error(div(x = 1L))
    expect_error(span(x = 2L))
})
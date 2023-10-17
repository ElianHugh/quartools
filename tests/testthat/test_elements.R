test_that("div() output is accurate", {
    x <- div() |>
        as.character()
    expect_identical(
        x,
        "\n\n:::{}\n\n\n\n:::\n"
    )

    x <- div("Hello world!") |>
        as.character()
    expect_identical(
        x,
        "\n\n:::{}\n\nHello world!\n\n:::\n"
    )

    x <- div("This is a tip!", attr = ".callout-tip") |>
        as.character()
    expect_identical(
        x,
        "\n\n:::{.callout-tip}\n\nThis is a tip!\n\n:::\n"
    )
})

test_that("span output is accurate", {
    x <- span() |>
        as.character()
    expect_identical(x, "[]{}")

    x <- span("Hello world!", attr = ".bold") |>
        as.character()
    expect_identical(x, "[Hello world!]{.bold}")
})

test_that("unnamed dots throw errors", {
    expect_error(div(x = 1))
    expect_error(span(x = 2))
})
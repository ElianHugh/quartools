test_that("with_*() output is as expected", {
    input <- list(
        with_body_column("foo", attr = ".bar"),
        with_page_column("foo", attr = ".bar"),
        with_screen_inset_column("foo", attr = ".bar"),
        with_screen_column("foo", attr = ".bar"),
        with_margin_column("foo", attr = ".bar")
    )
    expectations <- list(
        "\n\n:::{.column-body .bar}\n\nfoo\n\n:::\n",
        "\n\n:::{.column-page .bar}\n\nfoo\n\n:::\n",
        "\n\n:::{.column-screen-inset .bar}\n\nfoo\n\n:::\n",
        "\n\n:::{.column-screen .bar}\n\nfoo\n\n:::\n",
        "\n\n:::{.column-margin .bar}\n\nfoo\n\n:::\n"
    )

    lapply(seq_along(input), function(i) {
        expect_true(input[[i]] == expectations[[i]])
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


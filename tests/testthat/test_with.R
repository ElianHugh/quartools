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

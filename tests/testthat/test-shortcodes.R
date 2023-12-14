test_that("qto_shortcode works", {
    expect_error(
        qto_shortcode()
    )
    expect_snapshot(
        qto_video("https://www.youtube.com/embed/wo9vZccmqwc")
    )
    expect_snapshot(
        qto_pagebreak()
    )
    expect_identical(
        qto_kbd("Shift", "Ctrl", "P"),
        qto_kbd("Shift-Ctrl-P")
    )
    expect_snapshot(
        qto_kbd(
            mac = "Shift-Command-O",
            win = "Shift-Control-O",
            linux = "Shift-Ctrl-L"
        )
    )
})

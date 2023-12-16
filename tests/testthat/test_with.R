test_that("with_*() output is as expected", {
    expect_snapshot(with_body_column("foo", .attributes = ".bar"))
    expect_snapshot(with_page_column("foo", .attributes = ".bar"))
    expect_snapshot(with_screen_inset_column("foo", .attributes = ".bar"))
    expect_snapshot(with_screen_column("foo", .attributes = ".bar"))
    expect_snapshot(with_margin_column("foo", .attributes = ".bar"))

    expect_snapshot(with_body_column("foo", .attributes = ".bar", extension = "left"))
    expect_snapshot(with_page_column("foo", .attributes = ".bar", extension = "right"))
    expect_snapshot(with_screen_inset_column("foo", .attributes = ".bar", extension = "shaded"))
    expect_snapshot(with_screen_column("foo", .attributes = ".bar", extension = "left"))
})

test_that("with_*() disallows invalid extensions", {
    expect_error(with_body_column(extension = "shaded"))
    expect_error(with_page_column(extension = "shaded"))
    expect_error(with_screen_inset_column(extension = "bad"))
    expect_error(with_screen_column(extension = "shaded"))
    expect_error(with_margin_column(extension = "shaded"))
})

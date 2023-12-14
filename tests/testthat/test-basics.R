test_that("qto basics works", {
    expect_snapshot(
        qto_heading("Heading 1")
    )
    expect_snapshot(
        qto_hr()
    )
})

test_that("qto_span errors", {
    expect_error(qto_span())
})

test_that("qto_span works", {
    expect_identical(
        qto_span("Text"),
        qto_block("[Text]{}")
    )

    expect_snapshot(
        qto_span("Text", id = "value")
    )
})

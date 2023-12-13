test_that("qto_block works", {
    expect_s3_class(qto_block(), "quarto_block")
    expect_type(qto_block(), "character")
    expect_length(qto_block(), 1)
})

test_that("qto_div works", {
    expect_snapshot(qto_div("Example text.", id = "id", class = "class"))
})

check_types <- function(lst) {
    res <- vapply(lst, function(x) {
        "quarto_block" %in% class(x)
    }, logical(1L))
    all(res)
}

test_that("mapping function is resolved correctly", {
    expect_type(resolve_mapping_function(f = ~.x + 1L), "closure")
})

test_that("map_qto works", {
    qto_list <- map_qto(
        list("This is a note.", "And this is a note.", "And this is a note"),
        .type = "callout"
    )
    expect_length(qto_list, 3L)
    expect_true(check_types(qto_list))
    expect_snapshot(qto_list)


    qto_list <- map_qto(
        list("foo", "bar", "baz"),
        .f = function(x) x
    )
    expect_length(qto_list, 3L)
    expect_true(check_types(qto_list))
    expect_snapshot(qto_list)
})

test_that("pmap_qto works", {
    qto_list <- pmap_qto(
        list(
            list("Answer: ", "Answer: ", "Answer: "),
            list("Yes", "No", "Yes")
        )
    )
    expect_length(qto_list, 3L)
    expect_true(check_types(qto_list))
    expect_snapshot(qto_list)
})

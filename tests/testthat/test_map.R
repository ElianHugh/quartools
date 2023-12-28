check_types <- function(lst) {
    res <- vapply(lst, function(x) {
        "quarto_block" %in% class(x)
    }, logical(1L))
    all(res)
}

test_that("resolve_mapping_function works", {
    expect_type(resolve_mapping_function(f = ~ .x + 1L), "closure")

    block_fn <- resolve_mapping_function(type = "block")
    expect_identical(
        block_fn("Hello", c("world", "!"), sep = " ", collapse = " "),
        qto_block("Hello", c("world", "!"), sep = " ", collapse = " ")
    )

    div_fn <- resolve_mapping_function(type = "div")
    expect_identical(
        div_fn("foo", "bar", "baz", collapse = " "),
        qto_div("foo", "bar", "baz", collapse = " ")
    )

    callout_fn <- resolve_mapping_function(type = "callout")
    expect_identical(
        callout_fn("foo", "baz", collapse = TRUE),
        qto_callout("foo", "baz", collapse = TRUE)
    )

    heading_fn <- resolve_mapping_function(type = "heading")
    expect_identical(
        heading_fn("foo", "baz", sep = " ", collapse = " "),
        qto_heading("foo", "baz", sep = " ", collapse = " ")
    )

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
        list(
            c("foo", "bar", "baz"),
            c("a", "b", "c")
        ),
        .f = function(x) x,
        .collapse = " "
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


    qto_list <- pmap_qto(
        mtcars[seq(3L), seq(3L)],
        function(mpg, cyl, disp) {
            qto_li(
                .list = list(
                    sprintf("mpg is: %s", mpg),
                    sprintf("cyl is: %s", cyl),
                    sprintf("disp is: %s", disp)
                )
            )
        }
    )
    expect_length(qto_list, 3L)
    expect_true(check_types(qto_list))
    expect_snapshot(qto_list)
})


test_that("mdapply works", {
    input <- list(
        list(type = "tip", msg = "a tip"),
        list(type = "warning", msg = "a warning"),
        list(type = "message", msg = "a message")
    )
    res <- mdapply(
        input,
        function(x) {
            div(x$msg, attr = sprintf(".callout-%s", x$type))
        }
    )
    expect_true(
        res == "\n\n:::{.callout-tip}\n\na tip\n\n:::\n\n\n:::{.callout-warning}\n\na warning\n\n:::\n\n\n:::{.callout-message}\n\na message\n\n:::\n" # nolint: line_length_linter.
    )
})

test_that("mdapply works", {
    input <- list(
        list(type = "tip", msg = "a tip"),
        list(type = "warning", msg = "a warning"),
        list(type = "message", msg = "a message")
    )
    expect_snapshot(
        mdapply(
            input,
            function(x) {
                div(x$msg, attr = sprintf(".callout-%s", x$type))
            }
        )
    )
})
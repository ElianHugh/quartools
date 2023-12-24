test_that("qto_attributes work", {
    expect_identical(
        qto_attributes(),
        "{}"
    )
    expect_identical(
        qto_attributes(class = "foo", id = "bar"),
        "{#bar .foo}"
    )
    expect_identical(
        qto_attributes(
            class = c("foo", "bar", "baz"),
            id = c("foo", "bar", "baz")
        ),
        "{#foo #bar #baz .foo .bar .baz}"
    )
})
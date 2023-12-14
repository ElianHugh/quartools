test_that("lists work", {
    expect_snapshot(qto_li(LETTERS[1:2]))
    expect_snapshot(qto_ol(LETTERS[3:4]))
    expect_snapshot(qto_dl("Term" = "Definition"))
})

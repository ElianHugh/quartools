#' @export
with_body_column <- function(..., outset = FALSE) {
    if (isTRUE(outset)) {
        div(..., attr = ".column-body-outset")
    } else {
        div(..., attr = ".column-body")
    }
}

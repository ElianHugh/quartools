#' @importFrom rlang %||%
NULL

#' Create a quarto div element
#' @description todo
#' @export
#' @family elements
div <- function(..., attr = NULL) {
    out <- "\n\n:::{%s}\n\n%s\n\n:::\n"

    args <- rlang::dots_list(...)
    attr <- attr %||% ""
    content <- args |>
        unname() |>
        paste0(collapse = "\n\n")

    structure(
        sprintf(out, attr, content),
        class = "knit_asis"
    )
}

#' Create a quarto span element
#' @description todo
#' @export
#' @family elements
span <- function(..., attr = NULL) {
    out <- "[%s]{%s}"

    args <- rlang::dots_list(...)
    attr <- attr %||% ""
    content <- args |>
        unname() |>
        paste0(collapse = " ")

    structure(
        sprintf(out, content, attr),
        class = "knit_asis"
    )
}


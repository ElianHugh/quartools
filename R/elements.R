#' Create a quarto div element
#' @description
#' Create a div block element with optional attributes to assign to it. Dots
#' is collapsed into a single character vector with a newline between each element.
#'
#' If attr is a vector with a length > 1,
#' attributes will be combined into a single character vector via [base::paste0].
#' @param ... todoc
#' @param attr todoc
#' @examples
#' div("Hello world!", attr = ".callout-tip")
#' @return character vector of length 1
#' @family elements
#' @export
div <- function(..., attr = NULL) {
    out <- "\n\n:::{%s}\n\n%s\n\n:::\n"

    args <- rlang::dots_list(...)
    attr <- attr %||% "" |>
        paste0(collapse = " ")
    content <- args |>
        unname() |>
        paste0(collapse = "\n\n")

    structure(
        sprintf(out, attr, content),
        class = "knit_asis"
    )
}

#' Create a quarto span element
#' @description
#' Create a span element with optional attributes to assign to it. Dots
#' is collapsed into a single character vector with a space between each element.
#'
#' If attr is a vector with a length > 1,
#' attributes will be combined into a single character vector via [base::paste0].
#' @param ... todoc
#' @param attr todoc
#' @examples
#' span("Hello world!", attr = ".bold")
#' @return character vector of length 1
#' @family elements
#' @export
span <- function(..., attr = NULL) {
    out <- "[%s]{%s}"

    args <- rlang::dots_list(...)
    attr <- attr %||% "" |>
        paste0(collapse = " ")
    content <- args |>
        unname() |>
        paste0(collapse = " ")

    structure(
        sprintf(out, content, attr),
        class = "knit_asis"
    )
}


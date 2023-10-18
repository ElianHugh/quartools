#' Create a quarto div element
#' @description
#' Create a div block element with optional attributes to assign to it. Dots
#' are collapsed into a single character vector with a newline between each element.
#'
#' If attr is a vector with a length > 1, attributes will be combined into a
#' single character vector via [base::paste0].
#' @param ... unnamed values that can be coerced to character vectors
#' @param attr values that can be coerced to character vectors
#' @examples
#' # Create a quarto tip callout
#' div("Hello world!", attr = ".callout-tip")
#'
#' # div calls can be nested
#' div(
#'  div("Hello world!"),
#'  attr = ".my_class"
#' )
#' @return character vector of length 1
#' @family elements
#' @export
div <- function(..., attr = NULL) {
    rlang::check_dots_unnamed()

    out <- "\n\n:::{%s}\n\n%s\n\n:::\n"
    args <- rlang::dots_list(...)
    attr <- attr %||% "" |>
        paste0(collapse = " ")
    content <- args |>
        paste0(collapse = "\n\n")

    structure(
        sprintf(out, attr, content),
        class = "knit_asis"
    )
}

#' Create a quarto span element
#' @description
#' Create a span element with optional attributes to assign to it. Dots
#' are collapsed into a single character vector with a space between each element.
#'
#' If attr is a vector with a length > 1, attributes will be combined into a single
#'  character vector via [base::paste0].
#' @inheritParams div
#' @examples
#' span("Hello world!", attr = ".bold")
#' @return character vector of length 1
#' @family elements
#' @export
span <- function(..., attr = NULL) {
    rlang::check_dots_unnamed()

    out <- "[%s]{%s}"
    args <- rlang::dots_list(...)
    attr <- attr %||% "" |>
        paste0(collapse = " ")
    content <- args |>
        paste0(collapse = " ")

    structure(
        sprintf(out, content, attr),
        class = "knit_asis"
    )
}

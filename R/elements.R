#' Create a quarto div element
#' @description
#' Create a div block element with optional attributes to assign to it. Dots
#' are collapsed into a single character vector with a newline between each
#' element.
#'
#' If attr is a vector with a length > 1, attributes will be combined into
#' a single character vector via [base::paste0].
#' @param ... unnamed values that can be coerced to character vectors
#' @param attr values that can be coerced to character vectors
#' @examples
#' # Create a quarto tip callout
#' div("Hello world!", attr = ".callout-tip")
#'
#' # div calls can be nested
#' div(
#'   div("Hello world!"),
#'   attr = ".my_class"
#' )
#' @return character vector of length 1
#' @family elements
#' @keywords internal
#' @export
div <- function(..., attr = NULL) {
  rlang::check_dots_unnamed()

  template_string <- "\n\n:::{%s}\n\n%s\n\n:::\n"
  dots <- rlang::dots_list(...)
  attribs <- paste0(attr %||% "", collapse = " ")
  content <- paste0(dots, collapse = "\n\n")

  structure(
    sprintf(template_string, attribs, content),
    class = c("knit_asis", "quarto_block")
  )
}

#' Create a quarto span element
#' @description
#' Create a span element with optional attributes to assign to it. Dots
#' are collapsed into a single character vector with a space between
#' each element.
#'
#' If attr is a vector with a length > 1, attributes will be combined into
#' a single character vector via [base::paste0].
#' @inheritParams div
#' @examples
#' span("Hello world!", attr = ".bold")
#' @return character vector of length 1
#' @family elements
#' @keywords internal
#' @export
span <- function(..., attr = NULL) {
  rlang::check_dots_unnamed()

  template_string <- "[%s]{%s}"
  dots <- rlang::dots_list(...)
  attribs <- paste0(attr %||% "", collapse = " ")
  content <- paste0(dots, collapse = " ")

  structure(
    sprintf(template_string, content, attribs),
    class = c("knit_asis", "quarto_block")
  )
}

#' Convert to markdown chunk
#' @description
#' This is a wrapper around [base::paste0] which sets the class of the resulting
#' character vector to "knit_asis". This means that the [knitr::knitr] engine will render
#' the character vector as markdown content, rather than as an R value.
#' @param ... dots to convert to character vector
#' @inheritParams base::paste0
#' @examples
#' as_markdown(c("Hello world!"))
#' @return character vector of length 1
#' @export
as_markdown <- function(..., collapse = "") {
  structure(
    paste0(..., collapse = collapse),
    class = c("knit_asis", "quarto_block")
  )
}

#' Markdown Apply
#' @description
#' Generate markdown by applying a function to a list of elements.
#' The function is expected to return an object that can be coerced to a character
#' vector.
#'
#' The final result will be converted via [quartools::as_markdown] to a valid
#' markdown chunk.
#' @param x a vector, expression, or any object coercible to a list
#' @param fun function to apply to each element of x
#' @param ... optional arguments to fun
#' @examples
#' my_list <- list("A", "B", "C")
#' mdapply(my_list, div)
#' @return character vector of length 1
#' @seealso [base::lapply] [quartools::as_markdown]
#' @export
mdapply <- function(x, fun, ...) {
  res <- do.call(
    lapply,
    args = list(X = x, FUN = fun, ... = ...)
  )
  as_markdown(res)
}

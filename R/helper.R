#' Convert to markdown chunk
#' @description
#' Given x, collapse each element of x so that a character vector
#' of length 1 is returned, and order knitr to render the result "asis".
#' @param x object to convert to character vector
#' @param collapse arg passed to [base::paste0]
#' @return character vector of length 1
#' @export
as_markdown <- function(x, collapse = "") {
    structure(
        paste0(x, collapse = collapse),
        class = "knit_asis"
    )
}

#' Markdown Apply
#' @description
#' Generate markdown by applying a function to a list of elements.
#' The function is expected to return valid markdown content.
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

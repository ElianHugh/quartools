#' @export
as_markdown <- function(x) {
    structure(
        paste0(x, collapse = ""),
        class = "knit_asis"
    )
}

#' Markdown Apply
#' @description
#' Generate markdown by applying a function to a list of elements.
#' The function is expected to return valid markdown content.
#' @param x a vector, expression, or any object coercible to a list
#' @param fun function to apply to each element of x
#' @param ... optional arguments to fun
#' @examples
#' my_list <- list("A", "B", "C")
#' mdapply(my_list, div)
#' @export
#' @seealso [base::lapply]
mdapply <- function(x, fun, ...) {
    res <- do.call(
        lapply,
        args = list(X = x, FUN = fun, ... = ...)
    )
    as_markdown(res)
}

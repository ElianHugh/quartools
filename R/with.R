#' Temporarily modify page layout
#' @description
#' Create a div block that modifies the current quarto layout column temporarily.
#'
#' See [the Quarto documentation for a full list
#' of available extension options](https://quarto.org/docs/authoring/article-layout.html#available-columns).
#' @param ... arguments to pass to [quartools::div]
#' @param outset should the outset affix be applied to the column class?
#' @param extension affix class to apply to column class
#' @export
#' @examples
#' with_body_column("Hello world!")
#' @rdname page-layout
with_body_column <- function(..., outset = FALSE, extension = NULL) {
    check_extension_arg(extension, c("left", "right"))
    cls <- ".column-body%s%s"
    div(
        ...,
        attr = sprintf(
            cls,
            if (isTRUE(outset)) "-outset" else "",
            if (!is.null(extension)) paste0("-", extension) else ""
        )
    )
}

#' @export
#' @rdname page-layout
with_page_column <- function(..., extension = NULL) {
    check_extension_arg(extension, c("left", "right"))
    cls <- ".column-page%s"
    div(
        ...,
        attr = sprintf(
            cls,
            if (!is.null(extension)) paste0("-", extension) else ""
        )
    )
}

#' @export
#' @rdname page-layout
with_screen_inset_column <- function(..., extension = NULL) {
    check_extension_arg(extension, c("left", "right", "shaded"))
    cls <- ".column-screen-inset%s"
    div(
        ...,
        attr = sprintf(
            cls,
            if (!is.null(extension)) paste0("-", extension) else ""
        )
    )
}

#' @export
#' @rdname page-layout
with_screen_column <- function(..., extension = NULL) {
    check_extension_arg(extension, c("left", "right"))
    cls <- ".column-screen%s"
    div(
        ...,
        attr = sprintf(
            cls,
            if (!is.null(extension)) paste0("-", extension) else ""
        )
    )
}

#' @export
#' @rdname page-layout
with_margin_column <- function(...) {
    div(..., attr = ".column-margin")
}

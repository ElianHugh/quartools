#' TODO
#' @description
#' TODO
#' @param ... todo
#' @param outset todo
#' @param extension todo
#' @export
#' @family page layout functions
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

#' TODO
#' @description
#' TODO
#' @param ... todo
#' @param outset todo
#' @param extension todo
#' @export
#' @family page layout functions
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

#' TODO
#' @description
#' TODO
#' @param ... todo
#' @param outset todo
#' @param extension todo
#' @export
#' @family page layout functions
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

#' TODO
#' @description
#' TODO
#' @param ... todo
#' @param outset todo
#' @param extension todo
#' @export
#' @family page layout functions
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

#' TODO
#' @description
#' TODO
#' @param ... todo
#' @export
#' @family page layout functions
with_margin_column <- function(...) {
    div(..., attr = ".column-margin")
}

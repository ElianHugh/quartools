handle_extensions <- function(extension, valid_extensions) {
    if (!is.null(extension)) {
        rlang::arg_match0(extension, valid_extensions)
        extension_string <- paste0("-", extension)
        return(extension_string)
    }
    ""
}

#' Temporarily modify page layout
#' @description
#' Create a div block that modifies the current quarto layout column temporarily.
#'
#' See [the Quarto documentation for a full list
#' of available extension options](https://quarto.org/docs/authoring/article-layout.html#available-columns).
#' @param outset If `TRUE`, the ouset affix is applied to the column class
#' @param extension affix to apply to column class
#' @inheritParams qto_div
#' @inheritDotParams qto_div
#' @export
#' @examples
#' with_body_column("Hello world!")
#' @return character vector of length 1
#' @rdname page-layout
with_body_column <- function(...,
                             outset = FALSE,
                             id = NULL,
                             class = NULL,
                             extension = NULL,
                             .attributes = NULL,
                             .call = caller_env()) {
    extension_string <- handle_extensions(extension, c("left", "right"))
    outset_string <- ifelse(isTRUE(outset), "-outset", "")
    cls <- sprintf(".column-body%s%s", outset_string, extension_string)
    .attributes <- c(cls, as.list(.attributes))
    .attributes <- list_drop_empty(.attributes)
    qto_div(
        ...,
        id = id,
        .attributes = .attributes,
        .call = .call
    )
}

#' @export
#' @rdname page-layout
with_page_column <- function(...,
                             id = NULL,
                             class = NULL,
                             extension = NULL,
                             .attributes = NULL,
                             .call = caller_env()) {
    extension_string <- handle_extensions(extension, c("left", "right"))
    cls <- sprintf(".column-page%s", extension_string)
    .attributes <- c(cls, as.list(.attributes))
    .attributes <- list_drop_empty(.attributes)
    qto_div(
        ...,
        id = id,
        .attributes = .attributes,
        .call = .call
    )
}

#' @export
#' @rdname page-layout
with_screen_inset_column <- function(...,
                                     id = NULL,
                                     class = NULL,
                                     extension = NULL,
                                     .attributes = NULL,
                                     .call = caller_env()) {
    extension_string <- handle_extensions(extension, c("left", "right", "shaded"))
    cls <- sprintf(".column-screen-inset%s", extension_string)
    .attributes <- c(cls, as.list(.attributes))
    .attributes <- list_drop_empty(.attributes)
    qto_div(
        ...,
        id = id,
        .attributes = .attributes,
        .call = .call
    )
}

#' @export
#' @rdname page-layout
with_screen_column <- function(...,
                               id = NULL,
                               class = NULL,
                               extension = NULL,
                               .attributes = NULL,
                               .call = caller_env()) {
    extension_string <- handle_extensions(extension, c("left", "right"))
    cls <- sprintf(".column-screen%s", extension_string)
    .attributes <- c(cls, as.list(.attributes))
    .attributes <- list_drop_empty(.attributes)
    qto_div(
        ...,
        id = id,
        .attributes = .attributes,
        .call = .call
    )
}

#' @export
#' @rdname page-layout
with_margin_column <- function(...,
                               id = NULL,
                               .attributes = NULL,
                               .call = caller_env()) {
    .attributes <- c(".column-margin", as.list(.attributes))
    .attributes <- list_drop_empty(.attributes)
    qto_div(
        ...,
        id = id,
        .attributes = .attributes,
        .call = .call
    )
}

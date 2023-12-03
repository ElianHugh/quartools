#' Create an attribute string for a div or span
#'
#' @param id Div or span identifier
#' @param class Div or span class
#' @param css If `{htmltools}` is installed, a list of css style attributes to
#'   pass to [htmltools::css()].
#' @param .attributes Optional list of attributes. If supplied, any attributes
#'   passed to `...` are ignored.
#' @param .output Ouput type. If "embrace", the returned attributes are enclosed
#'   in curley brackets.
#' @param .drop_empty If `TRUE`, empty attributes are dropped.
#' @examples
#' qto_attributes(id = "id", class = "class")
#'
#' qto_attributes(class = "class", key1 = "val", key2 = "val")
#'
#' qto_attributes(width = 4)
#'
#' @export
qto_attributes <- function(id = NULL,
                           class = NULL,
                           css = NULL,
                           ...,
                           .attributes = NULL,
                           .output = "embrace",
                           .drop_empty = TRUE) {
  if (is_string(id) && !grepl("^#", id)) {
    id <- paste0("#", id)
  }

  if (is_string(class) && !grepl("^\\.", class)) {
    class <- paste0(".", class)
  }

  if (!is.null(css) && is_installed("htmltools")) {
    css <- htmltools::css(!!!css)
  }

  .attributes <- as_qto_attr(
    ...,
    .attributes = .attributes,
    .drop_empty = .drop_empty,
    .collapse = " "
  )

  if (is.null(c(id, class, css, .attributes))) {
    return("")
  }

  .attributes <- paste0(c(id, class, css, .attributes), collapse = " ")

  switch(.output,
    embrace = embrace(.attributes),
    .attributes
  )
}

#' Helper function to create key-value attribute strings
#'
#' @noRd
as_qto_attr <- function(...,
                        .attributes = NULL,
                        op = "=",
                        before = "",
                        after = "",
                        .collapse = " ",
                        .drop_empty = TRUE,
                        .drop_na = TRUE,
                        .replacement = NULL) {
  .attributes <- .attributes %||% dots_list(...)

  if (.drop_empty) {
    .attributes <- list_drop_empty(.attributes)
  }

  if (is_empty(.attributes)) {
    return(NULL)
  }

  stopifnot(
    is_named(.attributes)
  )

  .attributes <- list_drop_or_replace_na(
    .attributes,
    drop_na = .drop_na,
    replacement = .replacement
  )

  .attributes <- paste0(
    names(.attributes), op, qto_attr_values(.attributes),
    collapse = .collapse
  )

  paste0(before, .attributes, after)
}


#' Helper function to sanitize attribute values
#'
#' @noRd
qto_attr_values <- function(values, mark = "'") {
  vapply(
    values,
    \(x) {
      if (is.logical(x)) {
        return(tolower(x))
      }
      # FIXME: Percent values are enclosed in quotes, e.g. 60%, but should not
      # be
      if (is.character(x)) {
        return(combine(x, mark, mark))
      }
      as.character(x)
    },
    NA_character_
  )
}

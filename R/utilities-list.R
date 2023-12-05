#' Drop or replace NA items from a list
#'
#' @param drop_na If `TRUE`, drop `NA` values from the supplied list.
#' @param replacement If not `NULL`, replace NA values from the supplied list
#'   with the value of replacement.
#' @keywords internal
list_drop_or_replace_na <- function(x,
                                    drop_na = FALSE,
                                    replacement = "") {
  if (drop_na) {
    return(list_drop_na(x))
  }

  list_replace_na(x, replacement)
}

#' Drop empty items from a list
#'
#' @noRd
list_drop_empty <- function(x) {
  x[!vapply(x, is_empty, TRUE)]
}

#' Drop NA items from a list
#'
#' @noRd
list_drop_na <- function(x) {
  x[!is.na(x)]
}

#' Replace NA items in a list
#'
#' @noRd
list_replace_na <- function(x,
                            replacement = "",
                            call = caller_env()) {
  if (!any(is.na(x))) {
    return(x)
  }

  if (!is.null(replacement)) {
    x[is.na(x)] <- replacement
  }

  x
}

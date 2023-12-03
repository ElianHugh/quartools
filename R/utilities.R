#' @noRd
combine <- function(x, before = "", after = before, allow_empty = TRUE) {
  if (!allow_empty && x == "") {
    return(x)
  }

  paste0(before, x, after)
}

#' @noRd
embrace <- function(x, before = "{", after = "}", allow_empty = TRUE) {
  combine(x, before, after, allow_empty)
}

#' @noRd
bracket <- function(x, before = "[", after = "]", allow_empty = TRUE) {
  combine(x, before, after, allow_empty)
}

#' @noRd
parentheses <- function(x, before = "(", after = ")", allow_empty = TRUE) {
  combine(x, before, after, allow_empty)
}

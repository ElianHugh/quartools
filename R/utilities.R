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

#' @noRd
build_readme_qmd <- function(path = ".", quiet = TRUE, ...) {
  check_installed("quarto")

  qmd_path <- file.path(path, "README.qmd")

  if (is_installed("quarto") && file.exists(qmd_path)) {
    quarto::quarto_render(input = qmd_path, output_file = "README.md", quiet = quiet, ...)
  }
}

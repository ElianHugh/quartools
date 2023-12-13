#' Combine a string with text before and after
#'
#' @param x An input string.
#' @param before,after Text to insert before and after the supplied string.
#' @param allow_empty If `TRUE`, allow empty string ("") values as input. If
#'   `FALSE`, error on empty string inputs.
#' @param allow_null If `TRUE`, allow `NULL` values as input (replaced with an
#'   empty string ""). If `FALSE`, error on `NULL` inputs.
#' @keywords internal
combine <- function(x,
                    before = "",
                    after = before,
                    allow_empty = TRUE,
                    allow_null = TRUE) {
  check_string(x, allow_empty = allow_empty, allow_null = allow_null)

  paste0(before, x %||% "", after)
}

#' @noRd
embrace <- function(x,
                    before = "{",
                    after = "}",
                    allow_empty = TRUE,
                    allow_null = TRUE) {
  combine(x, before, after, allow_empty, allow_null)
}

#' @noRd
bracket <- function(x,
                    before = "[",
                    after = "]",
                    allow_empty = TRUE,
                    allow_null = TRUE) {
  combine(x, before, after, allow_empty, allow_null)
}

#' @noRd
parentheses <- function(x,
                        before = "(",
                        after = ")",
                        allow_empty = TRUE,
                        allow_null = TRUE) {
  combine(x, before, after, allow_empty, allow_null)
}

#' @noRd
build_readme_qmd <- function(path = ".", quiet = TRUE, ...) {
  if (path == ".") {
    path <- file.path(getwd(), "README.qmd")
  }

  if (file.exists(path)) {
    check_installed("quarto")

    quarto::quarto_render(
      input = path,
      output_file = "README.md",
      quiet = quiet,
      ...
    )
  }
}

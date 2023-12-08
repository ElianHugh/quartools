#' @noRd
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
  check_installed("quarto")

  qmd_path <- file.path(path, "README.qmd")

  if (is_installed("quarto") && file.exists(qmd_path)) {
    quarto::quarto_render(
      input = qmd_path,
      output_file = "README.md",
      quiet = quiet,
      ...
      )
  }
}

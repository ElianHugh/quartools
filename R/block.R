#' Create a block of text to render as Markdown text in Quarto
#'
#' [qto_block()] based on [as_markdown()]
#'
#' @param ... dots to convert to character vector
#' @inheritParams base::paste0
#' @examples
#' as_markdown(c("Hello world!"))
#' @return character vector of length 1
#' @seealso
#' - [as_markdown()]
#' - [knitr::asis_output()]
#'
#' @export
qto_block <- function(..., collapse = "", call = caller_env()) {
  check_dots_unnamed(call = call)
  structure(
    paste0(..., collapse = collapse),
    class = c("knit_asis", "quarto_block")
  )
}

#' Create a Quarto div with optional classes, attributes, and other identifiers
#'
#' <https://quarto.org/docs/authoring/markdown-basics.html#divs-and-spans>
#'
#' @inheritParams qto_attributes
#' @param .content If `.content` is supplied, any values passed to `...` are
#'   ignored. If `.content` is `NULL`, it is set as all values passed to `...`.
#' @param sep,collapse Passed to [base::paste0()] with `.content.`
#' @param drop_empty If `TRUE`, drop empty values from `.content` or `...`
#' @param drop_na If `TRUE`, drop `NA` values from `.content` or `...`
#' @param fence If numeric, `fence` must be a minimum of 3 and sets the number
#'   of times the standard fence character ":" should be repeated. If character,
#'   `fence` is used as is.
#' @inheritParams qto_block
#' @seealso
#' - [div()]
#' - [qto_callout_block()]
#' @examples
#'
#' # div with an ID
#' qto_div(
#'   "This content can be styled with a border",
#'   class = "border"
#' )
#'
#' # Nested div
#' qto_div(
#'   qto_div("Here is a warning.", class = "warning"),
#'   "More content.",
#'   id = "special",
#'   class = "sidebar",
#'   fence = 5
#' )
#'
#' @export
qto_div <- function(...,
                    id = NULL,
                    class = NULL,
                    css = NULL,
                    .attributes = NULL,
                    .content = NULL,
                    sep = " ",
                    collapse = "",
                    fence = ":::",
                    drop_empty = TRUE,
                    drop_na = TRUE,
                    call = caller_env()) {
  .attributes <- qto_attributes(
    id = id,
    class = class,
    css = css,
    .attributes = .attributes
  )

  rlang::check_dots_unnamed()

  .content <- .content %||% rlang::dots_list(...)

  if (drop_empty) {
    .content <- list_drop_empty(.content)
  }

  if (drop_na) {
    .content <- list_drop_na(.content)
  }

  if (is.numeric(fence)) {
    stopifnot(fence < 3)
    fence <- strrep(":", fence)
  }

  qto_block(
    "\n", fence, " ", .attributes, "\n",
    paste0(.content, sep = sep, collapse = collapse),
    "\n", fence, "\n",
    call = call
  )
}

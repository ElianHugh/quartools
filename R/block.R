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
qto_block <- function(..., sep = "", collapse = "", call = caller_env()) {
  check_dots_unnamed(call = call)
  structure(
    paste(..., sep = sep, collapse = collapse),
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
#' @param collapse Passed to [base::paste0()] with `.content.`
#' @param drop_empty If `TRUE`, drop empty values from `.content` or `...`
#' @param drop_na If `TRUE`, drop `NA` values from `.content` or `...`
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
                    collapse = "",
                    drop_empty = TRUE,
                    drop_na = TRUE,
                    call = caller_env()) {
  check_dots_unnamed()

  .content <- .content %||% dots_list(...)

  if (drop_empty) {
    .content <- list_drop_empty(.content)
  }

  if (drop_na) {
    .content <- list_drop_na(.content)
  }

  .attributes <- qto_attributes(
    id = id,
    class = class,
    css = css,
    .attributes = .attributes
  )

  qto_block(
    qto_fence(.attributes = .attributes),
    paste0(.content, collapse = collapse),
    qto_fence(),
    call = call
  )
}

#' Create a fence for a div or code block
#'
#' @param fence If numeric, `fence` must be a minimum of 3 and sets the number
#'   of times the standard fence character ":" should be repeated. If character,
#'   `fence` is used as is.
#' @noRd
qto_fence <- function(fence = ":::", .attributes = NULL, .sep =  " ") {
  if (is.numeric(fence)) {
    stopifnot(fence > 2)
    fence <- strrep(":", fence)
  }

  paste0(
    "\n", fence, .sep, .attributes %||% "", "\n"
  )
}

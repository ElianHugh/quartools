#' Create a definition list
#'
#'  See the Quarto documentation for more information on lists:
#' <https://quarto.org/docs/authoring/markdown-basics.html#lists>
#'
#' @param ... Optional. Named argument where the argument name is a term and the
#'   value name is the text to display as a definition for the term. Ignored if
#'   `.list` or `.term` and `.definition` are supplied.
#' @param .term,.definition If supplied, `.list` is set to a named list using
#'   terms as names and definitions as values. Ignored if `.list` is supplied.
#' @param .list If `.list` is supplied, any values passed to `...` are ignored.
#'   One of `.list`, `.term` and `.definition`, or `...` must be supplied.
#' @param .sep Added separator string between terms and definitions. Defaults to
#'   `"\n"` for wider list spacing. If set to `""`, the definition list uses a
#'   tighter spacing.
#' @inheritParams list_drop_or_replace_na
#' @aliases qto_definition_list
#' @seealso
#' - [qto_ol()]
#' - [qto_li()]
#' @export
qto_dl <- function(...,
                   .term = NULL,
                   .definition = NULL,
                   .list = NULL,
                   .drop_na = FALSE,
                   .sep = "\n",
                   .replacement = "") {
  if (!is.null(.term) && !is.null(.definition)) {
    .list <- .list %||% set_names(.definition, .term)
  }

  .list <- list_drop_or_replace_na(
    .list %||% list2(...),
    drop_na = .drop_na,
    replacement = .replacement
  )

  # FIXME: Unsure why this is needed
  if (has_length(.list, 1)) {
    .list <- .list[1]
  }

  qto_block(
    names(.list),
    .sep,
    "\n:   ",
    .list,
    collapse = "\n\n"
  )
}

#' Create ordered or unordered lists for Quarto
#'
#' [qt_ol()] created ordered lists and [qt_li()] creates unordered lists. See
#' the Quarto documentation for more information on lists:
#' <https://quarto.org/docs/authoring/markdown-basics.html#lists>
#'
#' @param .list A vector of list items. Optional if items are passed to `...`.
#' @param ... Items to use as list items.
#' @param level Indent level of list. Nested levels in a single function call
#'   are not yet supported.
#' @seealso [qto_dl()]
#' @examples
#' qto_ol(LETTERS[1:2])
#'
#' qto_li(LETTERS[3:4])
#'
#' qto_li(LETTERS[5:6], level = 2)
#'
#' qto_ol(LETTERS[7:8], sep = "\n")
#'
#' qto_li(LETTERS[5:6], symbol = c("*", "    +"))
#'
#' @name qto_list
NULL

#' @rdname qto_list
#' @name qto_ol
#' @export
qto_ol <- function(.list = NULL, ..., level = 1, symbol = "1.") {
  qto_li(
    .list = .list,
    ...,
    level = level,
    symbol = symbol
  )
}

#' @rdname qto_list
#' @name qto_li
#' @param symbol Symbol to use for list bullet. Use "(@)" to create a list where
#'   numbering continues after interruption.
#' @param sep Separator character between list items passed to [qto_block()].
#'   Defaults to "". Set to `"\n"` for wider list spacing.
#' @export
qto_li <- function(.list = NULL, ..., level = 1, symbol = "*", sep = "") {
  .list <- .list %||% rlang::list2(...)

  check_character(symbol)

  qto_block(
    "\n",
    paste0(
      indent_level(level),
      symbol, " ",
      .list
    ),
    sep = sep
  )
}

#' Helper function to set indent based on level
#'
#' @noRd
indent_level <- function(level = 1) {
  if (level == 1) {
    return("")
  }

  level <- level - 1
  strrep(" ", 4 * level)
}

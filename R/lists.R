#' Create a definition list
#'
#' @param ... Optional. Named argument where the argument name is a term and the
#'   value name is the text to display as a definition for the term. Ignored if
#'   `.list` or `.term` and `.definition` are supplied.
#' @param .term,.definition If supplied, `.list` is set to a named list using
#'   terms as names and definitions as values. Ignored if `.list` is supplied.
#' @param .list If `.list` is supplied, any values passed to `...` are ignored.
#'   One of `.list`, `.term` and `.definition`, or `...` must be supplied.
#' @inheritParams list_drop_or_replace_na
#' @export
qto_definition_list <- function(...,
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

  if (has_length(.list, 1)) {
    .list <- .list[[1]]
  }

  qto_block(
    names(.list),
    .sep,
    "\n:   ",
    .list,
    collapse = "\n\n"
  )
}

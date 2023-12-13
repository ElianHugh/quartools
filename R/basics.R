#' Basic formatting and markdown elements
#'
#' [qto_heading()] creates headings and [qto_hr()] creates horizontal rules.
#'
#' @name qto_basics
NULL

#' @rdname qto_basics
#' @name qto_heading
#' @param ... Heading text passed to [qto_block()].
#' @param level Heading level. Defaults to 1.
#' @export
qto_heading <- function(...,
                        level = 1) {
  qto_block(strrep("#", level), " ", ...)
}

#' @rdname qto_basics
#' @name qto_heading
#' @param rule,length Horizontal rule character and length of rule.
#' @param before,after Text to insert before and after a horizontal rule.
#' @export
qto_hr <- function(rule = "-",
                   length = 72,
                   before = "\n\n",
                   after = before) {
  rule <- arg_match0(rule, c("-", "_", "*"))
  qto_block(
    before,
    strrep(rule, length),
    after
  )
}

#' Create a link
#'
#' @inheritParams qto_src_span
#' @family span
#' @export
qto_link <- function(src,
                     text,
                     ...,
                     allow_empty = FALSE,
                     call = caller_env()) {
  qto_src_span(
    text = text,
    src = src,
    ...,
    allow_empty = allow_empty,
    call = call
  )
}


#' Simplified helper for `qto_link()`
#'
#' Also used by [qto_fig_span()]
#'
#' @param src Image source or URL.
#' @param caption Caption text
#' @inheritParams check_src
#' @inheritDotParams qto_attributes
#' @keywords internal
qto_src_span <- function(src,
                         text = NULL,
                         .before = "",
                         ...,
                         allow_missing = FALSE,
                         allow_empty = FALSE,
                         call = caller_env()) {
  check_src(
    src,
    allow_missing = allow_missing,
    allow_empty = allow_empty,
    call = call
  )

  .attributes <- qto_attributes(
    ...
  )

  if (.attributes == "{}") {
    .attributes <- ""
  }

  qto_block(
    .before,
    bracket(text),
    parentheses(src),
    .attributes,
    call = call
  )
}

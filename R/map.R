map <- function(.x, .f, ...) {
  .f <- as_function(.f, env = global_env())
  lapply(.x, .f, ...)
}

map_chr <- function(.x, .f, ...) {
  .rlang_purrr_map_mold(.x, .f, character(1), ...)
}

.rlang_purrr_map_mold <- function(.x, .f, .mold, ...) {
  .f <- as_function(.f, env = global_env())
  out <- vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)
  names(out) <- names(.x)
  out
}

#' Apply a function to each element of a vector and return Quarto block vector
#'
#' @param .x An input vector.
#' @param .f Optional function to apply to each element. If function does not
#'   return a "quarto_block" class object, the output is passed to [qto_block()]
#' @param .type If .f is `NULL`, type is used to define the function applied to
#'   each element of the vector. Options include "block", "div", "callout", or
#'   "heading".
#' @examples
#' map_qto(
#'   list("This is a note.", "And this is a note.", "And this is a note"),
#'   .type = "callout"
#' )
#'
#' @export
map_qto <- function(.x,
                    .f = NULL,
                    ...,
                    .type = c("block", "div", "callout", "heading")) {
  .type <- arg_match(.type)

  map(
    .x,
    \(x) {
      .f <- .f %||% switch(.type,
        block = qto_block,
        div = qto_div,
        callout = qto_callout,
        heading = qto_heading
      )

      x <- .f(x, ...)

      if (inherits(x, "quarto_block")) {
        return(x)
      }

      qto_block(x)
    }
  )
}

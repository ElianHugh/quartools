#' map, map_chr, and .rlang_purrr_map_mold are copied from the
#' `standalone-purrr.R` script in rlang:
#' https://github.com/r-lib/rlang/blob/main/R/standalone-purrr.R
#' @noRd
map <- function(.x, .f, ...) {
    .f <- as_function(.f, env = global_env())
    lapply(.x, .f, ...)
}

#' @noRd
map_chr <- function(.x, .f, ...) {
    .rlang_purrr_map_mold(.x, .f, character(1L), ...)
}

#' no@Rd
map_int <- function(.x, .f, ...) {
    .rlang_purrr_map_mold(.x, .f, integer(1), ...)
}

#' @noRd
.rlang_purrr_map_mold <- function(.x, .f, .mold, ...) {
    .f <- as_function(.f, env = global_env())
    out <- vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)
    names(out) <- names(.x)
    out
}

#' @noRd
pmap <- function(.l, .f, ...) {
    .f <- as.function(.f)
    args <- .rlang_purrr_args_recycle(.l)
    do.call("mapply", c(
        FUN = list(quote(.f)),
        args, MoreArgs = quote(list(...)),
        SIMPLIFY = FALSE, USE.NAMES = FALSE
    ))
}

.rlang_purrr_args_recycle <- function(args) {
    lengths <- map_int(args, length)
    n <- max(lengths)

    stopifnot(all(lengths == 1L | lengths == n))
    to_recycle <- lengths == 1L
    args[to_recycle] <- map(args[to_recycle], function(x) rep.int(x, n))

    args
}

#' Apply a function to each element of a vector and return Quarto block vector
#'
#' [map_qto()] loops a list over a package function defined by .type or a custom
#' function that returns a quarto block output. This function always returns a
#' list of quarto block objects.
#'
#' @param .x An input vector.
#' @param .f Optional function to apply to each element. If function does not
#'   return a "quarto_block" class object, the output is passed to [qto_block()]
#' @param ... Additional parameters passed to function defined by `.f`.
#' @param .type If .f is `NULL`, type is used to define the function applied to
#'   each element of the vector. Options include "block", "div", "callout", or
#'   "heading".
#' @param .sep,.collapse Additional parameters passed to [qto_block()] if .f
#'   does not return a quarto block class object. Ignored if .f does return a
#'   quarto block class object.
#' @inheritParams rlang::args_error_context
#' @examples
#' qto_list <- map_qto(
#'     list("This is a note.", "And this is a note.", "And this is a note"),
#'     .type = "callout"
#' )
#'
#' qto_block(qto_list)
#'
#' @export
map_qto <- function(.x,
                    .f = NULL,
                    ...,
                    .type = c("block", "div", "callout", "heading"),
                    .sep = "",
                    .collapse = "",
                    .call = caller_env()) {
    .type <- arg_match(.type, error_call = call)

    map(
        .x,
        \(x) {
            .f <- .f %||% switch(.type,
                block = qto_block,
                div = qto_div,
                callout = qto_callout,
                heading = qto_heading
            )

            if (!rlang::is_function(.f)) {
                .f <- rlang::as_function(.f, call = call)
            }

            x <- .f(x, ...)

            if (inherits(x, "quarto_block")) {
                return(x)
            }

            qto_block(x, sep = .sep, collapse = .collapse, call = .call)
        }
    )
}


partial_qto_func <- function(f, collapse, sep) {
    function(...) {
        f(..., collapse = collapse, sep = sep)
    }
}

resolve_mapping_function <- function(f = NULL,
                                     type = NULL,
                                     collapse = NULL,
                                     sep = NULL,
                                     call = NULL) {
    f <- f %||% switch(type,
        block   = partial_qto_func(qto_block, collapse, sep),
        div     = partial_qto_func(qto_div, collapse, sep),
        callout = partial_qto_func(qto_callout, collapse, sep),
        heading = partial_qto_func(qto_heading, collapse, sep),
    )
    if (!is_function(f)) {
        f <- as_function(f, call = call)
    }
    f
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
#' @seealso [quartools::pmap_qto()], [purrr::map()]
#' @export
map_qto <- function(.x,
                    .f = NULL,
                    ...,
                    .type = c("block", "div", "callout", "heading"),
                    .sep = "",
                    .collapse = "",
                    .call = caller_env()) {
    .type <- arg_match(.type, error_call = .call)
    .f <- resolve_mapping_function(
        f = .f,
        type = .type,
        collapse = .collapse,
        sep = .sep,
        call = .call
    )
    map(
        .x,
        function(x) {
            x <- .f(x, ...)
            if (inherits(x, "quarto_block")) return(x)
            qto_block(x, sep = .sep, collapse = .collapse, .call = .call)
        }
    )
}

#' Map over multiple inputs simultaenously and return Quarto block vector
#'
#' [pmap_qto()] loops a list of vectors over a package function defined by .type or a custom
#' function that returns a quarto block output. This function always returns a
#' list of quarto block objects.
#'
#' @param .l An input vector.
#' @inheritParams rlang::args_error_context
#' @inheritParams map_qto
#' @examples
#' qto_list <- pmap_qto(
#'     list(
#'         list("Answer:", "Answer:", "Answer:"),
#'         list("Yes", "No", "Yes")
#'     )
#' )
#' qto_block(qto_list)
#'
#' qto_list <- pmap_qto(
#'     list(
#'         "Hello",
#'         "World",
#'         "!"
#'     ),
#'     .f = function(x, y, z) {
#'         sprintf("%s %s%s", x, y, z)
#'     }
#' )
#' qto_block(qto_list)
#'
#' @seealso [quartools::map_qto()], [purrr::pmap()]
#' @export
pmap_qto <- function(.l,
                     .f = NULL,
                     ...,
                     .type = c("block", "div", "callout", "heading"),
                     .sep = "",
                     .collapse = "",
                     .call = caller_env()) {
    .type <- arg_match(.type, error_call = .call)
    .f <- resolve_mapping_function(
        f = .f,
        type = .type,
        collapse = .collapse,
        sep = .sep,
        call = .call
    )
    pmap(
        .l,
        function(...) {
            x <- .f(...)
            if (inherits(x, "quarto_block")) return(x)
            qto_block(x, sep = .sep, collapse = .collapse, .call = .call)
        },
        ...
    )
}

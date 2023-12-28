resolve_mapping_function <- function(f = NULL,
                                     type = NULL,
                                     call = NULL) {
    f <- f %||% switch(type,
        block   = qto_block,
        div     = qto_div,
        callout = qto_callout,
        heading = qto_heading,
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
#'   quarto block class object. Also passed to the relevant .type function if it supports
#'   the collapse and/or sep parameters.
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
                    call = caller_env()) {
    .type <- arg_match(.type, error_call = call)
    .f <- resolve_mapping_function(
        f = .f,
        type = .type,
        call = call
    )
    map(
        .x,
        function(x) {
            x <- .f(x, ...)
            if (inherits(x, "quarto_block")) return(x)
            qto_block(x, sep = .sep, collapse = .collapse, call = call)
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
#'     mtcars[seq(3L), seq(3L)],
#'     function(mpg, cyl, disp) {
#'         qto_li(
#'             .list = list(
#'                 sprintf("mpg is: %s", mpg),
#'                 sprintf("cyl is: %s", cyl),
#'                 sprintf("disp is: %s", disp)
#'             )
#'         )
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
                     call = caller_env()) {
    .type <- arg_match(.type, error_call = call)
    .f <- resolve_mapping_function(
        f = .f,
        type = .type,
        call = call
    )
    pmap(
        .l,
        function(...) {
            x <- .f(...)
            if (inherits(x, "quarto_block")) return(x)
            qto_block(x, sep = .sep, collapse = .collapse, call = call)
        },
        ...
    )
}

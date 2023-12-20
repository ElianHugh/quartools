#' all functions here are copied from the
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

#' @noRd
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

#' @noRd
.rlang_purrr_args_recycle <- function(args) {
    lengths <- map_int(args, length)
    n <- max(lengths)

    stopifnot(all(lengths == 1L | lengths == n))
    to_recycle <- lengths == 1L
    args[to_recycle] <- map(args[to_recycle], function(x) rep.int(x, n))

    args
}

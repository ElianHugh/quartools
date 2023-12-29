#' Check source string
#'
#' Used by [qto_src_span()] to check input strings.
#'
#' @param x Input string. Typically a file path or URL.
#' @param allow_missing If `FALSE` (default), error if string is not a URL and
#'   not a valid web path. If `TRUE`, allow input to be a path to a non-existent
#'   file.
#' @param allow_empty If `FALSE` (default), error if string is empty. If `TRUE`,
#'   allow input to be an empty string.
#' @inheritParams rlang::args_error_context
#' @keywords internal
check_src <- function(x,
                      allow_missing = FALSE,
                      allow_empty = FALSE,
                      arg = caller_arg(x),
                      call = caller_env()) {
    check_string(x, allow_empty = allow_empty, arg = arg, call = call)
    what <- "an existing file or a valid web path"

    if (grepl("^(f|ht)tps?://", x)) {
        return(NULL)
    }

    if (file.exists(x) || allow_missing) {
        return(NULL)
    }

    if (allow_missing) {
        what <- "a file or a valid web path"
    }

    stop_input_type(
        x,
        what = what,
        arg = arg,
        call = call
    )
}

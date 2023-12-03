check_src <- function(x,
                      allow_missing = FALSE,
                      allow_empty = FALSE,
                      arg = caller_arg(),
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

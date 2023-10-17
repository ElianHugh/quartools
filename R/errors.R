check_extension_arg <- function(extension, valid_inputs) {
    if (!is.null(extension)) {
        extension %in% c("left", "right") || rlang::abort(
            message = c(
                sprintf("extension argument must be any of: NULL, %s.", paste0(valid_inputs, collapse = ", ")),
                x = sprintf("supplied extension value: `%s`", extension),
                i = "See Quarto's article layout documentation for a definitive list of available inputs"
            )
        )
    }
}

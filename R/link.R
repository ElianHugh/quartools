#' Create a Markdown link
#'
#' @param src Path or URL for link. Required.
#' @param text Optional link text. If link text is not provided, a bare link,
#'   e.g. `<https://quarto.org>` is returned.
#' @inheritParams check_src
#' @inheritDotParams qto_attributes -.output -.drop_empty
#' @examples
#' qto_link("https://quarto.org")
#'
#' qto_link("https://quarto.org", "Quarto")
#'
#' qto_link("https://quarto.org", "Quarto", class = "smaller")
#'
#' @family span
#' @export
qto_link <- function(src,
                     text = NULL,
                     ...,
                     allow_empty = FALSE,
                     call = caller_env()) {
    check_src(
        src,
        allow_empty = allow_empty,
        call = call
    )

    if (is.null(text)) {
        link <- qto_block(
            combine(src, before = "<", after = ">"),
            qto_attributes(
                ...,
                .output = "span",
                call = call
            ),
            call = call
        )

        return(link)
    }

    qto_src_span(
        src = src,
        text = text,
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
#' @param text Caption or link text.
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
    qto_block(
        .before,
        bracket(text),
        parentheses(src),
        qto_attributes(
            ...,
            .output = "span",
            call = call
        ),
        call = call
    )
}

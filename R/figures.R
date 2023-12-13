#' Insert an figure or image
#'
#' <https://quarto.org/docs/authoring/figures.html>
#'
#' @param allow_missing If `FALSE`, error if src is not an existing file or a
#'   valid URL. URLs are not checked if they work.
#' @examples
#' qto_fig("image.jpeg", "Image caption", alt = "Image alt text")
#'
#' qto_fig("graphic.pdf", title = "Title of the graphic")
#'
#' @export
qto_fig <- function(src,
                    caption = NULL,
                    alt = NULL,
                    reference = NULL,
                    align = NULL,
                    pos = NULL,
                    width = NULL,
                    height = NULL,
                    title = NULL,
                    ...,
                    allow_missing = TRUE) {
  check_src(src, allow_missing = allow_missing)

  if (is_string(reference)) {
    ref_prefix <- "#"

    if (!grepl("^fig-", reference)) {
      ref_prefix <- "#fig-"
    }

    reference <- paste0(ref_prefix, reference)
  }


  if (is_string(title)) {
    src <- paste0(src, ' "', title, '"')
  }

  qto_fig_span(
    src = src,
    caption = caption,
    id = reference,
    .attributes = c(
      list(
        "fig-alt" = alt,
        "fig-align" = align,
        "fig-pos" = pos,
        "width" = width,
        "height" = height
      ),
      dots_list(...)
    )
  )
}

#' Simplified helper for qto_fig()
#'
#' @param src Image source. Either a file path or URL.
#' @param caption Caption text
#' @inheritDotParams qto_attributes
#' @keywords internal
qto_fig_span <- function(src, caption = NULL, ...) {
  fig_attributes <- qto_attributes(
    ...
  )

  if (fig_attributes == "{}") {
    fig_attributes <- ""
  }

  qto_block(
    "!",
    bracket(caption),
    parentheses(src),
    fig_attributes
  )
}

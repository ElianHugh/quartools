#' Insert an figure or image
#'
#' [qto_fig()] creates Markdown formatting to insert a figure or image. Learn
#' more about figure formatting options in the Quarto documentation:
#' <https://quarto.org/docs/authoring/figures.html> Note that LaTeX output
#' formats may not support external images:
#' <https://tex.stackexchange.com/questions/5433/can-i-use-an-image-located-on-the-web-in-a-latex-document>
#'
#' @param src Figure file path or URL.
#' @param caption Figure caption.
#' @param alt Figure alt text.
#' @param reference Figure reference. "fig-" prefix is optional.
#' @param align,pos,width,height Figure alignment, position, width, and height.
#' @param title Figure title.
#' @param allow_missing If `FALSE`, error if src is not an existing file or a
#'   valid URL. URLs are not checked if they work.
#' @param ... Additional attributes passed to attributes argument of
#'   [qto_fig_span()].
#' @examples
#' qto_fig("image.jpeg", "Image caption", alt = "Image alt text")
#'
#' qto_fig("graphic.pdf", title = "Title of the graphic")
#'
#' @seealso [knitr::include_graphics()]
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

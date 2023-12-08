#' Create a Quarto span
#'
#' See the Quarto documentation for more on divs and spans:
#' <https://quarto.org/docs/authoring/markdown-basics.html#divs-and-spans>
#'
#' @param text Text to wrap in span bracket.
#' @inheritParams qto_attributes
#' @inheritDotParams qto_attributes
#' @examples
#'
#' qto_span("This is *some text*", class = "class", key = "value")
#'
#' qto_span("This is good", id = "id", class = "class", key1 = "val1", key2 = "val2")
#'
#' @export
qto_span <- function(text, ..., .attributes = NULL) {
  qto_block(
    bracket(text),
    qto_attributes(
      ...,
      .attributes = .attributes
    )
  )
}

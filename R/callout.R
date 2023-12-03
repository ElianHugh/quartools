#' Create a Quarto callout block
#'
#' Callouts are an excellent way to draw extra attention to certain concepts, or
#' to more clearly indicate that certain content is supplemental or applicable
#' to only some scenarios. <https://quarto.org/docs/authoring/callouts.html>
#'
#' @param type Callout type. One of "note", "tip", "warning", "caution", or
#'   "important". <https://quarto.org/docs/authoring/callouts.html#callout-types>
#' @param appearance Callout appearance. One of "default", "simple", "minimal".
#'   <https://quarto.org/docs/authoring/callouts.html#appearance>
#' @param collapse If `TRUE`, create a folded callout. <https://quarto.org/docs/authoring/callouts.html#collapse>
#' @param icon If `FALSE`, create a callout with an icon. <https://quarto.org/docs/authoring/callouts.html#icons>
#' @inheritParams qto_heading
#' @inheritParams qto_div
#' @examples
#'
#' qto_callout(
#' "Callouts provide a simple way to attract attention, for example, to this warning.",
#' type = "warning"
#' )
#'
#' qto_callout(
#' "This is an example of a callout with a title.",
#' type = "tip",
#' title = "Tip with a title"
#' )
#'
#' @export
qto_callout <- function(...,
                        type = c("note", "tip", "warning", "caution", "important"),
                        heading = NULL,
                        collapse = NULL,
                        appearance = NULL,
                        icon = NULL,
                        title = NULL,
                        id = NULL,
                        class = NULL,
                        .attributes = NULL,
                        level = 2,
                        sep = " ",
                        fence = ":::") {
  type <- arg_match(type)
  class <- paste0("callout-", type)

  if (!is.null(appearance)) {
    appearance <- arg_match0(
      appearance,
      c("default", "simple", "minimal")
    )
  }

  .attributes <- c(
    list(
      "collapse" = collapse,
      "appearance" = appearance,
      "icon" = icon
    ),
    as.list(.attributes),
    list(
      "title" = title
    )
  )

  .attributes <- list_drop_empty(.attributes)

  if (!is.null(heading)) {
    heading <- as.list(qto_heading(heading, level))
  }

  qto_div(
    .content = c(
      heading,
      dots_list(...)
    ),
    class = class,
    id = id,
    .attributes = .attributes,
    fence = fence,
    sep = sep
  )
}
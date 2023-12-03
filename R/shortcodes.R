#' Create a Quarto shortcode
#'
#' @export
qto_shortcode <- function(x, before = "{{< ", after = " >}}", ...) {
  qto_block(combine(x, before, after), ...)
}

#' Videos <https://quarto.org/docs/authoring/markdown-basics.html#videos>
#'
#' @rdname qto_shortcode
#' @name qto_pagebreak
#' @examples
#' qto_video("https://www.youtube.com/embed/wo9vZccmqwc")
#'
#' @export
qto_video <- function(src) {
  check_src(x = src)
  qto_shortcode(paste0("video ", src))
}

#' Page breaks <https://quarto.org/docs/authoring/markdown-basics.html#page-breaks>
#'
#' @rdname qto_shortcode
#' @name qto_pagebreak
#' @examples
#' qto_pagebreak()
#'
#' @export
qto_pagebreak <- function() {
  qto_shortcode("pagebreak")
}

#' Keyboard shortcuts <https://quarto.org/docs/authoring/markdown-basics.html#keyboard-shortcuts>
#'
#' @rdname qto_shortcode
#' @name qto_kbd
#' @examples
#' qto_kbd("Shift", "Ctrl", "P")
#'
#' qto_kbd(
#'   mac = "Shift-Command-O",
#'   win = "Shift-Control-O",
#'   linux = "Shift-Ctrl-L"
#' )
#'
#' @export
qto_kbd <- function(...) {
  shortcut <- dots_list(...)

  if (is_named(shortcut)) {
    shortcut <- lapply(shortcut, paste0, collapse = "-")
    shortcut <- paste0(names(shortcut), "=", shortcut, collapse = " ")
  } else {
    shortcut <- paste0(shortcut, collapse = "-")
  }

  qto_shortcode(paste0("kbd ", shortcut))
}

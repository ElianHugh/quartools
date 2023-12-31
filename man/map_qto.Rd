% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map.R
\name{map_qto}
\alias{map_qto}
\title{Apply a function to each element of a vector and return Quarto block vector}
\usage{
map_qto(
  .x,
  .f = NULL,
  ...,
  .type = c("block", "div", "callout", "heading"),
  .sep = "",
  .collapse = "",
  call = caller_env()
)
}
\arguments{
\item{.x}{An input vector.}

\item{.f}{Optional function to apply to each element. If function does not
return a "quarto_block" class object, the output is passed to \code{\link[=qto_block]{qto_block()}}}

\item{...}{Additional parameters passed to function defined by \code{.f}.}

\item{.type}{If .f is \code{NULL}, type is used to define the function applied to
each element of the vector. Options include "block", "div", "callout", or
"heading".}

\item{.sep, .collapse}{Additional parameters passed to \code{\link[=qto_block]{qto_block()}} if .f
does not return a quarto block class object. Ignored if .f does return a
quarto block class object.}

\item{call}{The execution environment of a currently
running function, e.g. \code{caller_env()}. The function will be
mentioned in error messages as the source of the error. See the
\code{call} argument of \code{\link[rlang:abort]{abort()}} for more information.}
}
\description{
\code{\link[=map_qto]{map_qto()}} loops a list over a package function defined by .type or a custom
function that returns a quarto block output. This function always returns a
list of quarto block objects.
}
\examples{
qto_list <- map_qto(
    list("This is a note.", "And this is a note.", "And this is a note"),
    .type = "callout"
)

qto_block(qto_list)

}
\seealso{
\code{\link[=pmap_qto]{pmap_qto()}}, \code{\link[purrr:map]{purrr::map()}}
}

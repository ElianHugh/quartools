% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attributes.R
\name{qto_attributes}
\alias{qto_attributes}
\title{Create an attribute string for a div or span}
\usage{
qto_attributes(
  id = NULL,
  class = NULL,
  css = NULL,
  ...,
  .attributes = NULL,
  .output = "embrace",
  .drop_empty = TRUE,
  call = caller_env()
)
}
\arguments{
\item{id}{Div or span identifier. If \code{id} does not start with \code{"#"}, the
hash character is applied as a prefix.}

\item{class}{Div or span class. If \code{class} does not start with \code{"."}, the
period character is applied as a prefix.}

\item{css}{If \code{{htmltools}} is installed, a list of css style attributes to
pass to \code{\link[htmltools:css]{htmltools::css()}}.}

\item{...}{Optional named attributes.}

\item{.attributes}{Optional list of attributes. If supplied, any attributes
passed to \code{...} are ignored.}

\item{.output}{Output type. If "embrace", the returned attributes are always
enclosed in curly brackets, e.g. "{}" if no attributes are supplied. If
"span", an empty string is returned if no attributes are provided.}

\item{.drop_empty}{If \code{TRUE}, empty attributes are dropped.}

\item{call}{The execution environment of a currently
running function, e.g. \code{caller_env()}. The function will be
mentioned in error messages as the source of the error. See the
\code{call} argument of \code{\link[rlang:abort]{abort()}} for more information.}
}
\description{
\code{\link[=qto_attributes]{qto_attributes()}} creates an attribute string used by \code{\link[=qto_div]{qto_div()}},
\code{\link[=qto_span]{qto_span()}}, or \code{\link[=qto_fig_span]{qto_fig_span()}}.
}
\examples{
qto_attributes(id = "id", class = "class")

qto_attributes(class = "class", key1 = "val", key2 = "val")

qto_attributes(width = 4)

}

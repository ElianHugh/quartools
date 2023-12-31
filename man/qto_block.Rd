% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/block.R
\name{qto_block}
\alias{qto_block}
\title{Create a block of text to render as Markdown text in Quarto}
\usage{
qto_block(..., sep = "", collapse = "", call = caller_env())
}
\arguments{
\item{...}{dots to convert to character vector}

\item{sep}{a character string to separate the terms.  Not
    \code{\link[base]{NA_character_}}.}

\item{collapse}{an optional character string to separate the results.  Not
    \code{\link[base]{NA_character_}}.  When \code{collapse} is a string,
    the result is always a string (\code{\link[base]{character}} of length 1).}

\item{call}{The execution environment of a currently
running function, e.g. \code{caller_env()}. The function will be
mentioned in error messages as the source of the error. See the
\code{call} argument of \code{\link[rlang:abort]{abort()}} for more information.}
}
\value{
character vector of length 1
}
\description{
\code{\link[=qto_block]{qto_block()}} passes the input to \code{\link[=paste]{paste()}} and assigns the classes
"knit_asis" and "quarto_block".
}
\examples{
qto_block("Hello world!")

qto_block("Hello", "world!", sep = " ")

qto_block("- ", LETTERS[1:4], collapse = "\n")

}
\seealso{
\itemize{
\item \code{\link[knitr:asis_output]{knitr::asis_output()}}
}
}

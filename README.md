
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quartools

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/ElianHugh/quartools/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ElianHugh/quartools?branch=main)
<!-- badges: end -->

*quartools* allows for the creation of quarto-compliant markdown via R
function calls. As *quartools* generates quarto-compliant markdown, and
*not* HTML tags, the content will work on any quarto output format.

## Why quartools?

At work, I ran into an issue where I was generating hundreds of
parameterised reports that would be similar with subtle differences in
content. I found myself leaning on R for programmatic markup creation,
which meant that I could have one master document that I worked on. My
prototype version (in other words, functions I threw together for work)
required a lot of constant chunk configuration, and wasn’t particularly
user-friendly nor elegant. *quartools* is a more streamlined version of
my prototype, with the added benefit of it requiring little to no setup
on the end user’s part.

## Installation

### Release build

``` r
install.packages('quartools', repos = 'https://elianhugh.r-universe.dev')
```

### Development build

``` r
# install.packages("devtools")
devtools::install_github("ElianHugh/quartools")
```

## Example

### My First Div

``` r
library(quartools)
div(
    "The simplest way to create a div block element with quartools is via the `div` function.",
    "Note that the chunk configuration of `results: asis` is not necessary."
)
```

<div>

The simplest way to create a div block element with quartools is via the
`div` function.

Note that the chunk configuration of `results: asis` is not necessary.

</div>

``` r
div(
    "It is also possible to supply attributes to the div block element via the `attr` parameter.",
    attr = ".callout-tip"
)
```

<div>

> **Tip**
>
> It is also possible to supply attributes to the div block element via
> the `attr` parameter.

</div>

### Apply

We can leverage the `apply` family of functions ability to loop over
list elements to simplify creating many divs at once. Normally this
would require a workaround to allow for printing directly as markdown
content, but *quartools* exports the `mdapply` function (read: “markdown
apply”) which allows for directly printing the result as valid markdown
content.

``` r
my_favourite_letters <- letters[1L:3L]
mdapply(my_favourite_letters, div)
```

<div>

a

</div>

<div>

b

</div>

<div>

c

</div>

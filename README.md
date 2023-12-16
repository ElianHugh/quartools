
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
parameterised reports that would require parts of the report to be
dynamically populated. I found myself leaning on R for programmatic
markup creation, which meant that I could have one master document that
I worked on. My prototype version (in other words, functions I threw
together for work) required a lot of constant chunk configuration, and
wasn’t particularly user-friendly nor elegant. *quartools* is a more
streamlined version of my prototype, with the added benefit of it
requiring little to no setup on the end user’s part.

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

``` r
library(quartools)
```

### Basic usage

The simplest way to create a div block element with quartools is via the
`qto_div` function. Note that the chunk configuration of `results: asis`
is not necessary.

``` r
div_example <- qto_div(
  "It is also possible to supply attributes to the div block element via the `id`, `class`, and `.attributes` parameters.",
  id = "qto-div-example"
)

print(div_example)
```


    ::: {#qto-div-example}
    It is also possible to supply attributes to the div block element via the `id`, `class`, and `.attributes` parameters.
    ::: 

The `qto_callout()` function creates a callout styled div:

``` r
callout_example <- qto_callout(
  "Callouts provide a simple way to attract attention, for example, to this warning.",
  type = "warning"
)

print(callout_example)
```


    ::: {.callout-warning}
    Callouts provide a simple way to attract attention, for example, to this warning.
    ::: 

Other simple functions include `qto_heading` or `qto_definition_list`:

``` r
heading_example <- qto_heading("Heading 1")

print(heading_example)
```

    # Heading 1

``` r
dl_example <- qto_dl("Term" = "Definition")

print(dl_example)
```

    Term

    :   Definition

You can also use `qto_fig()` to embed images:

``` r
fig_example <- qto_fig(
  "https://quarto.org/quarto.png",
  "Quarto logo"
)

print(fig_example)
```

    ![Quarto logo](https://quarto.org/quarto.png)

### Using loops to create Quarto Markdown

We can leverage the `apply` family of functions ability to loop over
list elements to simplify creating many divs at once.

`map_qto()` allows users to set the function using the `.type`
parameter:

``` r
qto_list <- map_qto(list("This is a note.", "And this is a note.", "And this is a note"), .type = "callout")

print(qto_list)
```

    [[1]]

    ::: {.callout-note}
    This is a note.
    ::: 


    [[2]]

    ::: {.callout-note}
    And this is a note.
    ::: 


    [[3]]

    ::: {.callout-note}
    And this is a note
    ::: 

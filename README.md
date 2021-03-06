
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis build
status](https://travis-ci.org/elben10/resumr.svg?branch=master)](https://travis-ci.org/elben10/resumr)[![AppVeyor
Build
Status](https://ci.appveyor.com/api/projects/status/github/elben10/resumr?branch=master&svg=true)](https://ci.appveyor.com/project/elben10/resumr)[![CRAN
status](http://www.r-pkg.org/badges/version/resumr)](https://cran.r-project.org/package=resumr)

## Installation

You can install `resumr` from github with:

``` r
# install.packages("devtools")
devtools::install_github("elben10/resumr")
```

## `resumr`

`resumr` provides a Rmarkdown latex format for making a nice and formal
resume (CV) in Rmarkdown. The goal of `resumr` is to make it very easy
to create a formal cv using the markdown and code chunk syntax from
Rmarkdown. The package does also provide a vignette that step by step
shows how you create a resume using `resumr`.

`resumr` provides a single resume template at the moment, but the number
of resume templates will be increased in the future.

## Creating a resume using `resumr`

There is basically two ways to create a resume using `resumr`. (1) Using
Rstudio (2) Using plain R.

1)  In Rstudio you can create a `resumr` resume by using the new file
    button in Rstudio and then choose `R Markdown...`. Choose `From
    Template`, and then choose `Academic Resume`. Finally, you just knit
    your document as you would with all other `.Rmd` documents. A more
    thorough description can be find in the readme file in the
    [`rticles`
    packages](https://github.com/rstudio/rticles/blob/master/README.md).

2)  It is possible to create a `resumr` draft using the `draft` function
    from the [`rmarkdown package`](http://rmarkdown.rstudio.com). To
    create a draft and compile it you will do the following:
    
    1)  `rmarkdown::draft("MyDraft.Rmd", template = "academic_cv",
        package = "resumr)` `rmarkdown::render("MyDraft.Rmd")`

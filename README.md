
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19usa

<!-- badges: start -->

<!-- badges: end -->

The goal of covid19usa is to embed the previously created shiny
application for exploring COVID19 data in the United States of America
(USA) from assessment 2 within a package, and to refactor various parts
of the application logic into R functions exported by the package. This
is done in accordance with the assessment 3 instructions for ETC5523.

## Installation

<!-- You can install the released version of covid19usa from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("covid19usa") -->

<!-- ``` -->

The development version of covid19usa can be installed directly from
[GitHub](https://github.com/etc5523-2020/r-package-assessment-ltmoo2)
with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-ltmoo2")
```

## Example

The application can be launched using the following code:

``` r
library(covid19usa)
launch_app()
```

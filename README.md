
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

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-ltmoo2")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(covid19usa)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!

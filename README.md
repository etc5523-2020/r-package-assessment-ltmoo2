
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19usa

<!-- badges: start -->

<!-- badges: end -->

The goal of **covid19usa** is to embed the previously created shiny
application for exploring COVID-19 data in the United States of America
(USA) from assessment 2 within a package, and to refactor various parts
of the application logic into R functions exported by the package. This
is done in accordance with the assessment 3 instructions for ETC5523.

## Shiny application

As stated above, the shiny application was created as part of a previous
assessment using the R package, shiny, to allow users to explore
COVID-19 related data in the continental United States of America. For
both the total number of cases and total number of deaths, the following
data visualisations are provided:

1.  A choropleth map displaying the spatial distribution of the total
    number of cases and deaths respectively, recorded at the state
    level.  
2.  A timseries chart displaying the change in total cases and deaths
    recorded at the state level between the 22nd of January and the 28th
    of September of 2020, compared to the national average number of
    cases and deaths respectively.  
3.  An accompanying table recording the exact number of cases and deaths
    recorded at the state level, and the national average, over the same
    time frame.

For more information on the application itself and the data contained
within it, please click
[here](https://github.com/etc5523-2020/shiny-assessment-ltmoo2).

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

## Getting started

The application can then be launched using the following code:

``` r
library(covid19usa)
launch_app()
```

## Package functions

``` r
set.seed(1)
library(covid19usa)
random_states(usa_state_map)
#> [1] "CALIFORNIA"     "SOUTH CAROLINA"
```

``` r
create_input("state", usa_state_map)
```

``` r
library(dplyr)
example <- average_measure(usa_covid_data, "tot_cases") %>%
  arrange(-tot_cases) %>%
  head(5)

example
#> # A tibble: 5 x 3
#>   date       tot_cases state  
#>   <date>         <dbl> <chr>  
#> 1 2020-09-28    118822 average
#> 2 2020-09-27    118257 average
#> 3 2020-09-26    117651 average
#> 4 2020-09-25    116820 average
#> 5 2020-09-24    115977 average
```

``` r
library(kableExtra)
present_table(example, "cases")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:500px; ">

<table class="table table-bordered" style="margin-left: auto; margin-right: auto;">

<caption>

State cases compared to national average

</caption>

<thead>

<tr>

<th style="text-align:left;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

date

</th>

<th style="text-align:right;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

tot\_cases

</th>

<th style="text-align:left;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

state

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

2020-09-28

</td>

<td style="text-align:right;">

118,822

</td>

<td style="text-align:left;">

average

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-27

</td>

<td style="text-align:right;">

118,257

</td>

<td style="text-align:left;">

average

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-26

</td>

<td style="text-align:right;">

117,651

</td>

<td style="text-align:left;">

average

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-25

</td>

<td style="text-align:right;">

116,820

</td>

<td style="text-align:left;">

average

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-24

</td>

<td style="text-align:right;">

115,977

</td>

<td style="text-align:left;">

average

</td>

</tr>

</tbody>

</table>

</div>

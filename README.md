
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19usa

<!-- badges: start -->

[![R build
status](https://github.com/etc5523-2020/r-package-assessment-ltmoo2/workflows/R-CMD-check/badge.svg)](https://github.com/etc5523-2020/r-package-assessment-ltmoo2/actions)
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

The four functions below were created in order to improve logic of the
aforementioned shiny application. The first function, `random_states`
creates a vector of two randomly selected states names from a supplied
data set, in this case `usa_state_map`.

``` r
set.seed(1)
library(covid19usa)

random_states(usa_state_map)
#> [1] "CALIFORNIA"     "SOUTH CAROLINA"
```

This function was created and implemented within the `create_input`
function in order to automatically select two different US states for
comparison each time the application is launched In this example, by
default the application will display comparisons for `CALIFORNIA` and
`SOUTH CAROLINA`. In addition, this function is used to create all
adjustable inputs for the application.

``` r
create_input("state", usa_state_map)
```

Thirdly, on the server side, the function `average_measure` can be used
to produce a summary count of either `tot_cases` or `tot_death` for
COVID19 in the USA. This is used to construct the timeseries plot seen
in the application.

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

The final function, `present_table`, converts any data frame into a
stylish and presentable table using the `kableExtra` package and can be
seen alongside the timeseries chart in the application.

``` r
library(dplyr)

usa_covid_data %>%
  select(date, state, tot_cases)%>%
  filter(state == "colorado") %>%
  head(5) %>%
present_table("cases", "Total cases in Colorado per day")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:500px; ">

<table class="table table-bordered" style="margin-left: auto; margin-right: auto;">

<caption>

Total cases in Colorado per day

</caption>

<thead>

<tr>

<th style="text-align:left;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

date

</th>

<th style="text-align:left;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

state

</th>

<th style="text-align:right;background-color: black !important;position: sticky; top:0; background-color: #FFFFFF;">

tot\_cases

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

2020-01-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-01-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-01-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-01-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-01-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

0

</td>

</tr>

</tbody>

</table>

</div>

## Additional information

For more detailed instructions on how to use the package and the
functions contained within it, please consult the
[vignette](https://etc5523-2020.github.io/r-package-assessment-ltmoo2/)

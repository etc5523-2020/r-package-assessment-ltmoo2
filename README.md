
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

<tr>

<td style="text-align:left;">

2020-01-27

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

2020-01-28

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

2020-01-29

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

2020-01-30

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

2020-01-31

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

2020-02-01

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

2020-02-02

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

2020-02-03

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

2020-02-04

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

2020-02-05

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

2020-02-06

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

2020-02-07

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

2020-02-08

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

2020-02-09

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

2020-02-10

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

2020-02-11

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

2020-02-12

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

2020-02-13

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

2020-02-14

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

2020-02-15

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

2020-02-16

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

2020-02-17

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

2020-02-18

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

2020-02-19

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

2020-02-20

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

2020-02-21

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

2020-02-22

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

2020-02-23

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

2020-02-24

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

2020-02-25

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

2020-02-26

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

2020-02-27

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

2020-02-28

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

2020-02-29

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

2020-03-01

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

2020-03-02

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

2020-03-03

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

2020-03-04

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

2020-03-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

1

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

8

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

8

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

12

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

17

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

34

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

49

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

49

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

49

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

144

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

160

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

183

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

216

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

277

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

363

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

475

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

591

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

720

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

921

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

1,086

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

1,430

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

1,734

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

2,061

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

2,307

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

2,627

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-31

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

2,966

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

3,342

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

3,728

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

4,173

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

4,565

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

4,950

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

5,172

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

5,429

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

5,655

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

6,202

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

6,365

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

6,893

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

7,303

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

7,691

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

7,941

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

8,280

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

8,582

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

9,047

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

9,433

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

9,634

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

10,019

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

10,368

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

10,825

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

11,182

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

12,184

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

12,868

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

13,350

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

13,798

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

14,238

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

14,675

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

15,182

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

15,668

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

16,120

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

16,534

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

16,878

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

17,317

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

17,738

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

18,318

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

18,793

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

19,316

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

19,632

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

19,735

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

20,091

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

20,401

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

20,762

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

21,131

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

21,511

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

21,797

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

22,095

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

22,399

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

22,752

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

23,121

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

23,455

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

23,937

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

24,137

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

24,226

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

24,503

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

24,995

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

25,121

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

25,613

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

26,098

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-31

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

26,378

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

26,577

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

26,788

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

27,060

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

27,360

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

27,615

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

27,848

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,001

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,183

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,347

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,499

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,647

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

28,822

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,017

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,130

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,299

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,442

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,673

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

29,901

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

30,187

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

30,349

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

30,539

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

30,705

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

30,893

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

31,155

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

31,479

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

31,796

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

32,022

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

32,307

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

32,511

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-06-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

32,715

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

33,029

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

33,352

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

33,612

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

33,866

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

34,065

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

34,257

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

34,664

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

35,116

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

35,525

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

36,191

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

36,591

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

36,913

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

37,242

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

37,686

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

38,155

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

38,726

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

39,344

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

39,788

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

40,142

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

40,566

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

41,059

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

41,698

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

42,314

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

42,980

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

43,789

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

44,336

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

44,565

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

45,314

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

45,796

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

46,204

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-07-31

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

46,809

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

47,267

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

47,716

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

47,968

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

48,394

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

48,988

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

49,436

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

49,893

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

50,324

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

50,660

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

51,039

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

51,441

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

51,756

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

52,129

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

52,538

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

52,838

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

53,176

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

53,370

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

53,631

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

53,901

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

54,230

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

54,586

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

54,883

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

55,133

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

55,341

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

55,800

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

55,994

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

56,343

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

56,773

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-29

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

57,041

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-30

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

57,223

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-08-31

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

57,424

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-01

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

57,775

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-02

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

58,019

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-03

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

58,287

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-04

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

58,655

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-05

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

58,989

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-06

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

59,274

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-07

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

59,487

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-08

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

59,674

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-09

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

59,920

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-10

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

60,185

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-11

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

60,492

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-12

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

60,907

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-13

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

61,324

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-14

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

61,699

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-15

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

62,099

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-16

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

62,686

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-17

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

63,145

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-18

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

63,750

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-19

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

64,356

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-20

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

64,857

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-21

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

65,399

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-22

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

66,053

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-23

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

66,669

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-24

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

67,217

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-25

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

67,926

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-26

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

68,510

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-27

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

69,079

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-09-28

</td>

<td style="text-align:left;">

colorado

</td>

<td style="text-align:right;">

69,490

</td>

</tr>

</tbody>

</table>

</div>

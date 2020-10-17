#' Create inputs for shiny application
#' 
#' @description Create chosen shiny inputs for the different variables contained in the data set `usa_covid_data` and `usa_state_map`.
#'
#' @param input The variable chosen for the input as a character vector. Can be `"measure"`, `"state"`, or `"date"`.
#'
#' @return A shiny control widget used to specify inputs for the visualisations in the application
#' 
#' @export
#'
#' @examples
#' create_input("measure")
#' create_input("state")
#' create_input("date")
#' 
create_input <- function(input){
  if(input == "measure"){
    shiny::radioButtons("measure",
                 "Select Measure",
                 choices = c("Total Cases", "Total Deaths"),
                 selected = "Total Cases")
  } else if(input == "state"){
    shiny::selectizeInput("state",
                   "Select State",
                   choices = toupper(unique(usa_state_map$region)),
                   selected = c(random_states()),
                   multiple = TRUE)
  } else if(input == "date"){
    shiny::sliderInput("date",
                "Select Date",
                min = min(usa_covid_data$date),
                max = max(usa_covid_data$date),
                value = c(min(usa_covid_data$date),max(usa_covid_data$date)))
  }
}
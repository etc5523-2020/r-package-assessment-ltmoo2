#' Compare two states
#' 
#' @description This function is used in the shiny application to provide two random state names each time it is loaded for the default values.
#'
#' @return A collection of two state names returned from the `usa_state_map` data set.
#' 
#' @export
#'
#' @examples
#' random_states()
#' 
random_states <- function(){
  states <- toupper(unique(usa_state_map$region))
  sample(states, 2)
}
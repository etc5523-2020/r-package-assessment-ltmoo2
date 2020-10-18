#' Present a stylish table
#' 
#' @description Creates a formatted and styled table to display COVID19 data using the kableExtra package
#'
#' @param data The data set to be formatted
#' @param measure The measure chosen for the heading of the table as a character vector, can be `"cases"` or `"deaths"`
#'
#' @return A formatted kable of the original data set entered
#' 
#' @importFrom magrittr %>%
#' 
#' @export
#'
#' @examples
#' present_table(usa_covid_data, "cases")
#' present_table(usa_covid_data, "deaths")
#' 
present_table <- function(data, measure){
  data %>%
  kableExtra::kable(digits = 0,
        format.args = list(big.mark = ","),
        caption = paste("State", measure, "compared to national average")) %>%
    kableExtra::row_spec(0,background = "black") %>%
    kableExtra::kable_styling(bootstrap_options = c("border"))%>%
    kableExtra::scroll_box(height = "500px")
}
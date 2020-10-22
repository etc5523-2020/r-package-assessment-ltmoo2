# libraries ----------------------------------------------------
library(covid19usa)
library(shiny)
library(dplyr)
library(ggplot2)
library(maps)
library(readxl)
library(lubridate)
library(scales)
library(plotly)
library(kableExtra)
library(mapproj)

# data import --------------------------------------------------
# us_covid <- read_csv("data/United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
# us_names <- read_csv("data/csvData.csv")

# data wrangling -----------------------------------------------
us_covid_clean <- covid19usa::usa_covid_data 

mapdata <- covid19usa::usa_state_map

us_cases <- us_covid_clean %>%
    select(date,
           state,
           tot_cases) %>%
    filter(date >= min(date) & date <=max(date))

avg_cases <-
    us_cases %>%
    group_by(date) %>%
    summarise(tot_cases = mean(tot_cases)) %>%
    mutate(state = "average")

us_deaths <- us_covid_clean %>%
    select(date,
           state,
           tot_death) %>%
    filter(date >= min(date) & date <=max(date))

avg_deaths <-
    us_deaths %>%
    group_by(date) %>%
    summarise(tot_death = mean(tot_death)) %>%
    mutate(state = "average")



# ui -----------------------------------------------------------
ui <- fluidPage(
    
    
    titlePanel(h1("USA COVID19 Data")),
    sidebarLayout(
        sidebarPanel(
            h3("About"),
            helpText("This application was created as part of the Shiny Assessment for ETC5523, Semester 2 by Lachlan Thomas Moody. The purpose of this application is to allow users to explore COVID-19 related data in the continental United States of America to compare the volume of cases and deaths recorded by each of the states in the country. This is done to gain a better understanding of the virus and where it is localised within the country."),
            h3("Control Panel"),
            br(),
            create_input("measure"),
            helpText("The above control can be used to adjust the output of all of the visualisations in the  application. Selecting the option 'Total Cases' will display data relating to the total amount of COID19 cases in the USA on a state-by-state basis. Whereas 'Total Deaths' will display the same data relating to the number of total deaths."),
            br(),
            create_input("state", usa_state_map),
            helpText("The control above can be used to bring up temporal changes for each state using the currently selected measure, both in a time series plot and an accompanying table. This input can be changed by either clicking the box above and selecting states from the dropdown menu that appears, or by double-clicking on the desired state in the adjacent map. To remove a state, simply click on the name in the box above and press backspace or delete. Note that more than one state may be selected for comparison."),
            br(),
            create_input("date", usa_covid_data),
            helpText("The final control filters the time period displayed in the time series plot and table output should a specific time frame be of interest. This can be done by dragging either end of the slider to set a minimum and maximum date. Any dates included in the orignal data set may be selected."),
            width = 2
            
        ),
        mainPanel(
            h2("Impact of COVID19 by state in the USA"),
            helpText("The map below displays the geographic distribution of COVID19 in the USA, measuring both the 'Total Cases' and 'Total Deaths', depending on which is selected from the Control Panel to the left. The darker shades of red indicate a higher count of that measure in each state. Users can also hover over each state for additional information. This is useful for comparing data across states and regional areas in the USA. For example, Texas in the South and California in the West are faring a lot worse than their neighbouring states for 'Total Cases', while there seems to be a steady concentration and dispersion of cases in the North-West. Note that the data presented comes from the latest available date from the time of download, the 28th of September 2020"),
            br(),
            plotlyOutput("testplot", height = "600px", width = "1200px"),
            h2("Impact of COVID19 over time in the USA"),
            helpText("The plot and accompanying data table add a temporal element to the spread of COVID19 in the country. Any number of states can be selected in the Control Panel or by double-clicking on the map to compare the change in COVID19 overtime between states and to the average. For example, if Texas and California are selected, it can be seen that the two states have shared a similar progression in 'Total Cases' with a increase in the rate of infection beginning in late June, both far surpassing the national average. Additionally, the time frame displayed can also be altered in the Control Panel."),
            splitLayout(plotlyOutput("myplot", height = "500px", width = "800px"),
                        tableOutput("mykable"),
                        cellArgs = list(style = "padding: 5px"),
                        cellWidths = c("60%", "40%"))
        )
    ),
    includeCSS("styles.css")
)

# server -------------------------------------------------------
server <- function(input, output, session) {
    
    current_selection <- reactiveVal(NULL)
    
    observeEvent(input$state, {
        current_selection(input$state)
    })
    
    observeEvent(event_data("plotly_click"), {
        if(input$measure == "Total Cases") {
            click_df <- event_data("plotly_click")
            state <- if(click_df == 48){
                print("CALIFORNIA")
            } else if (click_df == 22){
                print("WASHINGTON")
            } else if (click_df == 12){
                print("OREGON")
            } else if (click_df == 13){
                print("IDAHO")
            } else if (click_df == 20){
                print("NEVADA")
            } else if (click_df == 43){
                print("ARIZONA")
            } else if (click_df == 4){
                print("MONTANA")
            } else if (click_df == 2){
                print("WYOMING")
            } else if (click_df == 19){
                print("UTAH")
            } else if (click_df == 18){
                print("COLORADO")
            } else if (click_df == 11){
                print("NEW MEXICO")
            } else if (click_df == 47){
                print("TEXAS")
            } else if (click_df == 24){
                print("OKLAHOMA")
            } else if (click_df == 8){
                print("NORTH DAKOTA")
            } else if (click_df == 16){
                print("KANSAS")
            } else if (click_df == 14){
                print("NEBRASKA")
            } else if (click_df == 9){
                print("SOUTH DAKOTA")
            } else if (click_df == 26){
                print("MINNESOTA")
            } else if (click_df == 23){
                print("IOWA")
            } else if (click_df == 28){
                print("MISSOURI")
            } else if (click_df == 21){
                print("ARKANSAS")
            } else if (click_df == 38){
                print("LOUISIANA")
            } else if (click_df == 25){
                print("MISSISSIPPI")
            } else if (click_df == 39){
                print("TENNESSEE")
            } else if (click_df == 17){
                print("KENTUCKY")
            } else if (click_df == 44){
                print("ILLINOIS")
            } else if (click_df == 29){
                print("WISCONSIN")
            } else if (click_df == 31){
                print("MICHIGAN")
            } else if (click_df == 27){
                print("INDIANA")
            } else if (click_df == 36){
                print("ALABAMA")
            } else if (click_df == 46){
                print("FLORIDA")
            } else if (click_df == 45){
                print("GEORGIA")
            } else if (click_df == 35){
                print("OHIO")
            } else if (click_df == 6){
                print("WEST VIRGINIA")
            } else if (click_df == 34){
                print("VIRGINIA")
            } else if (click_df == 41){
                print("NORTH CAROLINA")
            } else if (click_df == 33){
                print("SOUTH CAROLINA")
            } else if (click_df == 37){
                print("PENNSYLVANIA")
            } else if (click_df == 30){
                print("MARYLAND")
            } else if (click_df == 7){
                print("DELAWARE")
            } else if (click_df == 40){
                print("NEW JERSEY")
            } else if (click_df == 42){
                print("NEW YORK")
            } else if (click_df == 15){
                print("CONNECTICUT")
            } else if (click_df == 10){
                print("RHODE ISLAND")
            } else if (click_df == 32){
                print("MASSACHUSETTS")
            } else if (click_df == 0){
                print("VERMONT")
            } else if (click_df == 3){
                print("NEW HAMPSHIRE")
            } else if (click_df == 1){
                print("MAINE")
            }
            updateSelectInput(session, "state", selected = c(current_selection(),state))}
        if(input$measure == "Total Deaths") {
            click_df <- event_data("plotly_click")
            state <- if(click_df == 47){
                print("CALIFORNIA")
            } else if (click_df == 26){
                print("WASHINGTON")
            } else if (click_df == 11){
                print("OREGON")
            } else if (click_df == 9){
                print("IDAHO")
            } else if (click_df == 22){
                print("NEVADA")
            } else if (click_df == 38){
                print("ARIZONA")
            } else if (click_df == 3){
                print("MONTANA")
            } else if (click_df == 0){
                print("WYOMING")
            } else if (click_df == 8){
                print("UTAH")
            } else if (click_df == 23){
                print("COLORADO")
            } else if (click_df == 15){
                print("NEW MEXICO")
            } else if (click_df == 46){
                print("TEXAS")
            } else if (click_df == 16){
                print("OKLAHOMA")
            } else if (click_df == 5){
                print("NORTH DAKOTA")
            } else if (click_df == 14){
                print("KANSAS")
            } else if (click_df == 10){
                print("NEBRASKA")
            } else if (click_df == 4){
                print("SOUTH DAKOTA")
            } else if (click_df == 24){
                print("MINNESOTA")
            } else if (click_df == 20){
                print("IOWA")
            } else if (click_df == 25){
                print("MISSOURI")
            } else if (click_df == 21){
                print("ARKANSAS")
            } else if (click_df == 37){
                print("LOUISIANA")
            } else if (click_df == 29){
                print("MISSISSIPPI")
            } else if (click_df == 27){
                print("TENNESSEE")
            } else if (click_df == 18){
                print("KENTUCKY")
            } else if (click_df == 42){
                print("ILLINOIS")
            } else if (click_df == 19){
                print("WISCONSIN")
            } else if (click_df == 40){
                print("MICHIGAN")
            } else if (click_df == 33){
                print("INDIANA")
            } else if (click_df == 28){
                print("ALABAMA")
            } else if (click_df == 45){
                print("FLORIDA")
            } else if (click_df == 39){
                print("GEORGIA")
            } else if (click_df == 36){
                print("OHIO")
            } else if (click_df == 6){
                print("WEST VIRGINIA")
            } else if (click_df == 30){
                print("VIRGINIA")
            } else if (click_df == 32){
                print("NORTH CAROLINA")
            } else if (click_df == 31){
                print("SOUTH CAROLINA")
            } else if (click_df == 41){
                print("PENNSYLVANIA")
            } else if (click_df == 34){
                print("MARYLAND")
            } else if (click_df == 13){
                print("DELAWARE")
            } else if (click_df == 48){
                print("NEW JERSEY")
            } else if (click_df == 43){
                print("NEW YORK")
            } else if (click_df == 35){
                print("CONNECTICUT")
            } else if (click_df == 17){
                print("RHODE ISLAND")
            } else if (click_df == 44){
                print("MASSACHUSETTS")
            } else if (click_df == 1){
                print("VERMONT")
            } else if (click_df == 7){
                print("NEW HAMPSHIRE")
            } else if (click_df == 2){
                print("MAINE")
            }
            updateSelectInput(session, "state", selected = c(current_selection(),state))}
    })
    
    
    output$myplot <-
        renderPlotly({
            if(input$measure == "Total Cases") {
                us_cases <- us_covid_clean %>%
                    select(date,
                           state,
                           tot_cases) %>%
                    filter(date >= input$date[1] & date <= input$date[2])
                
                avg_cases <- average_measure(us_cases, "tot_cases")
                
                timeseries <- bind_rows(us_cases, avg_cases)
                
                plot <- timeseries %>%
                    filter(state == paste(tolower(input$state)) | state == "average") %>%
                    ggplot(aes(x = date,
                               y = tot_cases,
                               colour = toupper(state))) +
                    geom_line(size = 1) +
                    scale_color_brewer(palette = "Pastel1") +
                    scale_y_continuous(labels = comma) +
                    labs(title = "Change in Cases Over Time",
                         x = "",
                         y = "Cases",
                         colour = "") +
                    theme(text = element_text(size = 16, color = "white"),
                          panel.background = element_rect(fill = "black"),
                          rect = element_rect(fill = "black"),
                          panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                          legend.key = element_rect(fill = "black"),
                          axis.line = element_line(color = "white"),
                          axis.text = element_text(color = "white"),
                          axis.ticks = element_line(color = "white"))
                
                ggplotly(plot,
                         tooltip = c("date", "tot_cases")) %>%
                    config(displayModeBar = FALSE) }
            
            else if(input$measure == "Total Deaths"){
                us_deaths <- us_covid_clean %>%
                    select(date,
                           state,
                           tot_death) %>%
                    filter(date >= input$date[1] & date <= input$date[2])
                
                avg_deaths <- average_measure(us_deaths, "tot_death")
                
                timeseries <- bind_rows(us_deaths, avg_deaths)
                
                plot <- timeseries %>%
                    filter(state == paste(tolower(input$state)) | state == "average") %>%
                    ggplot(aes(x = date,
                               y = tot_death,
                               colour = toupper(state))) +
                    geom_line(size = 1) +
                    scale_color_brewer(palette = "Pastel1") +
                    scale_y_continuous(labels = comma) +
                    labs(title = "Change in Deaths Over Time",
                         x = "",
                         y = "Deaths",
                         colour = "") +
                    theme(text = element_text(size = 16, color = "white"),
                          panel.background = element_rect(fill = "black"),
                          rect = element_rect(fill = "black"),
                          panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                          legend.key = element_rect(fill = "black"),
                          axis.line = element_line(color = "white"),
                          axis.text = element_text(color = "white"),
                          axis.ticks = element_line(color = "white"))
                
                ggplotly(plot,
                         tooltip = c("date", "tot_death")) %>%
                    config(displayModeBar = FALSE)
            }
        })
    
    output$mykable <- function() {
        if(input$measure == "Total Cases") {
            state_cases <- us_cases %>%
                filter(state %in% paste(tolower(input$state))) %>%
                mutate(state = toupper(state)) %>%
                pivot_wider(names_from = state, values_from = tot_cases)
            
            national_cases <- avg_cases %>%
                pivot_wider(names_from = state, values_from = tot_cases)
            
            combined <- left_join(state_cases, national_cases) %>%
                rename(DATE = date,
                       AVERAGE = average) %>%
                filter(DATE >= input$date[1] & DATE <= input$date[2])
            
            present_table(combined, "cases", paste("State cases compared to national average"))}
        
        else if(input$measure == "Total Deaths"){
            state_deaths <- us_deaths %>%
                filter(state %in% paste(tolower(input$state))) %>%
                mutate(state = toupper(state)) %>%
                pivot_wider(names_from = state, values_from = tot_death)
            
            national_deaths <- avg_deaths %>%
                pivot_wider(names_from = state, values_from = tot_death)
            
            combined <- left_join(state_deaths, national_deaths) %>%
                rename(DATE = date,
                       AVERAGE = average) %>%
                filter(DATE >= input$date[1] & DATE <= input$date[2])
            
            present_table(combined, "deaths", paste("State deaths compared to national average"))
        }
    }
    
    output$testplot <-
        renderPlotly({
            options(scipen = 9999)
            if(input$measure == "Total Cases") {
                case_data <- us_covid_clean %>%
                    group_by(state) %>%
                    filter(tot_cases == max(tot_cases))
                
                case_map_data <- left_join(mapdata, case_data, by = c("region" = "state"))
                
                case_map <- ggplot() +
                    geom_polygon(data = case_map_data,
                                 aes(fill = tot_cases,
                                     x = long,
                                     y = lat,
                                     group = group,
                                     text = paste(toupper(region), "<br>",
                                                  "Total Cases:", format(tot_cases, big.mark = ",")))) +
                    theme_void() +
                    coord_map() +
                    labs(fill = "Total Cases") +
                    scale_fill_distiller(palette = "Reds", direction = 1, label = comma) +
                    theme(panel.background = element_rect(fill = "black"),
                          plot.background = element_rect(fill = "black"),
                          text = element_text(color = "white", size = 16),
                          axis.line = element_line(color = "black"),
                          panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
                    ggtitle("Total COVID19 Cases by State")
                
                ggplotly(case_map,
                         tooltip = "text")%>%
                    config(displayModeBar = FALSE)}
            
            else if(input$measure == "Total Deaths") {
                death_data <- us_covid_clean %>%
                    group_by(state) %>%
                    filter(tot_death == max(tot_death))
                
                death_map_data <- left_join(mapdata, death_data, by = c("region" = "state"))
                
                death_map <- ggplot() +
                    geom_polygon(data = death_map_data,
                                 aes(fill = tot_death,
                                     x = long,
                                     y = lat,
                                     group = group,
                                     text = paste(toupper(region), "<br>",
                                                  "Total Deaths:", format(tot_death, big.mark = ",")))) +
                    theme_void() +
                    coord_map() +
                    labs(fill = "Total Deaths") +
                    scale_fill_distiller(palette = "Reds", direction = 1, label = comma)+
                    theme(panel.background = element_rect(fill = "black"),
                          plot.background = element_rect(fill = "black"),
                          text = element_text(color = "white", size = 16),
                          axis.line = element_line(color = "black"),
                          panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
                    ggtitle("Total COVID19 Deaths by State")
                
                ggplotly(death_map,
                         tooltip = "text")%>%
                    config(displayModeBar = FALSE)}
        })
    
}

# run ----------------------------------------------------------
shinyApp(ui = ui, server = server)

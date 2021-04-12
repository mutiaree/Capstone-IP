

#library

library(lubridate)
library(scales)
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)
library(glue)
library(viridis)
library(leaflet)
library(DT)
library(shiny)
library(shinydashboard)
library(tidyverse)

#import data set

vgsales <- read.csv("~/Documents/Capstone-DV/capstone-dv/vgsales.csv")
vgsales <- vgsales[vgsales$Year != "N/A" , ]

vgsales <- vgsales %>%
  select(-Rank) %>% 
  mutate(
    Platform = as.factor(Platform),
    Genre = as.factor(Genre),
    Year = year(as.Date(as.character(Year), format = "%Y")))

glimpse(vgsales)

colors <- c("Global Sales"="red", "North America Sales"="blue", "Europe Sales"="green", "Japan Sales"="orange",
            "The Rest of the World"="yellow")





#header---------------------------------------------------------------------------
header <-
    dashboardHeader(title = "Video Games Dashboard")


#sidebar--------------------------------------------------------------------------
sidebar <- dashboardSidebar(sidebarMenu(
    menuItem(
        text = "Top Games",
        tabName = "topgames",
        badgeLabel = "dashboard",
        badgeColor = "blue",
        icon = icon("gamepad")
    ),
    
    menuItem(
        text = "Trend",
        tabName = "trend",
        badgeLabel = "dashboard",
        badgeColor = "blue",
        icon = icon("chart-line")
    ),
    
    menuItem(
        text = "Data",
        tabName = "data",
        badgeLabel = "table",
        badgeColor = "blue",
        icon = icon("table")
        )
    )
)



#body ----------------------------------------------------------------------------
body <- dashboardBody(
    tabItems(
        tabItem(
            tabName = "topgames",
            
            fluidRow(
                box(
                    title = "Video Games Overview Global Sales by Platform",
                    width = 12,
                    
                    selectInput(
                        inputId = "platform",
                        label = "Please select the platform:",
                        choices = unique(vgsales$Platform)
                    ),
                    
                    plotlyOutput(outputId = "plot"),
                    br(),
                    valueBoxOutput(outputId = "numberofgames", width = 6),
                    valueBoxOutput(outputId = "totalearning", width = 6)
                    ),
                
                box(
                    title = "Video Games Overview Global Sales by Genre",
                    width = 12,
                    
                    selectInput(
                        inputId = "genre",
                        label = "Please select the genre:",
                        choices = unique(vgsales$Genre)
                    ),
                    
                    plotlyOutput(outputId = "plot2"),
                    br(),
                    valueBoxOutput(outputId = "numberofgames2", width = 6),
                    valueBoxOutput(outputId = "totalearning2", width = 6)
                    ),
                )
            ),
        
        tabItem(
            tabName = "trend",
            
            fluidRow(
                box(
                    title = "Total Global Sales of Video Games throughout the Year",
                    width = 12,
                ),
                
                plotlyOutput(outputId = "plot3"),
            
                
            fluidRow(
                box(
                    title = "Total Global Sales by Genre throughout the Years",
                    width = 12,
                    radioButtons(
                        inputId = "salesgenre",
                        label = "Select the Genre:",
                        choices = unique(vgsales$Genre), inline = T
                    ),
                    
                    plotlyOutput(outputId = "plot4")
                    ),
            box(
                title = "Total Global Sales by Platform throughout the Years",
                width = 12,
                radioButtons(
                    inputId = "salesplatform",
                    label = "Select the platform:",
                    choices = unique(vgsales$Platform), inline = T
                    
                ),
                plotlyOutput("plot5")
        )
    ))
    
    ),
        
        tabItem(
            tabName = "data",
            
            fluidRow(
                box(
                    title = "Raw Data",
                    width = 12,
                    
                    DT::dataTableOutput("rawData"),
                )
            )
        )
    )
)












#dashboard-----------------------------------------------------------------------

dashboardPage(header, sidebar, body, skin = "blue")

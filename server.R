function(input, output)  {
  #Dashboard Global Tab-------------------------------------------------------------
 
  #TAB 1---------------------------------------------------------------------
   
  #output1 value box plot1
  output$numberofgames <- renderValueBox({
    topgame <-  vgsales %>%
      filter(Platform %in% input$platform) %>% 
      group_by(Platform) %>%
      summarise(freq = n())
    
    valueBox(
      subtitle = "Total Games On Selected Platform",
      value = topgame,
      icon = icon("gopuram"),
      color = "blue",
      width = 6
    )
    
  })
  
  #output2 value box plot1
  output$totalearning <- renderValueBox({
    topgame <-  vgsales %>%
      filter(Platform %in% input$platform) %>% 
      group_by(Platform) %>%
      summarise(total = sum(Global_Sales))
    
    valueBox(
      subtitle = "Total Earnings From Selected Plaform In Million Dollar",
      value = topgame,
      icon = icon("dollar"),
      color = "green",
      width = 6
    )
    
  })
  
  #output plot1
  output$plot <- renderPlotly({
    
     topgame <-  vgsales %>%
       filter(Platform %in% input$platform) %>%
       arrange(desc(Global_Sales)) %>% 
       mutate(
         text = glue(
           "Value: {Global_Sales}"
         ) 
       ) %>% 
       head(10) %>% 
       ggplot(mapping = aes(x = Global_Sales, 
                            y = reorder(Name, Global_Sales),
                            fill = Name,
                            text = text))+
       geom_col() +
       labs(
         title = "Top 10 Best Selling Games By Platform",
         x = "Global Value In Million Dollar",
         y = "Name of Games"
       ) +
       theme_bw() +
       theme(legend.position = "none")
     
     ggplotly(topgame, tooltip = "text")
    
  })
  
  #output1 value box plot2
  output$numberofgames2 <- renderValueBox({
    topgame <-  vgsales %>%
      filter(Genre %in% input$genre) %>% 
      group_by(Genre) %>%
      summarise(freq = n())
    
    valueBox(
      subtitle = "Total Games By Genre",
      value = topgame,
      icon = icon("gopuram"),
      color = "blue",
      width = 6
    )
    
  })
  
  #output2 value box plot2
  output$totalearning2 <- renderValueBox({
    topgame <-  vgsales %>%
      filter(Genre %in% input$genre) %>% 
      group_by(Genre) %>%
      summarise(total = sum(Global_Sales))
    
    valueBox(
      subtitle = "Total Earnings From Selected Genre In Million Dollar",
      value = topgame,
      icon = icon("dollar"),
      color = "green",
      width = 6
    )
    
  })
  
  #output plot2
  output$plot2 <- renderPlotly({
    
    topgenre <-  vgsales %>%
      filter(Genre %in% input$genre) %>%
      arrange(desc(Global_Sales)) %>% 
      mutate(
        text = glue(
          "Value: {Global_Sales}"
        ) 
      ) %>% 
      head(10) %>% 
      ggplot(mapping = aes(x = Global_Sales, 
                           y = reorder(Name, Global_Sales),
                           fill = Name,
                           text = text))+
      geom_col() +
      labs(
        title = "Top 10 Best Selling Games By Genre",
        x = "Global Value In Million Dollar",
        y = "Genre Game"
      ) +
      theme_bw() +
      theme(legend.position = "none")
    
    ggplotly(topgenre, tooltip = "text")
    
  })
  
  #TAB2----------------------------------------------------------------------
  
  #output plot3
  
  output$plot3 <- renderPlotly({
    
    sumofsales <- vgsales %>% 
      group_by(Year) %>%
      summarise(sum_global_sales = sum(Global_Sales),sum_others_sales = sum(Other_Sales),
                sum_jb_sales = sum(JP_Sales),sum_eu_sales = sum(EU_Sales),
                sum_na_sales = sum(NA_Sales),.groups = 'drop') %>% 
      ggplot(mapping= aes(x= Year)) +
      geom_line(aes(y= sum_global_sales,group=1,color="Global Sales" ),linetype = "dashed")+
      geom_line(aes(y= sum_na_sales,group=1,color="North America Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_eu_sales,group=1,color="Europe Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_jb_sales,group=1,color="Japan Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_others_sales,group=1,color="The Rest of the World"),linetype = "dashed")+
      geom_point(aes(y= sum_global_sales),size = 0.3) +
      geom_point(aes(y= sum_na_sales),size = 0.3) +
      geom_point(aes(y= sum_eu_sales),size = 0.3) +
      geom_point(aes(y= sum_jb_sales),size = 0.3) +
      geom_point(aes(y= sum_others_sales),size = 0.3)+
      scale_color_manual(name="Sales",values = colors)+
      ggtitle("Total of Global Sales by Year") +
      xlab("Years") +
      ylab("in millions") +
      theme_bw()+
      theme(legend.position = "top")
      
    
  })
  
  #output plot4
  output$plot4 <- renderPlotly({
    
    salegenre <- vgsales %>% 
      filter(Genre%in% input$salesgenre) %>% 
      group_by(Year) %>%
      summarise(sum_global_sales = sum(Global_Sales),sum_others_sales = sum(Other_Sales),
                sum_jb_sales = sum(JP_Sales),sum_eu_sales = sum(EU_Sales),
                sum_na_sales = sum(NA_Sales),.groups = 'drop') %>% 
      ggplot(mapping= aes(x= Year)) +
      geom_line(aes(y= sum_global_sales,group=1,color="Global Sales" ),linetype = "dashed")+
      geom_line(aes(y= sum_na_sales,group=1,color="North America Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_eu_sales,group=1,color="Europe Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_jb_sales,group=1,color="Japan Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_others_sales,group=1,color="The Rest of the World"),linetype = "dashed")+
      geom_point(aes(y= sum_global_sales),size = 0.3) +
      geom_point(aes(y= sum_na_sales),size = 0.3) +
      geom_point(aes(y= sum_eu_sales),size = 0.3) +
      geom_point(aes(y= sum_jb_sales),size = 0.3) +
      geom_point(aes(y= sum_others_sales),size = 0.3) +
      scale_color_manual(name="Sales",values = colors)+
      ggtitle("Total of Global Sales by Year") +
      xlab("Years") +
      ylab("in millions") +
      theme_bw()+
      theme(legend.position = "top")
   
    })
  
  #output plot5
  output$plot5 <- renderPlotly({
    
    salegenre <- vgsales %>% 
      filter(Platform %in% input$salesplatform) %>% 
      group_by(Year) %>%
      summarise(sum_global_sales = sum(Global_Sales),sum_others_sales = sum(Other_Sales),
                sum_jb_sales = sum(JP_Sales),sum_eu_sales = sum(EU_Sales),
                sum_na_sales = sum(NA_Sales),.groups = 'drop') %>% 
      ggplot(mapping= aes(x= Year)) +
      geom_line(aes(y= sum_global_sales,group=1,color="Global Sales" ),linetype = "dashed")+
      geom_line(aes(y= sum_na_sales,group=1,color="North America Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_eu_sales,group=1,color="Europe Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_jb_sales,group=1,color="Japan Sales"),linetype = "dashed")+
      geom_line(aes(y= sum_others_sales,group=1,color="The Rest of the World"),linetype = "dashed")+
      geom_point(aes(y= sum_global_sales),size = 0.3) +
      geom_point(aes(y= sum_na_sales),size = 0.3) +
      geom_point(aes(y= sum_eu_sales),size = 0.3) +
      geom_point(aes(y= sum_jb_sales),size = 0.3) +
      geom_point(aes(y= sum_others_sales),size = 0.3) +
      scale_color_manual(name="Sales",values = colors)+
      ggtitle("Total of Global Sales by Year") +
      xlab("Years") +
      ylab("in millions") +
      theme_bw()+
      theme(legend.position = "top")
    
  })
    
  
  #TAB3----------------------------------------------------------------------
  
  output$rawData <- DT::renderDataTable(
    expr = datatable(vgsales, options = list(scrollX = TRUE))
  )
  
}
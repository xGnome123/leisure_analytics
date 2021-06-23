setwd("../..")

source("code_R_db_src/dota2/db_src_OG2TI.R")

ui <- dashboardPage(
  dashboardHeader(title = "OG"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", 
               icon = icon("globe"),
               badgeLabel = "Summary", badgeColor = "red")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("overview",
              fluidRow(
                box(width = 2, status = "success",
                    solidHeader = TRUE, title = "Playoffs (TI8)",
                    DTOutput("dt_ti8_TIplayoffs")),
                box(width = 3, status = "success",
                    solidHeader = TRUE, title = "Group Stage (TI8)",
                    DTOutput("dt_ti8_TIgs")),
                box(width = 3, status = "success",
                    solidHeader = TRUE, title = "Closed Qualifier Group Stage (TI8)",
                    DTOutput("dt_ti8_CQgs")),
                box(width = 4, status = "success",
                    solidHeader = TRUE, title = "Open Qualifier (TI8)",
                    DTOutput("dt_ti8_OQ"))
              ),
              fluidRow(
                box(width = 2, status = "info",
                    solidHeader = TRUE, title = "Playoffs (TI9)",
                    DTOutput("dt_ti9_TIplayoffs")),
                box(width = 3, status = "info",
                    solidHeader = TRUE, title = "Group Stage (TI9)",
                    DTOutput("dt_ti9_TIgs")),
                box(width = 3, status = "success",
                    solidHeader = TRUE, title = "Closed Qualifier Playoffs (TI8)",
                    DTOutput("dt_ti8_CQplayoffs")),
                box(width = 4, status = "danger",
                    solidHeader = TRUE, title = "Most Played Opponents",
                    DTOutput("dt_opponents"))
              )
      )
    )
  )
)

##### Server #####
server <- function(input, output){
  
  ##### Overview #####
  
  # TI8 OQ
  output$dt_ti8_OQ <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI8_OQ1_Playoffs") %>%
      select(-TI_Round_Type)

    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
                        ) %>%
      formatStyle(columns = colnames(data), 
                      fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
                  )
    
    DT
    
  })
  
  # TI8 CQ
  output$dt_ti8_CQgs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI8_CQ_Group Stage") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # TI8 CQ Playoffs
  output$dt_ti8_CQplayoffs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI8_CQ_Playoffs") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # TI8 TI Group Stage
  output$dt_ti8_TIgs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI8_TI_Group Stage") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # TI8 TI Playoffs
  output$dt_ti8_TIplayoffs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI8_TI_Playoffs") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # TI9 TI Group Stage
  output$dt_ti9_TIgs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI9_TI_Group Stage") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # TI9 TI Playoffs
  output$dt_ti9_TIplayoffs <- renderDT({
    
    data <- df_OG_message %>%
      filter(TI_Round_Type == "TI9_TI_Playoffs") %>%
      select(-TI_Round_Type)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%') %>%
      formatStyle(columns = colnames(data)[1],
                  valueColumns = colnames(data)[1],
                  backgroundColor = styleEqual(c("Win", "Lose", "Draw", "Walkover"),
                                               c("lightgreen", "lightpink", "lightyellow", "lightgrey"))
      )
    
    DT
    
  })
  
  # Opponents
  output$dt_opponents <- renderDT({
    
    data <- df_OG_teams %>%
      select(Team, Played, Won, Lost, `Win Rate`) %>%
      filter(Played >= 3)
    
    DT <- DT::datatable(data, 
                        # rownames = FALSE,
                        options = list(pageLength = nrow(data),
                                       dom = 't',
                                       headerCallback = DT::JS(
                                         "function(thead) {",
                                         "  $(thead).css('font-size', '0.8em');",
                                         "}"
                                       ))
    ) %>%
      formatStyle(columns = colnames(data), 
                  fontSize = '100%')
    
    DT
    
  })
  
}

shinyApp(ui, server)
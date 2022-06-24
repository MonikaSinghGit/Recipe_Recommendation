library(shiny)

shinyServer(function(input, output)
{
  
  output$Appetizers <- renderTable(
    recipes %>%
      mutate(clean_ing = unlist(recipes$clean_ingredients)) %>%
      filter(str_detect(clean_ing, c(input$ing_app))) %>%
      select(title, link)
    
  )
  
  output$Soups <- renderTable(
    recipes %>%
      mutate(clean_title = unlist(recipes$title)) %>%
      filter(str_detect(clean_title, "Soup")) %>%
      filter(str_detect(clean_ingredients, c(input$ing_soup))) %>%
      select(title, link)
    
  )
  
  
  
  output$Salads <- renderTable(
    recipes %>%
      mutate(clean_title = unlist(recipes$title)) %>%
      filter(str_detect(clean_title, "Salad")) %>%
      mutate(clean_ing = unlist(recipes$clean_ingredients)) %>%
      filter(str_detect(clean_ing, c(input$ing))) %>%
      select(title, ingredients, directions,link)
    
  )
  
  
  
})
  
  
 
  

  
#   output$buildingtype <- renderPlot({
#     
#     df_bldg <- df %>%
#       group_by(BldgType) %>%
#       summarise(MedianPrice = median(SalePrice / 1000))
#     
#     df_bldg_sel <- df %>%
#       filter(Neighborhood %in% input$hood_analysis) %>%
#       group_by(BldgType) %>%
#       summarise(MedianPrice_sel = median(SalePrice / 1000))
#       
#     df_bldg_join <- df_bldg %>%
#       left_join(df_bldg_sel) %>%
#       melt(id.vars='BldgType')
#       
#       ggplot() +
#         geom_bar(data = df_bldg_join, aes(x = BldgType, y = value, fill = variable), width = 0.5, stat = 'identity', position = 'dodge') +
#       theme_pander() +
#       labs(
#         x = 'Building Type',
#         y = 'Median Sale Price ($1000 USD)',
#         color = 'Neighborhood'
#       ) +
#       scale_fill_manual(
#         values = c("#EEB462", "#CD7672"),
#         name = "Legend",
#         labels = c("Ames", (neighborhoods %>% filter(Neighborhood == input$hood_analysis))$Name)
#       ) +
#         scale_x_discrete("Building Type", 
#                          breaks = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"), 
#                          labels=c("Single Family","2-Family", "Duplex", "Townhouse(Inside)","Townhouse(End)")) +
#       theme(axis.text.x = element_text(
#         size = 11,
#         angle = 30,
#         vjust = .8,
#         hjust = 0.8
#       ))
#   })
#   
#   output$price_sqft <- renderPlot({
#       ggplot()+
#       geom_point(data = df %>%
#                    mutate(SFPrice = round(SalePrice / (TotalBsmtSF + GrLivArea), 2)),
#                  aes(x = GrLivArea, y = SFPrice),  color = '#dddddd', alpha = 0.5)+
#       geom_point(data = df %>%
#                    mutate(SFPrice = round(SalePrice / (TotalBsmtSF + GrLivArea), 2)) %>%
#                    filter(Neighborhood %in% input$hood_analysis),
#                  aes(x = GrLivArea, y = SFPrice), color = '#CD7672', size = 3)+
#       theme_pander() +
#       xlim(0, 4000) +
#       ylim(0,150) +
#       theme(legend.position = "none") +
#       labs(x = "Above Ground Living Area (Sq Ft)", y = "Price Per Sq")
#     
#   })
#   
#   output$price_qual <- renderPlot({
#     df_qual <- df %>%
#       mutate(TotSF = TotalBsmtSF + GrLivArea) %>%
#       mutate(SFPrice = round(SalePrice / TotSF, 2)) %>%
#       mutate(OverallQual = as.factor(OverallQual))
#     
#       ggplot() +
#       geom_jitter(data = df_qual, aes(x = OverallQual, y = SFPrice),
#                   color = '#dddddd', alpha = 0.5) +
#       geom_jitter(data = df_qual %>% filter(Neighborhood %in% input$hood_analysis), aes(x = OverallQual, y = SFPrice),
#                   color = "#222222", fill = "#222222", size = 2, alpha = 0.75) +
#       geom_boxplot(data = df_qual %>% filter(Neighborhood %in% input$hood_analysis), aes(x = OverallQual, y = SFPrice),
#                    color = "#CD7672", fill = "#CD7672", alpha = 0.5) +
#       theme_pander() +
#       labs(x = "Overall Quality", y = "Price Per Sq")
#   })
# 
#   
#   
#   output$density <- renderPlot({
#     df_density <- df %>%
#       mutate(SalePriceShort = round(SalePrice / 1000), 2)
#     ggplot()+
#       geom_density(data = df_density, aes(x = SalePriceShort, fill = "#000000"), alpha = 0.5) +
#       geom_density(data = df_density %>% filter (Neighborhood %in% input$hood_analysis),
#                    aes(x = SalePriceShort, fill = "#ffffff"), alpha = 0.5) +
#       theme_pander() +
#       labs(x = 'SalePrice ($1000 USD)', y = 'Density') +
#       scale_fill_manual(
#         values = c("#EEB462", "#CD7672"),
#         name = "Legend",
#         labels = c("Ames", (neighborhoods %>% filter(Neighborhood == input$hood_analysis))$Name)
#       )
#   })
#   
#   
#   
# 
#   
#   
#   
#  
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   output$prediction <- renderText({
#     predict = coef[1:4,2] %*% c(1,input$BedroomAbvGr_prediction,input$FullBath_prediction,input$GrLivArea_prediction)
#     if (input$BldgType_prediction != '1Fam')
#       predict = predict + coef[coef$X == paste("BldgType", input$BldgType_prediction, sep='_'),2]
#     if (input$hood_prediction != 'Blmngtn')
#       predict = predict + coef[coef$X == paste("Neighborhood", input$hood_prediction, sep='_'),2]
#     predict = round(predict,-2)
#     paste("The predicted price is: $", predict, sep = "")
#   })
#   
#   output$prediction_graph <- renderPlot({
#     predict = coef[1:4,2] %*% c(1,input$BedroomAbvGr_prediction,input$FullBath_prediction,input$GrLivArea_prediction)
#     if (input$BldgType_prediction != '1Fam')
#       predict = predict + coef[coef$X == paste("BldgType", input$BldgType_prediction, sep='_'),2]
#     if (input$hood_prediction != 'Blmngtn')
#       predict = predict + coef[coef$X == paste("Neighborhood", input$hood_prediction, sep='_'),2]
#     predict = round(predict,-2)
#     
#     ggplot()+
#       geom_point(data = df,
#                  aes(x = GrLivArea, y = SalePrice),  color = '#dddddd', alpha = 0.5)+
#       geom_point(data = df %>%
#                    filter(Neighborhood == input$hood_prediction &
#                             BedroomAbvGr == input$BedroomAbvGr_prediction &
#                             FullBath >= input$FullBath_prediction &
#                             GrLivArea >= input$GrLivArea_prediction -250 &
#                             GrLivArea <= input$GrLivArea_prediction +250 &
#                             BldgType == input$BldgType_prediction),
#                  aes(x = GrLivArea, y = SalePrice), color = '#EEB462', size = 3, alpha = 1)+
#       
#       geom_point(data = data.frame(GrLivArea = input$GrLivArea_prediction, SalePrice = predict),
#                  aes(x = GrLivArea, y = SalePrice), fill = '#CD7672',  color = '#222222', shape = 22, size = 5, alpha = 1)+
#       geom_text(data = data.frame(GrLivArea = input$GrLivArea_prediction, SalePrice = predict), 
#                  aes(x = GrLivArea, y = SalePrice+30000, label = "Our Prediction"), size = 5)+
#       
#       theme_pander() +
#       xlim(0, 3000) +
#       ylim(0,500000) +
#       theme(legend.position = "none") +
#       labs(x = "Above Ground Living Area (Sq Ft)", y = "Historic Sales Price (USD)")
#   })
# })
# 

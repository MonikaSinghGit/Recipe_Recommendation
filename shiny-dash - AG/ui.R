# hoods = data.frame(t(nbhd$Neighborhood))
# colnames(hoods) <- nbhd$Name


shinyUI(dashboardPage(
  skin = "green",
  
  dashboardHeader(title = "Recipes"),
  
  
  # Menu Items in the Sidebar -----------------------------------------------
  
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Appetizers",
        tabName = "Appetizers",
        icon = icon("fas fa-bread-slice", lib = "font-awesome")
      ),
      menuItem(
        "Soups",
        tabName = "Soups",
        icon = icon("spoon", lib = "font-awesome")
      ),
      menuItem(
        "Salad",
        tabName = "Salad",
        icon = icon("fas fa-birthday-cake", lib = "font-awesome")
      ),
      menuItem(
        "Main",
        tabName = "Main",
        icon = icon("utensils", lib = "font-awesome")
      ),
      menuItem(
        "Baked Goods",
        tabName = "Baked",
        icon = icon("fas fa-cookie", lib = "font-awesome")
      ),

      menuItem(
        "Info",
        tabName = "Info",
        icon = icon("fas fa-info", lib = "font-awesome")
      )
    )
  ),
  
  
  
  dashboardBody(
    
    # Information page - Info tab from side bar -------------------------------
                
                tabItems(
                  tabItem(tabName = "Info",
                          
                          
                          # Info Section about ML ---------------------------------------------------
                          
                          
                          
                          fluidRow(
                            column(
                              width = 4,
                              box(
                                class = "text-left",
                                title = "Recipe Finder",
                                # img(
                                #   src = "ML.png",
                                #   width = "100%",
                                #   height = "70%"
                                # ),
                                width = 12,
                                style = "height:500px"
                              )
                            ),
                            
                            column(
                              width = 4,
                              box(
                                class = "text-left",
                                title = "Shiny App Development",
                                div(
                                  class = "text-left",
                                  width = "100%",
                                  p(
                                    "A web-based application was produced using Shiny in R studio.
                         The application provides the user with an interactive interface
                         to explore recipes that are available to selected ingredients."
                                  ),
                                  
                                  #img(
                                  #src = "Screenshot 2022-05-28 204005.jpg",
                                  #width = "80%",
                                  #height = "80%"
                                ),
                                width = 12,
                                style = "height:500px"
                              )
                            ),
                            
                            
                            
                            # Info Section about AMES -------------------------------------------------
                            
                            
                            # column(width = 3,
                            #        box(
                            #          width = 12,
                            #          style = "height:500px",
                            #          title = "Ames, Iowa",
                            #          flipBox(
                            #            id = "myflipbox2",
                            #            width = 12,
                            #            front = div(
                            #              class = "text-center",
                            #              width = "100%",
                            #              img(src = "Ames_Montage.jpg",
                            #                  width = "80%")
                            #            ),
                            #            back = div(
                            #              class = "text-left",
                            #              width = "100%",
                            #              p(
                            #                "Ames (/eɪmz/) is a city in Story County, Iowa, United States, located approximately 30 miles (48 km) north of
                            #         Des Moines in central Iowa. It is best known as the home of Iowa State University (ISU), with
                            #         leading agriculture, design, engineering, and veterinary medicine colleges. A United States Department of Energy national laboratory,
                            #         Ames Laboratory, is located on the ISU campus."
                            #              ),
                            #              br(),
                            #              p(
                            #                "According to the 2020 census, Ames had a population of 66,427, making it the state's ninth largest city.
                            #         Iowa State University was home to 33,391 students as of fall 2019, which make up approximately one half of
                            #         the city's population."
                            #              ),
                            #
                            #            )
                            #          )
                            #        )
                            #        ),
                            
                            
                            
                            
                            
                            # Info Section about the team ---------------------------------------------
                            
                            # Info about Alex ---------------------------------------------------------
                            
                            
                            
                            
                            column(
                              width = 4,
                              userBox(
                                width = 12,
                                collapsed = TRUE,
                                title = userDescription(
                                  title = "Alex",
                                  type = 2,
                                  image = "alex2.jpg"
                                ),
                                div(
                                  class = "text-center",
                                  height = "100%",
                                  width = "100%",
                                  br(),
                                  
                                  h4("Alex Galczak"),
                                  h6("Data Science Fellow"),
                                  div(
                                    class = "text-center",
                                    a(
                                      href = 'https://github.com/AlexGalczak',
                                      
                                      icon("fab fa-github", lib = "font-awesome"),
                                      "GitHub",
                                      title = "GitHub"
                                    ),
                                    br(),
                                    a(
                                      href = 'https://www.linkedin.com/in/aleksandragalczak/',
                                      icon("fab fa-linkedin", lib = "font-awesome"),
                                      "LinkedIn",
                                      title = "LinkedIn"
                                    )
                                  )
                                  
                                )
                              ),
                              
                              
                              # Info about Chad ---------------------------------------------------------
                              
                              
                              
                              # userBox(
                              #   width = 12,
                              #   collapsed = TRUE,
                              #   title = userDescription(
                              #     title = "Chad",
                              #     type = 2,
                              #     image = "chad.png"
                              #   ),
                              #   div(
                              #     class = "text-center",
                              #     height = "100%",
                              #     width = "100%",
                              #     br(),
                              #     h4("Chad Loh"),
                              #     h6("Data Science Fellow")),
                              #   div(
                              #     class = "text-center",
                              #     a(href = 'https://github.com/chadloh',
                              #
                              #       icon("fab fa-github", lib = "font-awesome"),
                              #       "GitHub",
                              #       title = "GitHub"), br(),
                              #     a(href = 'https://www.linkedin.com/in/chadloh',
                              #       icon("fab fa-linkedin", lib = "font-awesome"),
                              #       "LinkedIn",
                              #       title = "LinkedIn")
                              #   )
                              # ),
                              
                              
                              # Info about Michelle -----------------------------------------------------
                              
                              
                              
                              #
                              # userBox(
                              #   width = 12,
                              #   collapsed = TRUE,
                              #   title = userDescription(
                              #     title = "Michelle",
                              #     type = 2,
                              #     image = "MB.png"
                              #   ),
                              #
                              #   div(
                              #     class = "text-center",
                              #     height = "100%",
                              #     width = "100%",
                              #     br(),
                              #     h4("Michelle Bui"),
                              #     h6("Data Science Fellow"),
                              #     div(
                              #       class = "text-center",
                              #       a(href = 'https://github.com/mb3005',
                              #
                              #         icon("fab fa-github", lib = "font-awesome"),
                              #         "GitHub",
                              #         title = "GitHub"), br(),
                              #       a(href = 'https://www.linkedin.com/in/michellebui3005/',
                              #         icon("fab fa-linkedin", lib = "font-awesome"),
                              #         "LinkedIn",
                              #         title = "LinkedIn")
                              #     )
                              #
                              #   )
                              # ),
                              
                              
                              
                              # Info about James --------------------------------------------------------
                              
                              userBox(
                                width = 12,
                                collapsed = TRUE,
                                title = userDescription(
                                  title = "James",
                                  type = 2,
                                  image = "reno_1x1.jpg"
                                ),
                                
                                div(
                                  class = "text-center",
                                  height = "100%",
                                  width = "100%",
                                  br(),
                                  h4("James Reno"),
                                  h6("Data Science Fellow"),
                                  div(
                                    class = "text-center",
                                    a(
                                      href = 'https://github.com/jamesreno2',
                                      
                                      icon("fab fa-github", lib = "font-awesome"),
                                      "GitHub",
                                      title = "GitHub"
                                    ),
                                    br(),
                                    a(
                                      href = 'https://www.linkedin.com/in/jamesmichaelreno/',
                                      icon("fab fa-linkedin", lib = "font-awesome"),
                                      "LinkedIn",
                                      title = "LinkedIn"
                                    )
                                  )
                                )
                                
                              )
                            )
                          )),
                  
                  
                  
                  # Map page - Appetizer tab from sidebar -----------------------------------------
                  
                  
                  # Reactive input boxes ----------------------------------------------------
                  
                  
                  
                  
                  tabItem
                  (tabName = "Appetizers",
                    fluidRow(column(
                      width = 3,
                      
                      box(
                        title = "Select Ingredients:",
                        solidHeader = TRUE,
                        width = 12,
                        style = "height:120px",
                        checkboxGroupInput
                        (
                          "ing_app",
                          label = NULL,
                          choices = c(meat, vegetable),
                          selected = "onion",
                          inline = TRUE
                          
                        )
                      )
                    ),
                    
                    
                    
                    
                    # Reactive output
                    
                    
                    
                    
                    column(width = 9,
                           (
                             box
                             (title = "Appetizer Recipes",
                               tableOutput("Appetizer"),
                               width = 12)
                           )))),
                  
                  # Soups page - Soups tab from sidebar --------------------------------
                  
                  tabItem
                  (tabName = "Soups",
                    fluidRow(column(
                      width = 3,
                      
                      box(
                        title = "Select Ingredients:",
                        solidHeader = TRUE,
                        width = 12,
                        style = "height:120px",
                        checkboxGroupInput
                        (
                          "ing_soup",
                          label = NULL,
                          choices = c(meat, vegetable),
                          selected = "onion",
                          inline = TRUE
                          
                        )
                      )
                    ),
                    
                    
                    
                    
                    # Reactive output
                    
                    
                    
                    
                    column(width = 9,
                           (
                             box
                             (title = "Soup Recipes",
                               tableOutput("Soups"),
                               width = 12)
                           ))))
                  
                  
                  
                  # Predictions page - Predictions tab from sidebar -------------------------
                  
                  
                  
                  
                  # tabItem(
                  #   tabName = "Predictions",
                  #   fluidRow
                  #   
                  #   
                  #   # reactive input boxes ----------------------------------------------------
                  #   
                  #   
                  #   (
                  #     box(
                  #       title = "Neighborhood",
                  #       width = 4,
                  #       style = "height:120px",
                  #       selectInput
                  #       (
                  #         input = "hood_prediction",
                  #         label = NULL,
                  #         choices = c(hoods),
                  #         multiple = FALSE,
                  #         selected = "NAmes"
                  #       )
                  #     ),
                  #     box(
                  #       title = "Baths",
                  #       width = 2,
                  #       style = "height:120px",
                  #       sliderInput(
                  #         "FullBath_prediction",
                  #         label = NULL,
                  #         min = 0,
                  #         max = 5,
                  #         value = 1
                  #       )
                  #     ),
                  #     box(
                  #       title = "Beds",
                  #       width = 2,
                  #       style = "height:120px",
                  #       sliderInput(
                  #         "BedroomAbvGr_prediction",
                  #         label = NULL,
                  #         min = 0,
                  #         max = 5,
                  #         value = 3
                  #       )
                  #     ),
                  #     box(
                  #       title = "Area",
                  #       width = 2,
                  #       style = "height:120px",
                  #       sliderInput
                  #       (
                  #         "GrLivArea_prediction",
                  #         label = NULL,
                  #         min = 0,
                  #         max = 5000,
                  #         value = 1200,
                  #         step = 200,
                  #         round = 2
                  #       )
                  #     ),
                  #     box(
                  #       title = "Building Type",
                  #       width = 2,
                  #       style = "height:120px",
                  #       radioButtons(
                  #         "BldgType_prediction",
                  #         label = NULL,
                  #         #choices  = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                  #         choiceNames = c(
                  #           "Single Family",
                  #           "2-Family",
                  #           "Duplex",
                  #           "Townhouse(Inside)",
                  #           "Townhouse(End)"
                  #         ),
                  #         choiceValues = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                  #         inline = TRUE,
                  #         selected = "1Fam"
                  #       )
                  #     )
                  #   ),
                  #   
                  #   
                  #   # Reactive outputs --------------------------------------------------------
                  #   
                  #   
                  #   fluidRow(
                  #     box
                  #     (
                  #       title = "Recipe",
                  #       width = 4,
                  #       style = "height: 500px",
                  #       h2(textOutput("recipe"))
                  #     ),
                  #     box(
                  #       title = "Comparison to historic sales",
                  #       width = 8,
                  #       style = "height: 500px",
                  #       plotOutput("prediction_graph")
                  #    )
                      
                  #  )
                  )
                ))
)


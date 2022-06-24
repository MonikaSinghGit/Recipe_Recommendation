


library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(rsconnect)

library(tidyverse)
library(osmdata)
library(sf)

library(ggrepel)
library(ggiraph)
library(fontawesome)
library(reshape2)
library(bslib)
library(ggridges)
library(viridis)
library(hrbrthemes)
library(ggExtra)
library(RColorBrewer)
library(ggthemes)






options(scipen=10000)


# 
# load("ames_mapdata.RData")
# df <- as.data.frame(read.csv("Ames_HousePrice_df.csv"))
# nbhd <- as.data.frame(read.csv("Ames_HousePrice_nbhd.csv"))
# neighborhoods <- as.data.frame(read.csv("neighborhoods.csv"))
# house_price <- data.frame(read.csv('Ames_HousePrice_cleaned_new.csv'))
# clean_dummy <- read.csv('cleaned_dummies.csv')
# coef <- read.csv('shinycoeff.csv')

recipes <- as.data.frame(read.csv("Recipe_sample_dataset_small_heroclean.csv"))

food <- as.data.frame(read.csv("food.csv"))

meat <- c('chicken','beef','pork')

seafood <- c('salmon','shrimp','tilapia','lobster','tuna','cod','halibut')

vegetable <- c( 'onion', 'garlic','broccoli','tomatoes','leek','lettuce','pepper','potato')

spices <- c('salt','pepper', 'cinnamon')

pantry_items <- c('flour','sugar','olive oil','vanilla','brown sugar', 'baking powder','cocoa','chocolate','marshmallow')

nuts <- c('pecan','peanut','coconut')

dairy <- c('butter','eggs', 'milk', 'margarine','cream','mayonnaise','parmesan')

fruit <- c('lemon','apple','grapefruit')

#ing_df <- data.frame(MEAT=meat, SEAFOOD=seafood, VEGETABLE=vegetable, PANTRY=pantry_items)





























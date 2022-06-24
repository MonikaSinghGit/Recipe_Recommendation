# Recipe_Recommendation

## Background/Problem

Food waste is a major problem in the United States. It's estimated that up to 40% of food is wasted, or approximately 108B pounds of food or 130B meals
and the equivalent of $40B annually. 

We tend to accumulate ingredients over time when we plan meals and end up not making the meal or buy things on sale. We end up with a mixture of 
odds and ends that may not combine to make a recipe we would normally make. 

Traditionally when meal planning you would identify meals you want to make, write a list of ingredients to buy

## Approach/Overview

The goal of this project was to produce an autotomated categorization of recipes, a model capable of recommending recipes based on the ingredients 
available, a metric to easily compare between different approaches, and an application for users to search recipes based on ingredients.

We conducted some exploratory data analysis and applied some standard and project-specific cleaning techniques. 

We applied K means, LDA, Top2Vec, BERTopic, and CorEx algorithms to the data and developed a scoring metric to compare between these topic modeling 
techniques. 

Lastly, we produced a web application to allow users to select ingredients and browse potential recipes with the ability to narrow down by category.

## EDA

Exploratory data analysis for this project consisted of reviewing the most frequent words (e.g. unigrams, bigrams, trigrams) in the data set and the 
distribution of "document" (i.e. recipe) length to identify any outliers or data integrity issues. The most frequent words in the directions column 
highlighted stopwords and some words that although not stopwords weren't particularly useful in grouping recipes. Useful bigrams were identified such
as "sour cream," "lemon juice," and "cream cheese." These bigrams describe specific ingredients that have different meanings when examining the unigrams
they are composed of. Similarly trigrams such as "virgin olive oil" were identified.

## Cleaning

We attempted to clean the data using [this](https://medium.com/geekculture/data-preprocessing-and-eda-for-natural-language-processing-56e45c1df36d) as a 
guide.

## Natural Language Processing Methods

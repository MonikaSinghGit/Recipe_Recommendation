# Recipe_Recommendation

## Background/Problem

Food waste is a major problem in the United States. It's estimated that up to 40% of food is wasted, or approximately 108B pounds of food or 130B meals
and the equivalent of $40B annually. 

We tend to accumulate ingredients over time when we plan meals and end up not making the meal or buy things on sale. We end up with a mixture of 
odds and ends that may not combine to make a recipe we would normally make. 

Traditionally when meal planning you would identify meals you want to make, write a list of ingredients to buy. When trying to use up odds and ends in your pantry you need to reverse this process and be able to search for recipes based on the ingredients.

## Data

The data set used here is called [RecipeNLG](https://recipenlg.cs.put.poznan.pl/). It is a collection of recipes derived from various websites on the internet.  The data include a row ID, "title" of the recipe, "ingredients" list, "directions", a "link" to the source, a "source" description, and a Named Entity Recognition "NER" column that is essentially a clean ingredients list.

## Approach/Overview

The goal of this project was to 1) produce an autotomated categorization of recipes, 2) produce a model capable of recommending recipes based on the ingredients available, 3) produce a metric to easily compare between different approaches, and 4) develop an application for users to search recipes based on ingredients.

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

We attempted to clean the directions and ingredients column using [this](https://medium.com/geekculture/data-preprocessing-and-eda-for-natural-language-processing-56e45c1df36d) as a guide. Stop words and punctuation were removed using texthero. Parts of speech were tagged and verbs and adverbs were removed to try and isolate the key ingredients that separated the recipes into distinct topics. Remaining words were lemmatized.

As further words were identified as potentially interfering with successful topic separation those words were added to the stop word list. These included spices that spanned topics, such as salt which appears (in varying quantities) in sweet and savory recipes.

Although a good portion of time was spent cleaning the data, the NLP-specific models tended to perform better with the raw directions text as opposed to
the altered/cleaned version.

## Topic Modeling/Clustering Methods Applied

### K Means

K means nearest neighbor is a machine learning clustering technique. Although it is not specifically designed for NLP-specific data, we wanted to apply 
it and assess its performance compared to the NLP-specific methodologies.

### Latent Dirichlet Allocation (LDA)

Latent Dirichlet Allocation (LDA) is an older approach to topic modeling that employs a probabalistic approach to identifying related terms that may 
represent a theme.

### Top2Vec with Doc2Vec

Simple introductions to the method with examples: [Link1](https://top2vec.readthedocs.io/en/latest/Top2Vec.html#for-each-dense-area-calculate-the-centroid-of-document-vectors-in-original-dimension-this-is-the-topic-vector)
[Link2](https://radimrehurek.com/gensim/auto_examples/tutorials/run_doc2vec_lee.html#sphx-glr-auto-examples-tutorials-run-doc2vec-lee-py)

Official [Documentation](https://top2vec.readthedocs.io/_/downloads/en/stable/pdf/)

[Paper](https://arxiv.org/pdf/1405.4053v2.pdf) describing the method.

Top2Vec is a fully integrated approach to analyzing NLP data. It includes a step where the "documents" are embedded into vectors. The specific algorithm
used to embed the documents is interchangeable. The dimensionality is then reduced using UMAP and dense pockets of documents are located using HDBSCAN.
Once the dense areas are located the centroids are calculated and most relevant documents are returnable.

Here we used Doc2Vec to embed the documents. Doc2Vec is a technique that uses neural networks to derive semantic knowledge by training neurons to predict subsequent words in a sentence as well as encoding an overall context or theme of the entire document.

We applied Top2Vec using Doc2Vec to embed the documents to the "clean" version of the ingredients and directions columns, in addition to the unaltered 
ingredients and directions columns. The model appeared to perform better with the full text as compared to the "cleaned" versions. Reflecting on how the 
embedding is completed this makes sense.

### BERTopic

BERTopic uses the framework of Top2Vec, but uses it's own "sentence transformers" embedding technique which is a form of transfer learning. 

### Correlation Explanation (CorEx)
Examples and introduction: [Link1](https://github.com/gregversteeg/corex_topic/blob/master/corextopic/example/corex_topic_example.ipynb)
[Link2](https://github.com/gregversteeg/corex_topic)

[Paper](https://watermark.silverchair.com/tacl_a_00078.pdf?token=AQECAHi208BE49Ooan9kkhW_Ercy7Dm3ZL_9Cf3qfKAc485ysgAAAsswggLHBgkqhkiG9w0BBwagggK4MIICtAIBADCCAq0GCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQM_uSEJZDMRqtizHj1AgEQgIICfmcqAC-XF6ZY_aVO4X1b0f5D7EBlxGB7inxAMMPS-YwOGkZUlfvbEyzY5XwaLkD9ZXEu5xYa8x9n_ado2fCDy6TBOilYQW37xCzCjY2ZsTUUGspmyS220nTG_do9UJrurJMdAR3lUb7vp_FJW9jhh-DeecSjF6Nm0VNKjVKCxm9gIQKfvsWpxVycjGgpW5oaz3kMyq4mJfE78yFQAsqxpAHVi-oWBQZWyW8lgKxB8COCcR0ctQ75-7nAoTcxe5US3GL2Ngdujq4Wb3WiMq3piHkOrJvvJDgRojA3vBajxTXvxMzuvKDdnUk4RdtUVTzLjTJ5hJ1e5wuabPyMVxbtnUnxfKmi8nRvgNILYZugNDBBQE4hi8qP6GM1KVM1Ym9xnSj89Nd_zT5_FpuJj50LlCCT2fZF9Wca9wpVpECTvwT4-BceSa4Y7wXsU0JvyhV3SO-78eMTZK4gcXyx3vZhGauNdZdNFT0dImI8kFqCaNUOSOOgfNV-VXEkJ7y19kkv6sHek1aowusZnGW_NKw04JXU-aMcU1hcs6_wN6c-0byy3VoIFEW1mHc11EK0GkY1aGSizSH3FwA_oZ3NqC59qr4j3anvKDWr0JqmtH0Wc0ngLizsI6X5LO9_kMDcuWQWPm1HvFzywI2zVvNzlCGlBhGslFevKHS054vXpE0fvouiB5oLeX8J0xfkwrycZiB7rRqrtu7jDqvU1DuD3v6eqpIpxcLHTjKbi-at785HdmIHRgTZh1XwvxmT_amI0-jOBYnlwyUwVG6rsCVW1eUxyY35gq2VJRACIQLE4MdYRKytzWPtEe4lbIhjsY-S_R89ICBe4M-UrxNbb8rEZgUe)

Correlation Explanation (CorEx) is a relatively recent development in the NLP space. It functions by correlating words based on their co-appearance within documents. CorEx allows for semi-supervised training by allowing the user to provide "anchor" words to the model. These anchor words are weighted and allow the user to guide the model to topics that they deem important that the model may have otherwise missed. A few things of note: CorEx doesn't yet support ngrams. Keywords can only belong to a single topic (overridable by using anchor words). And the assignment of documents to topics is probabalistic and documents aren't restricted to a single topic. Documents can be assigned to all topics, no topics or anything in between.

## Results



## Conclusions



## Future Directions

****TO DO

Add links to each method for citation and links to useful articles discussing implementation
Add link to data

# LDA sample analysis

install.packages("quanteda")
library(quanteda)

# packages
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
install.packages("tm")
install.packages("topicmodels")
install.packages("stringr")

# libraries
library(topicmodels)
library(stringr)
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

txt_dir <- "/Users/nathanalexander/Dropbox/Projects/educ480-sp24/data"

# import the the .txt files
docs <- Corpus(DirSource(txt_dir))
corpus(docs)

# preprocess the documents
docs <- tm_map(docs, content_transformer(tolower)) # Convert to lowercase
docs <- tm_map(docs, removeNumbers) # Remove numbers
docs <- tm_map(docs, removePunctuation) # Remove punctuation
docs <- tm_map(docs, removeWords, stopwords("english")) # Remove stopwords
docs <- tm_map(docs, stripWhitespace) # Strip whitespace
docs <- tm_map(docs, removeWords, c("additional", "custom", "stopwords")) # Remove additional custom stopwords if required

# create a document-term matrix
dtm <- DocumentTermMatrix(docs)
dtm

# Convert the document-term matrix to a matrix of word frequencies
dtm <- as.matrix(dtm)

# Set the number of topics
num_topics <- 3

# Run LDA
lda <- LDA(dtm, k = num_topics)

# Get the top words for each topic
top_words <- terms(lda, 10)

# Print the top words for each topic
for (i in 1:num_topics) {
  cat("Topic", i, ": ", paste(top_words[, i], collapse = ", "), "\n")
}

# define document metadata (e.g., category)

topic1 <- c("diversity",
            "education",
            "multicultural",
            "cross-cultural",
            "immigration",
            "integration",
            "identity",
            "multilingualism",
            "cultural",
            "awareness",
            "literacy")

concatenated_topic1 <- paste(topic1, collapse = ", ") # create a single string of text

topic2 <- c("responsive",
            "pedagogy",
            "equity",
            "inclusion",
            "curriculum",
            "culture",
            "sustaining",
            "relevant",
            "intersectionality",
            "student",
            "consciousness",
            "indigenous")

concatenated_topic2 <- paste(topic2, collapse = ", ") # create a single stirng of text

# Create a list of topics
topic3 <- c("Individualized Education Program (IEP)",
            "Inclusive Education",
            "Differentiated Instruction",
            "Assistive Technology",
            "Learning Disabilities",
            "Autism Spectrum Disorder (ASD)",
            "Behavioral Interventions",
            "Transition Planning",
            "Speech and Language Therapy",
            "Inclusion vs. Segregation")

# Concatenate the topics into a single string
concatenated_topic3 <- paste(topic3, collapse = ", ")

# Print the concatenated topics
cat(concatenated_topics)
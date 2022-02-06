# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Read text
text <- readLines(file.choose())
docs <- Corpus(VectorSource(text))
inspect(docs)

# Remove special character
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Remove numbers
docs <- tm_map(docs, removeNumbers)

# Remove punctuation
docs <- tm_map(docs, removePunctuation)

# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

# Remove specific stop word, specify your stop words as a character vector
docs <- tm_map(docs, removeWords, c("ulnone", "pardpardeftabrislslmultqjpartightenfactor", "pardpardeftabfirislslmultqjpartightenfactor", "pardpardeftabfirislslmultqjpartightenfactor"))

# Calculation
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 13)

# Plotting Word Cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

# Plotting Barplot 
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")

# Export as .xlxs file
install.packages("writexl")
library(writexl)
write_xlsx(d,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\Word Frequency.xlsx")



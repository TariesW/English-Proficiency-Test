# Install
install.packages("ngram")

# Load
library("corpus")
library("tm")
library("ngram")

# Read Text
text <- readLines(file.choose())
docs <- Corpus(VectorSource(text))

# Remove numbers
docs <- tm_map(docs, removeNumbers)

# Remove punctuation
docs <- tm_map(docs, removePunctuation)

# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

# Remove specific stop word, specify your stop words as a character vector
docs <- tm_map(docs, removeWords, c("ulnone"))

# Define stop words
stop_words <- c('cf','a','b','c','d','a.','b.','c.','d.','a:','b:','c:','d:','cl', 'ul','fs','us', 'f', 'cell', 'nd',
'clbrdrbbrdrsbrdrwbrdrcf', ' clbrdrrbrdrsbrdrwbrdrcf', 'clpadr', 'clshdrawnil', 'aor',
'trbrdrbbrdrsbrdrwbrdrcf', 'clwwidthclftswidth', 'clcbpat', 'trgaphtrleft', 'clpadl', 'gaphcellx',
'taflag', ' clbrdrtbrdrsbrdrwbrdrcf', 'trbrdrrbrdrsbrdrwbrdrcf', 'clbrdrtbrdrsbrdrwbrdrcf', 'clvertalc',
'clbrdrlbrdrsbrdrwbrdrcf', 'itaptrowd', 'clvertalt', 'trbrdrtbrdrsbrdrwbrdrcf ', 'trbrdrlbrdrsbrdrwbrdrcf',
'taflags', 'trwwidthtrftswidth', 'kerningexpndexpndtw', ' ndnosupersub', 'nosupersub', 'kerningexpndexpndtw',
'fonttblffromanfcharset', 'timesnewromanpsmtffnilfcharset' , 'ofkerningexpndexpndtw', 'ndnosupersub', 'thekerningexpndexpndtw', 
'timesnewromanpsmtffnilfcharset',  'simsunffswissfcharset', 'fieldfldinsthyperlink', 'trbrdrlbrdrnil', 'trbrdrrbrdrnil',
'thnosupersub', 'lastrowrow', 'thnosupersub', 'backkerningexpndexpndtw'
)

# Two-Words Phrase Frequency
term_stats(docs, ngrams = 2)
phrase_frequency2 <-  term_stats(docs, ngrams = 2, text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, ))
phrase_frequency2
View(phrase_frequency2)

# Three-Words Phrase Frequency
term_stats(docs, ngrams = 3)
phrase_frequency3 <-  term_stats(docs, ngrams = 3, text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, ))
phrase_frequency3
View(phrase_frequency3)

# Six-Words Phrase Frequency
term_stats(docs, ngrams = 6)
phrase_frequency6 <-  term_stats(docs, ngrams = 6 , text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, remove_ignorable =  TRUE))
phrase_frequency6
View(phrase_frequency6)

# 4 Words Phrase Frequency
term_stats(docs, ngrams = 4)
phrase_frequency_4 <-  term_stats(docs, ngrams = 4 , text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, remove_ignorable =  TRUE))
phrase_frequency_4
View(phrase_frequency_4)

# 5 Words Phrase Frequency
term_stats(docs, ngrams = 5)
phrase_frequency_5 <-  term_stats(docs, ngrams = 5 , text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, remove_ignorable =  TRUE))
phrase_frequency_5
View(phrase_frequency_5)

# 4-10 Words Phrase Frequency
term_stats(docs, ngrams = 4:15)
phrase_frequency_4_15 <-  term_stats(docs, ngrams = 4:15 , min_count = 2, text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, remove_ignorable =  TRUE))
phrase_frequency_4_15_Full <-  term_stats(docs, ngrams = 4:15 , text_filter(drop = stop_words, drop_punct = TRUE, drop_number = TRUE, drop_symbol = TRUE, remove_ignorable =  TRUE))
phrase_frequency_4_15
phrase_frequency_4_15_Full
View(phrase_frequency_4_15)
View(phrase_frequency_4_15_Full)

# Export as .xlxs file
install.packages("writexl")
library(writexl)
write_xlsx(phrase_frequency2,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\Two-Words Phrase Frequency.xlsx")
write_xlsx(phrase_frequency3,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\Three-Words Phrase Frequency.xlsx")
write_xlsx(phrase_frequency6,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\Six-Words Phrase Frequency.xlsx")
write_xlsx(phrase_frequency_4_15,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\from 4 to 15 Words Phrase Frequency.xlsx")
write_xlsx(phrase_frequency_4_15_Full,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\Full 4 to 15 Words Phrase Frequency.xlsx")
write_xlsx(phrase_frequency_4,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\4 Words Phrase Frequency.xlsx")



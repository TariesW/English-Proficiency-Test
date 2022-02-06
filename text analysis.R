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

# Calculations
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

textsplit <- text_split(docs)
str(textsplit)

textsplit[] <- lapply(textsplit, as.character)
str(textsplit)

write_xlsx(textsplit,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\textsplit.xlsx")



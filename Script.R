
db<- read.csv('train.csv')
View(db)

db$text<-gsub("#[A-Za-z0-9]+|@[A-Za-z0-9]+|\\w+(?:\\.\\w+)*/\\S+", "", db$text)
db$text<-toupper(db$text)

db$text<-gsub("HTTP://","",db$text)
db$text<-gsub("HTTPS://","",db$text)
db$text<-gsub("[^\x01-\x7F]", "",db$text)
db$text<-gsub("B&amp;N", "",db$text)
db$text<-gsub("#", "",db$text)
db$text<-gsub('(s+)(A|AN|AND|THE|I)(s+)', '', db$text)
db$text<-gsub(':', '', db$text)
db$text<-gsub("'", '', db$text)
db$text<-gsub("--|", '', db$text)
db$text<-gsub('[[:punct:]]', '', db$text)


View(db)


write.csv(db,"train_limpios.csv", row.names = FALSE)


data<-read.csv('train_limpios.csv')
View(data)

# Clean test

db<- read.csv('test.csv')
View(db)

db$text<-gsub("#[A-Za-z0-9]+|@[A-Za-z0-9]+|\\w+(?:\\.\\w+)*/\\S+", "", db$text)
db$text<-toupper(db$text)

db$text<-gsub("HTTP://","",db$text)
db$text<-gsub("HTTPS://","",db$text)
db$text<-gsub("[^\x01-\x7F]", "",db$text)
db$text<-gsub("B&amp;N", "",db$text)
db$text<-gsub("#", "",db$text)
db$text<-gsub('(s+)(A|AN|AND|THE|I)(s+)', '', db$text)
db$text<-gsub(':', '', db$text)
db$text<-gsub("'", '', db$text)
db$text<-gsub("--|", '', db$text)
db$text<-gsub('[[:punct:]]', '', db$text)


View(db)


write.csv(db,"test_limpios.csv", row.names = FALSE)


data<-read.csv('test_limpios.csv')
View(data)


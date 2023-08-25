library(wordcloud2)

data<-read.csv('train_limpios.csv')
#View(data)

data[data == ""]<-NA

freq<-table(data$keyword, useNA = 'no')
#View(freq)

wordcloud2(data = freq, size = 0.15, shape = "cloud",
           color="random-dark", ellipticity = 0.5)

hist(x = freq, main = "Histograma De Palabras Más Repetidas", 
     xlab = "Frecuencia", ylab = "",
     col = "ivory")



no_disaster<-subset(x = data, subset = target == 0, select = c("keyword"))
#View(no_disaster)
freq_no_disaster<-table(no_disaster$keyword)
#View(freq_no_disaster)
tabla_ordenada1<-freq_no_disaster[order(freq_no_disaster, decreasing = TRUE, na.last = TRUE)]
#View(tabla_ordenada1)
h1<-head(tabla_ordenada1)
#View(h1)

plot(x = h1, main = "No Disaster Tweets",
     xlab = "Palabra", ylab = "Frecuencia", 
     col = "seagreen")

wordcloud2(data = freq_no_disaster, size = 0.2, shape = "cloud",
           color="random-dark", ellipticity = 0.5)



disaster<-subset(x = data, subset = target == 1, select = c("keyword"))
#View(disaster)
freq_disaster<-table(disaster$keyword)
#View(freq_disaster)
tabla_ordenada2<-freq_disaster[order(freq_disaster, decreasing = TRUE, na.last = TRUE)]
#View(tabla_ordenada2)
h2<-head(tabla_ordenada2)
#View(h2)

plot(x = h2, main = "No Disaster Tweets",
     xlab = "Palabra", ylab = "Frecuencia", 
     col = "seagreen")

wordcloud2(data = freq_disaster, size = 0.2, shape = "cloud",
           color="random-dark", ellipticity = 0.5)

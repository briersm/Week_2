# Title     : Oefeningen Introductie R
# Objective : Oefeningen Introductie R Week 2
# Created by: Hansen Maxim
# Created on: 16/02/2020

# oefening 1.1

id <- c(1,2,3,4,5) #array id aangemaakt
leeftijd <- c(15, 18, 11, 17, 20) #array leeftijd aangemaakt
gewicht <- c(54, 68, 41, 59, 65) #array gewicht aangemaakt
temp <- c(36.5, 37.1, 36.4, 37.2, 36.9) #array temp aangemaakt

# oefening 1.2

tabel <- data.frame(id, leeftijd, gewicht, temp) #dataFrame aangemaakt
write.table(tabel, "tabel.csv", row.names=F, sep=";",dec = ";") #tabel aangemaakt
tabelRead <- read.csv("tabel.CSV", header=TRUE, sep=";", dec=";") #tabel uitgelezen

#oefening 1.3

names(tabelRead) #toont namen van kolommen

#oefening 1.4

tabelRead[,2] #toont de tweede kolom van de uitgelezen tabel

#oefening 1.5

tabelRead[3,] #toont de derde rij van de uitgelezen tabel

#oefening 1.6
rijen <- c(2, 4)
tabelRead[rijen,] #toont de derde en vijfde rij van de uitgelezen tabel

#oefening 1.7
rijen <- c(2, 3, 4)
tabelRead[rijen,] #toont de derde, vierde en vijfde rij van de uitgelezen tabel


#oefening 1.8
kolomLeeftijd <- tabelRead[,1] #geeft alle leeftijden terug
min(kolomLeeftijd) #geeft de minimumLeeftijd
max(kolomLeeftijd) #geeft de maximumLeeftijd

#oefening 1.9
kolomGewicht <- tabelRead[,2] #geeft alle gewichten terug
sum(kolomGewicht)/length(kolomGewicht) #maakt de som en deelt het door het aantal (gemeente)

#oefening 1.10
kolomGewicht <- tabelRead[,2] #geeft alle gewichten terug
kolomGewicht/1000 #deelt alle waarden door 1000

#oefening 1.11
kolomGewicht <- tabelRead[,2] #geeft alle gewichten terug van de kolom gewichten
nieuwGewicht <- kolomGewicht/1000 #deelt alle waarden door 1000

#oefening 1.12
write.table(nieuwGewicht,"nieuwGewicht.csv", row.names=F, sep = ";",dec = ";")

#oefening 1.15
tabel[1] <- NULL

#oefening 1.16
lengte <- c(160,175,162,169,179)
tabel[4] <- data.frame(lengte)

#oefening 1.17 1.18
BMI <- tabel[2]/(tabel[4] + (tabel[4]))
tabel[5] <- data.frame(BMI)

#oefening 1.19
tabel$gewicht[tabel$gewicht<=60]

#oefening 1.20
tabel$leeftijd[tabel$gewicht>=18] = 19

#oefening 1.21
tabel$temp[tabel$leeftijd>18]

#-----------------------------------------------------------------------------------------------

#oefening 2.1
sportdata <- read.csv("sportData.csv", header = TRUE, sep = ";", dec = ";")

#oefening 2.2
length(sportdata[,1])

#oefening 2.3
levels(sportdata$sport)

#oefening 2.4
anyNA(sportdata$leeftijd)
anyNA(sportdata$geslacht)
anyNA(sportdata$sport)
anyNA(sportdata$keer.per.week)
anyNA(sportdata$uren.per.week)

#oefening 2.5
(1:75)[is.na(sportdata$sport) | is.na(sportdata$uren.per.week)]

#oefening 2.6
rijen <- (1:75)[is.na(sportdata$sport) | is.na(sportdata$uren.per.week)]
sport2 <- sportdata[-rijen,]

#oefening 2.7
sportdata$uren.per.week[is.na(sportdata$uren.per.week)] = 0
sportdata$sport[is.na(sportdata$sport)] = "anders"

#oefening 2.8
max(sport$leeftijd)

#oefening 2.9
sum(sport$keer.per.week[sport$keer.per.week>1])

#-----------------------------------------------------------------------------------------------

#oefening 3.1
verwijderNA <- function (x){
  x[!is.na(x)]
}

#oefening 3.2
x <- c(1, 2, 3, NA, 4, 5, NA, 6)
verwijderNA(x)

#oefening 3.3
verwijderNA = function(x, waarde=NA) {
  if (is.na(waarde)) return(x[!is.na(x)])
  x[x != waarde]
}

#oefening 3.4
x <- c(1, 2, 3, NA, 4, 5, NA, 6)
verwijderNA(x, 3)
verwijderNA(x)

#oefening 3.5
vermenigvuldig = function(getal) {
  seq(10, 100, 5) * getal
}

#oefening 3.6
vermenigvuldig(2)

#vraag 4
install.packages("ggplot2")
require("ggplot2")
data <- data.frame(value=rnorm(10000))
ggplot(data, aes(x=value)) + geom_histogram(binwidth = 0.05)

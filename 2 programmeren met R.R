# R als rekenmachine
6 * 7
2^3
(2+4) * (9-2)
60 * sin(pi6/4)

# variabelen
a <- 3 * 14
a = 3 * 14
a * 7 + 3
a = "bla"
a = 42.5
a = TRUE
a = F
mijn.variabele = round(125 / 3) # geen object

# speciale waarden
a = Inf #oneindig
b = -Inf #-oneindig
a + b
a = NA #not availble
a * 3

# vectoren
x = c(3, 4, 5, 6, 7, 8, 9, 10) #array
y = c(x, 4, 1, 2)
x = 3:42
x[1]
x[3:6]
x[c(1,7,3)]
x[5]=42

# gewone variabelen zijn ook vectoren
a = 5
a[1]

x = 3:10
x * 3 + 5
y = 13:20
x * y
y = 1:2
x + y
y = 1:6
x + y

x = 1:13
x>4
x[x>4]
x[x>4] = 0
x

x = 3:13
even = ((x %% 2) == 0)
even
x[even]

# factors
# nominaal vs ordinaal
x = c("appel", "banaan", "banaan", "appel", "aardbei", "appel")
x = factor(x)
as.numeric(x)

x = c("niet", "niet", "meest", "beetje", "niet", "meest", "meest")
factor(x)
l = c("niet", "beetje", "meer", "meest")
x = factor(x, levels=l)
as.numeric(x)
levels(x)
as.vector(x)

# inlezen en wegschrijven van vector
x = 1:10
setwd("/home/kris/t")
write(x, "testje.txt")
write(x, "testje.txt", ncolumns=2, sep=",")
x = scan("testje.txt", sep=",")
# met een factor:
x = factor(c("appel", "banaan", "banaan", "appel", "aardbei", "appel"))
write(x, "testje.txt")
write(as.vector(x), "testje.txt")

# data frames
x = 1:5
y = c("foo", "bar", "bla", "boe", "foo")
f  = data.frame(id=x, naam=y)
f
View(f)
names(f)
f$id
f$naam
f[3,2]
f[3,]
f[,2]
f$id=NULL
f
f$key=c(1:3, 6, 4)
f
f=f[, c(2,1)]
f

# CSV bestanden
# dataframe wegschrijven en inlezen
f = data.frame(a=c("bla", "boe", "bla"), b=c(1.1, 2.2, 3.3))
setwd("/home/kris/t")
write.table(f, "testje_nl.csv", row.names=F, sep=";", dec=",")
write.table(f, "testje_en.csv", row.names=F, sep=",", dec=".")
# factors:
x = read.csv("testje_nl.csv", header=TRUE, sep=";", dec=",")
x$a
x = read.csv("testje_nl.csv", header=TRUE, sep=";", dec=",", stringsAsFactors=F)
x$a

# andere datatypes: zie cursus

# functies maken
mijn.functie = function(n) {
  return(sqrt(n)/2)
}
mijn.functie(9)
mijn.functie(c(1,5,6,3,1,10))

# parameters:
mijn.functie = function(a, b, c) {
  a + b - c # zonder return
}
mijn.functie(10, 5, 1)
mijn.functie(a=10, b=5, c=1)
mijn.functie(b=5, a=10, c=1)
verhoog = function(getal, aantal=1) {
  getal + aantal
}
verhoog(41)
verhoog(40, 2)
verhoog = function(getal, aantal=1) {
  if (missing(aantal)) "bla" else getal+aantal
}
verhoog(41)
verhoog(40, 2)

# opmerking: altijd call-by-value!
f = data.frame(a=c("bla", "boe", NA), b=c(1.1, NA, 3.3))
f
na.omit(f)
f
f = na.omit(f)
f

# controle structuren
zoek = function(element, lijst) {
  if (length(lijst)==0) {
    FALSE
  } else {
    for(i in lijst) {
      if (i==element) return(TRUE) # return noodzakelijk!
    }
    FALSE
  }
}
zoek(4, c(3,4,6,8))
zoek(4, c(3,6,8))
# functies als parameter
pasFunctieToe = function(lijst, functie) {
  resultaat = numeric()
  for(element in lijst) {
    resultaat = c(resultaat, functie(element))
  }
  resultaat
}
verhoog = function(n) { n + 1 }
lijst = c(1, 2, 3)
pasFunctieToe(lijst, verhoog)
sapply(lijst, verhoog)

# afronden
round(pi, 3)
round(pi)
round(.5) # steeds afronden naar even getal
round(1.5)
#probleem met afronden:
round(0.00011846873, 3)
round(5128.1559159, 3)
signif(pi,3)
signif(0.00011846873, 3)
signif(5128.1559159, 3)
ceiling(5.001)
floor(5.999)

# rekenen
sqrt(2)
sqrt(9)
sin(pi/4)
abs(-5)
a = 5
is.na(a)
a = NA
is.na(a)

# vectoren
a = 100:110
length(a)
seq(10, 99, 5)
rep(3, 5)
a = seq(10, 99, 5)
sum(a)
min(a)
max(a)
round(sqrt(a))

# andere functies
# standard output
hello = function(name) { print(paste("Hello,", name, "!"));print("What's up?"); }
hello("world")

# scripts en packages
source("bestand.R")
require("rpart")
install.packages("rpart")


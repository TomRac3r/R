library(data.table)
library(mclust)
library(ggplot2)
library(arules)
set.seed(12739)
#import des données puis visualisation
dt1 = read.csv('C:/Users/thomas/Downloads/LangageR/ScriptR/bank-data.csv')
df = fread('C:/Users/thomas/Downloads/LangageR/ScriptR/beer_reviews.csv')

dt1
df
#__________________PARTIE 1_______________________

#__________________Question 1 :___________________
#préparation des données en 3 classes d'intervalles, pour "age" et affichage
dt1$age <- cut(dt1$age, breaks = c(0, 35, 52, 67), right = TRUE, include.lowest = TRUE)


#préparation des données en 3 classes d'intervalles, pour "income" et affichage
dt1$income <- cut(dt1$income, breaks = c(0, 24387, 43759, 63130), right = TRUE, include.lowest = TRUE, dig.lab = 5)

head(dt)
#__________________Question 2 :___________________
#aprinc <- apriori(dt1$income, parameter = list(support=0.1, lift >= 1.5))
rules = apriori(dt1[, -c( 1, 2, 5, 7)], parameter = list(support = 0.1))
inspect(head(sort(rules, by = 'lift'), 10))


#_________________________________________________
#\_________________PARTIE 2______________________/
# Prendre 10% de la base comme échantillon aléatoire

size = dim(df)[1]
nb_echa = 0.1*size
random_echa <- sample(size, nb_echa)

beer_overview = df[random_echa, c(11, 5, 6, 9, 10)]

# Résumé numérique détaillé des évaluations sur les quatre attributs utiles
summary(beer_overview[, -1])

# 1. Préparation des données
# Réalisation de l'ACP
pca <- prcomp(beer_overview[,-1], center = TRUE, scale = TRUE)
summary(pca)

-cor(pca$x[,1], df[random_echa, c(4)])

#2.Recommandation
r <- df[, .(( review_overall), (beer_style)), by = review_profilename]
r

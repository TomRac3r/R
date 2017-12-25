library(data.table)
library(mclust)
library(ggplot2)

##________________QUESTION 1______________________
##chargement des donnees et échantillonage avec 5% du set
##résumé des évaluations sur 4 attributs

dt = fread('C:/Users/thomas/Downloads/LangageR/ScriptR/beer_reviews.csv') 

r = sample(x = dt, size = length(x*0.05), replace = FALSE)

r = dt[, .(mean(review_aroma), mean(review_appearance), mean(review_palate),mean(review_taste)), by = beer_name]
names(r) = c('aroma', 'appareance', 'palate', 'taste')


##____________QUESTION 2_________________________
##10 bières ayant la meilleures évaluations

som_biere = apply(r[,-1], 1, sum)
##apply(r[,-1] on retire la colonne beer_name pour ne pas add des char

r = r[order(som_biere, decreasing = T),]
##on fait un tableau ordonnée par décroissance

r[1:10]
##r[1:10] on affiche uniquement les 10 premiers résultats




##_____________QUESTION 3______________________

k2 = kmeans(r, centers = 2, iter.max = 10, nstart = 1)

k3 = kmeans(r, centers = 3, iter.max = 10, nstart = 1)

k4 = kmeans(r, centers = 4, iter.max = 10, nstart = 1)
##Kmeans avec respectivement 2, 3 et 4 classes


mc2 <- Mclust(r, G = 2)

mc3 <- Mclust(r, G = 3)

mc4 <- Mclust(r, G = 4)
##mclust avec respectivement 2, 3, 4 classes

t2 = table(k2, mc2)
t3 = table(k3, mc3)
t4 = table(k4, mc4)


##___________Question 4______________________

acp <- prcomp(r[,-1], center = TRUE, scale = TRUE)
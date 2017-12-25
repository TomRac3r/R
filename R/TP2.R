library(data.table)
library(arules)
set.seed(12739)
#import des données puis visualisation
dt1 = read.csv('C:/Users/thomas/Downloads/LangageR/ScriptR/bank-data.csv')
dt2 = fread('C:/Users/thomas/Downloads/LangageR/ScriptR/beer_reviews.csv')

dt1
dt2
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



#__________________PARTIE 2_______________________
r = sample(x = dt2, size = length(x*0.1), replace = FALSE)


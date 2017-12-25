library(data.table)
library(ggplot2)


dt = fread('C:/Users/thomas/Downloads/Langage R/Script R/Data/beer_reviews.csv')

set.seed(128)

size=nrow(dt)
nb_echa=size*0.05

beer_alea=sample(1:size, nb_echa, replace = FALSE)
ds = dt[beer_alea]
ds=ds[,c(5,6,9,10,11), with=FALSE]
r = dt[, .(mean(review_aroma), mean(review_appearance), mean(review_palate),mean(review_taste)), by = beer_style]
names(r) = c('aroma', 'appearance','palate','taste', 'beer_name')





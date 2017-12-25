data(MovieLense, package = "recommenderlab")
d = getData.frame(MovieLense)

library(data.table)
dt = data.table(d)
setorder(dt, item)


dt[, length(rating), by = 'item']

##___________________________

dt[item = 'Star Wars (1977)' & ratings >= 4]
p = predict(res, 1, data = MovieLense, n = 1)
as(p, "list")

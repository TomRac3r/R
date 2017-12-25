> p = ggplot(data = d, aes(x = Year, y = Value)) + geom_line(aes(group = Month, color = grey(.7)))
> p + facet_wrap(~ Month, nrow = 3)
> p + facet_wrap(. ~ Month, nrow = 3)
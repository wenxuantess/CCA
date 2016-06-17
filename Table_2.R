dat <- read.csv("~/Desktop/CCA/R/Index Value.csv", sep=";")

library("ggplot2")

ggplot(data=dat, aes(x=X, y=Farm.Economy.Barometer, group=1)) + geom_line(colour="black", size=1.5) + geom_point(colour="black", size=4, shape=21)

install.packages("png")
library(png)
library(grid)

# Graph 1 Ag Economy Barometer
img <- readPNG("Desktop/_Final-watermark.png")
g <- rasterGrob(img, interpolate=TRUE)
g$width <- unit(1, "npc") 
g$height <- unit(1, "npc")
ggplot(data=Index.Value, aes(x=Time, y=Farm.Economy.Barometer, group=1, label=Farm.Economy.Barometer)) +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+ 
  ggtitle("Thinking about large farm investments") + 
  theme(plot.title = element_text(lineheight=2, face="bold"),
        panel.ontop=TRUE, panel.background = element_rect(colour = NA,fill="transparent"),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(color = "lightgrey", size = 0.5),
        panel.grid.minor.y = element_line(color = "lightgrey", size = 0.5)) + 
  geom_line(colour="black", size=1.5) + 
  geom_point(colour="black", size=2, shape=1, fill="black", stroke=1) + 
  geom_text(vjust = 0.5, hjust = -0.5) + 
  coord_fixed(ratio = 0.1676)

?grid
# Graph 2 Current and Future
img <- readPNG("Desktop/_Final-watermark.png")
g <- rasterGrob(img, interpolate=TRUE) 
ggplot(data = Index.Value, aes(x = Time, group=2)) + 
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_line(aes( y = Index.of.Future.Expectations), color = "red",size=1.5)+
  geom_line(aes( y = Index.of.Current.Conditions), color = "blue", size=1.5)+
  ggtitle("Current and Future") + 
  theme(plot.title = element_text(lineheight=2, face="bold"))  + 
  coord_fixed(ratio = 0.1051)


# Graph 3
dat <- Commodity.Prices(crop=c('Corn','Soybean','Wheat','Cotton'), outcome=c(14,16,12,12))
ggplot(Commodity.Prices, aes(X, c)) +
  geom_bar(stat = "identity")

?geom_bar
# Graph 4 



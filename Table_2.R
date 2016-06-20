dat <- read.csv("~/Desktop/CCA/R/Index Value.csv", sep=";")

library("ggplot2")

ggplot(data=dat, aes(x=X, y=Farm.Economy.Barometer, group=1)) + geom_line(colour="black", size=1.5) + geom_point(colour="black", size=4, shape=21)

install.packages("png")
library(png)
library(grid)

# Graph 1 Ag Economy Barometer
# Call the watermark
img <- readPNG("Desktop/_Final-watermark.png")
g <- rasterGrob(img, interpolate=TRUE)
g$width <- unit(1, "npc") 
g$height <- unit(1, "npc")
# Make sure the levels are in the right order
Index.Value$Time <- factor(Index.Value$Time, levels = as.character(Index.Value$Time))
# Line chart
ggplot(data=Index.Value, aes(x=Time, y=Farm.Economy.Barometer, group=1, label=Farm.Economy.Barometer)) +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+ 
  # Add the title
  ggtitle("Thinking about large farm investments") + 
  # Add the grid
  theme(plot.title = element_text(lineheight=2, face="bold"),
    panel.ontop=TRUE, panel.background = element_rect(colour = NA, fill="transparent"),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "lightgrey", size = 0.5),
    panel.grid.minor.y = element_line(color = "lightgrey", size = 0.5)) +
  # Format the line
  geom_line(colour="black", size=1.5, stat = "identity",position = "identity") +
  # Format the points
  geom_point(colour="black", size=0.5, shape=1, stroke=2) +
  geom_text(vjust = 0.5, hjust = -0.5) +
  # Adjust the chart size and proportion
  coord_fixed(ratio = 0.1676) + 
  annotation_custom(grob = textGrob("Producer Survey"),xmin = 2, xmax = 4, ymin = -Inf, ymax = 0)
  
# Graph 2 Current and Future
# Call the watermark
img <- readPNG("Desktop/_Final-watermark.png")
g <- rasterGrob(img, interpolate=TRUE)
g$width <- unit(1, "npc") 
g$height <- unit(1, "npc")
# Make sure the levels are in the right order
Index.Value$Time <- factor(Index.Value$Time, levels = as.character(Index.Value$Time))
# Line chart
ggplot(data=Index.Value, aes(x=Time, group=2)) +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+ 
  # Add the title
  ggtitle("Thinking about large farm investments") + 
  # Add the grid
  theme(plot.title = element_text(lineheight=2, face="bold"),
  panel.ontop=TRUE, panel.background = element_rect(colour = NA,fill="transparent"),
  panel.grid.major.x = element_blank(),
  panel.grid.major.y = element_line(color = "lightgrey", size = 0.5),
  panel.grid.minor.y = element_line(color = "lightgrey", size = 0.5)) + 
  # Format the lines
  geom_line(aes(y = Index.of.Current.Conditions), colour = "black") +
  geom_line(aes(y = Index.of.Future.Expectations), colour = "blue") +
  # Format the points
  geom_point(aes(y = Index.of.Current.Conditions),colour="black", size=0.5, shape=1, stroke=2) + 
  geom_point(aes(y = Index.of.Future.Expectations),colour="blue", size=0.5, shape=1, stroke=2) +
  geom_text(aes(y = Index.of.Current.Conditions, label=Index.of.Current.Conditions), vjust = 0.5, hjust = -0.5) + 
  geom_text(aes(y = Index.of.Future.Expectations, label=Index.of.Future.Expectations), vjust = 0.5, hjust = -0.5) + 
  #  Adjust the chart size and proportion
  coord_fixed(ratio = 0.1) +
  annotation_custom(grob = textGrob("Producer Survey"),xmin = 2, xmax = 2, ymin = -4.5, ymax = -4.55)


# Graph 3
dat <- Commodity.Prices(crop=c('Corn','Soybean','Wheat','Cotton'), outcome=c(14,16,12,12))
ggplot(Commodity.Prices, aes(X, c)) +
  geom_bar(stat = "identity")

?geom_bar
# Graph 4 



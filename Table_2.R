dat <- read.csv("~/Desktop/CCA/R/Index Value.csv", sep=";")

library("ggplot2")
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
  ggtitle("Ag Economy Barometer") + 
  # Add the grid
  theme(plot.title = element_text(lineheight=4, face="bold",size=20),
    panel.ontop=TRUE, panel.background = element_rect(colour = NA, fill="transparent"),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "lightgrey", size = 0.5),
    panel.grid.minor.y = element_line(color = "lightgrey", size = 0.5)) +
  # Format the line
  geom_line(colour="wheat4", size=1.5, stat = "identity",position = "identity") +
  # Format the points
  geom_point(colour="black", size=0.5, shape=1, stroke=2) +
  geom_text(vjust = 0.5, hjust = -0.5) +
  #Label the axis
  labs(x="Time", y="Farm Economy Barometer") +
  # Adjust the chart size and proportion
  coord_fixed(ratio = 0.1676) + 
  annotate("text",x = 7, y = 112, label="Producer Survey", size=6) 
  




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
  ggtitle("Current and Future") + 
  # Add the grid
  theme(plot.title = element_text(lineheight=4, face="bold",size=20),
  panel.ontop=TRUE, panel.background = element_rect(colour = NA,fill="transparent"),
  panel.grid.major.x = element_blank(),
  panel.grid.major.y = element_line(color = "lightgrey", size = 0.5),
  panel.grid.minor.y = element_line(color = "lightgrey", size = 0.5)) + 
  # Format the lines
  geom_line(aes(y = Index.of.Current.Conditions), colour = "peru", size=1.5) +
  geom_line(aes(y = Index.of.Future.Expectations), colour = "mediumturquoise", size=1.5) +
  # Format the points
  geom_point(aes(y = Index.of.Current.Conditions),colour="black", size=0.5, shape=1, stroke=2) + 
  geom_point(aes(y = Index.of.Future.Expectations),colour="black", size=0.5, shape=1, stroke=2) +
  geom_text(aes(y = Index.of.Current.Conditions, label=Index.of.Current.Conditions), vjust = 0.5, hjust = -0.5) + 
  geom_text(aes(y = Index.of.Future.Expectations, label=Index.of.Future.Expectations), vjust = 0.5, hjust = -0.5) + 
  #Label the axis
  labs(x="Time", y= "Index Values") +
  #  Adjust the chart size and proportion
  coord_fixed(ratio = 0.1) +
  annotate("text",x = 7, y = 117, label="Producer Survey", size=6)


# Graph 3
dat <- Commodity.Prices(crop=c('Corn','Soybean','Wheat','Cotton'), outcome=c(14,16,12,12))
ggplot(Commodity.Prices, aes(X, c)) +
  geom_bar(stat = "identity")

?geom_bar
# Graph 4 



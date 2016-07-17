# Install all the packages
install.packages(c("data.table","curl","grid","png","ggplot2"))
library(c(data.table, curl, grid, png, ggplot2))
# Load data from source website
freddate2 <- fread('https://fred.stlouisfed.org/graph/fredgraph.csv?chart_type=line&recession_bars=on&log_scales=&bgcolor=%23e1e9f0&graph_bgcolor=%23ffffff&fo=Open+Sans&ts=12&tts=12&txtcolor=%23444444&show_legend=yes&show_axis_titles=yes&drp=0&cosd=1995-01-04&coed=2016-06-22&height=450&stacking=&range=&mode=fred&id=TWEXB&transformation=lin&nd=&ost=-99999&oet=99999&lsv=&lev=&mma=0&fml=a&fgst=lin&fgsnd=2009-06-01&fq=Weekly%2C+Ending+Wednesday&fam=avg&vintage_date=&revision_date=&line_color=%234572a7&line_style=solid&lw=2&scale=left&mark_type=none&mw=2&width=1168')
head(freddate2)
# Select section of the data for graphing
freddate2 <- freddate2[1115:1121, ] 
# Graph
# Call the watermark
img <- readPNG("~/Desktop/_Final-watermark.png")
g <- rasterGrob(img, interpolate=TRUE)
g$width <- unit(1, "npc") 
g$height <- unit(1, "npc")
# Make sure the levels are in the right order
freddate2$DATE <- factor(freddate2$DATE, levels = as.character(mfreddate2$DATE))
# Line chart
ggplot(data=freddate2, aes(x=DATE, y=TWEXB, group=1, label=TWEXB)) +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+ 
  # Add the title
  ggtitle("Trade Weighted U.S. Dollar Index: Broad") + 
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
  geom_text(vjust = 1.2, hjust = -0.2) +
  #Label the axis
  labs(x="Date", y="TWEXB") +
  # Adjust the chart size and proportion
  coord_fixed(ratio = 2) 

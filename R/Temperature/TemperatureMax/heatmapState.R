source("getData.R")

## Plot heatmap (based on https://rud.is/projects/facetedheatmaps.html)
gg <- ggplot(temperature, aes(x = ANYO, y = MES, fill = TEMPERATURA))

# geom_tile() will make tiles at each x&y location we???ve already specified.
# We???re also telling it to use a thin (0.1 units) white border to separate the tiles.
gg <- gg + geom_tile(colour = "white", size = 0.1)

# An awesome color scale
gg <- gg + scale_fill_viridis(name = "Temperatura [C]", option = "inferno")

# This ensures the plot will have a 1:1 aspect ratio 
# (i.e. geom_tile()???which draws rectangles???will draw nice squares).
gg <- gg + coord_equal()

# By state
gg <- gg + facet_wrap(~ ENTIDAD, ncol = 4)

# This tells ggplot to not use an x- or y-axis label and to also not reserve any space for them.
gg <- gg + labs(x=NULL, y=NULL, title = "Temperatura Promedio por Estado")

# Customize the plot
gg <- gg + theme_tufte(base_family="Helvetica")

# I like my plot titles left-aligned. 
gg <- gg + theme(plot.title=element_text(hjust=0))

# We don???t want any tick marks on the axes and I want the text to be slightly smaller 
# than the default.
gg <- gg + theme(axis.ticks=element_blank())
gg <- gg + theme(axis.text=element_text(size=7))

# For the legend, I just needed to tweak the title and text sizes a wee bit.
gg <- gg + theme(legend.title=element_text(size=6))
gg <- gg + theme(legend.title.align=1)
gg <- gg + theme(legend.text=element_text(size=6))
gg <- gg + theme(legend.position="bottom")
gg <- gg + theme(legend.key.size=unit(0.2, "cm"))
gg <- gg + theme(legend.key.width=unit(1, "cm"))
gg


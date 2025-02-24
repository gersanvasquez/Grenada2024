# Load packages
library(sf)
library(tidyverse)
library(ggrepel)

#Create dataframe
df <- data.frame(
  area = c("Carriacou"),
  lat = c(12.47817130120351),
  long = c(-61.4484610645661)
)


# Set the working directory
setwd("C:/Users/GersanVasquez/Documents/CORE/Grenada/grd_admbnd_cdema_20240709_ab_shp")

# Read the shapefile
grenada <- st_read("grd_admbnda_adm1_cdema_20240709.shp")

#Visualize it
plot(grenada)

#Map Grenada with capital

ggplot() +
  geom_sf(data = grenada, fill = "lightgray") +
  geom_point(
    data = df, 
    aes(x = long, y = lat, color = area), 
    size = 2, 
    alpha = 0.8
  ) +
  geom_text_repel(
    data = df, 
    aes(x = long, y = lat, label = area, color = area), 
    nudge_x = 0, 
    nudge_y = 0, 
    size = 3.5
  ) +
  scale_color_manual(values = c("Carriacou" = "#f8485e")) +
  labs(caption = "Author's elaboration",
       x = "", 
       y = "") +
  annotate("text", x = -61.74936114974503, y= 12.056150196152306 , label = "★ St George's",
           size = 3, fontface="bold", hjust = 0) +
  annotate("text", x = -61.83739075169054, y= 12.386480134819164 , label = "Caribbean Sea",
           size = 3, fontface = "italic", hjust = 0) +
  annotate("text", x = -61.48409078746979, y= 12.234700072811826 , label = "Atlantic Ocean",
           size = 3, fontface = "italic", hjust = 0) +
    theme_void() +
  theme(
    legend.position="none",
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    plot.caption = element_text(size = 11, margin = margin(t = 12), color = "#7a7d7e"),
    plot.subtitle = element_text(hjust = 0.5, face = "italic", size = 12, margin = margin(b = 14))
  )



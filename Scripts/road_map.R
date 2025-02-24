# Load packages
library(sf)
library(tidyverse)
library(ggrepel)

#Create dataframe
df <- data.frame(
  location = c("Windward", "Brunswick", "Petite Carenage", "Limliar", "Beausejour", "Bogles"),
  lat = c(12.512152628668689, 12.47506252, 12.524058087656863, 12.503483214766641, 12.487983025627676, 12.50127132),
  long = c(-61.4309190950288556, -61.45947395, -61.43519408893936, -61.43095312978235, -61.4507336825558, -61.43212969)
)


# Set the working directory
setwd("C:/Users/GersanVasquez/Documents/CORE/Grenada/hotosm_grd_roads_lines_shp")

# Read the shapefile
grenada <- st_read("hotosm_grd_roads_lines_shp.shp")

#Visualize it
plot(grenada)

# Define the bounding box coordinates for Carriacou
carriacou_bbox <- st_bbox(c(xmin = -61.5, xmax = -61.4, ymin = 12.45, ymax = 12.6), crs = st_crs(grenada))

# Filter the spatial data to include only features within the Carriacou bounding box
grenada_carriacou <- st_crop(grenada, carriacou_bbox)

ggplot() +
  geom_sf(data = grenada_carriacou, color = "black", size = 0.5) +  # Plot streets
  geom_point(data = subset(df, lat >= 12.45 & lat <= 12.6 & long >= -61.5 & long <= -61.4), 
             aes(x = long, y = lat), color = "#f8485e", size = 3) +  # Plot locations on Carriacou
  geom_text_repel(data = subset(df, lat >= 12.45 & lat <= 12.6 & long >= -61.5 & long <= -61.4), 
                  aes(x = long, y = lat, label = location), 
                  size = 4, color = "#f8485e", fontface = "bold", nudge_x = 0.01) +  # Shift labels slightly outside
  annotate("text", x = -61.44, y = 12.47, label = "\u2695 Princess Royal \n Hospital Carriacou",
           size = 4, fontface = "bold", color = "black", hjust = 1) +  # Shift annotation outside map
  annotate("text", x = -61.43, y = 12.51, label = "Dover School\U1F4D6",
           size = 4, fontface = "bold", color = "black", hjust = 1) +  # Shift annotation outside map
  theme_void()



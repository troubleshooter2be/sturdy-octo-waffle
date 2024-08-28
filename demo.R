# Install required packages
install.packages("raster")
install.packages("sf")  # For handling spatial vector data

# Load libraries
library(raster)
library(sf)

# Define the extent of the raster
extent <- extent(0, 10, 0, 10)

# Create a raster object with a resolution of 1x1
r <- raster(extent, nrow = 10, ncol = 10)

# Populate the raster with values (e.g., a gradient)
values(r) <- 1:ncell(r)

# Write the raster to a file
writeRaster(r, "example_raster.tif", format = "GTiff", overwrite = TRUE)

# Convert raster to polygons
polygons <- as(r, "SpatialPolygonsDataFrame")

# Convert to sf object
polygons_sf <- st_as_sf(polygons)

# Write the polygons to a shapefile
st_write(polygons_sf, "example_shapefile.shp", delete_layer = TRUE)
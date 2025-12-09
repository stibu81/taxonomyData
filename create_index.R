# create index.html which will be deployed to
# https://stibu81.github.io/taxonomyData/

library(simpleTaxonomy)
library(magrittr)
library(htmlwidgets)
library(htmltools)

taxonomy <- read_taxonomy("taxonomy.csv")
widget <- plot_taxonomy(taxonomy,
                        expand_rank = c("Gattung", "Art"),
                        image_size = 250,
                        show_images = TRUE)
save_taxonomy(widget, "index.html", title = "taxonomyData")

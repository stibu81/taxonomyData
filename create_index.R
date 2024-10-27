# create index.html which will be deployed to
# https://stibu81.github.io/taxonomyData/

library(simpleTaxonomy)

taxonomy <- read_taxonomy("taxonomy.csv")
widget <- plot_taxonomy(taxonomy,
                        expand_rank = c("Gattung", "Art"),
                        show_images = TRUE)

htmlwidgets::saveWidget(widget, "index.html",
                        title = "taxonomyData")

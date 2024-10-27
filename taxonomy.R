# install simpleTaxonomy with
# remotes::install_github("stibu81/simpleTaxonomy")

library(simpleTaxonomy)

taxonomy <- enrich_taxonomy_with_images("taxonomy.csv")

taxonomy <- read_taxonomy("taxonomy.csv")
plot_taxonomy(taxonomy,
              show = c(),
              full_expand = c(),
              focus = c(),
              expand_rank = c("Gattung", "Art"),
              show_images = TRUE
              )



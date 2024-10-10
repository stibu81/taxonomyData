# install simpleTaxonomy with
# remotes::install_github("stibu81/simpleTaxonomy")

library(simpleTaxonomy)
here::i_am("taxonomy.R")

taxonomy <- read_taxonomy(here::here("taxonomy.csv"))
plot_taxonomy(taxonomy,
              show = c(),
              full_expand = c(),
              focus = c(),
              expand_rank = c("Gattung", "Art")
              )



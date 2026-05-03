# install simpleTaxonomy with
# remotes::install_github("stibu81/simpleTaxonomy")

library(simpleTaxonomy)

# store your Wikipedia contact data in a file called "contact".
# It should contain two lines with language code and username, e.g.
# de
# Me
contact <- if (file.exists("contact")) {
  setNames(as.list(readLines("contact")), c("lang", "user"))
}
taxonomy <- enrich_taxonomy_with_images("taxonomy.csv", contact = contact)


taxonomy <- read_taxonomy("taxonomy.csv")
plot_taxonomy(taxonomy,
              show = c(),
              full_expand = c(),
              focus = c(),
              highlight = c(),
              expand_rank = c("Gattung", "Art"),
              show_images = TRUE,
              image_size = "250"
              )



# install simpleTaxonomy with
# remotes::install_github("stibu81/simpleTaxonomy")

library(simpleTaxonomy)

# get Wikipedia image urls #####

# store your Wikipedia contact data in a file called "contact".
# It should contain two lines with language code and username, e.g.
# de
# Me
contact <- if (file.exists("contact")) {
  setNames(as.list(readLines("contact")), c("lang", "user"))
}
taxonomy <- enrich_taxonomy_with_images("taxonomy.csv", contact = contact)


# create a taxonomy plot #####

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


# run the shiny app #####

run_brave <- function(url) system(paste("brave", url, "&"))
run_floorp <- function(url) system(paste("floorp", url, "&"))
run_taxonomy("taxonomy.csv", 
             root = "Lebewesen",
             expand_ranks = c("Domäne", "Reich", "Gattung", "Art"),
             image_size = "250",
             launch_browser = run_floorp)

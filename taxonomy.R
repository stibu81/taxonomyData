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


# enrich meta data (local, observed) #####

# store your inat user name and local country data in a file called "inat".
# It should contain two lines with country name and user name, e.g., 
# Switzerland
# Me
inat <- if (file.exists("inat")) {
  setNames(as.list(readLines("inat")), c("country", "user"))
}
taxonomy <- enrich_local_observed(
  "taxonomy.csv", local_country = inat$country, user = inat$user
)
taxonomy <- inherit_meta_data("taxonomy.csv")


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

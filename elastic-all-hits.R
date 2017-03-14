source('~/workspace/r-studio/mappings.R')
source('~/workspace/r-studio/connection.R')
source('~/workspace/r-studio/output.R')

main <- function(query) {
  if (is.null(query)) { # To reload the data without querying again elasticsearch, just send it again as parameter
    query <- search_all_hits(index="events-*", q="event:keychain_item_not_found")
  }
  
  # Mapping function, only resolved once for performance
  map_f <- map_functions()

  df <- dataframe_with_names(map_f[,1])
  for (e in query) {
    dr <- data.frame(apply_map_to_event(map_f[,2], e))
    rbind(df,dr)
  }
  df
}

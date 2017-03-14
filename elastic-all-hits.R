source('~/workspace/r-studio/mappings.R')
source('~/workspace/r-studio/connection.R')
source('~/workspace/r-studio/output.R')

# It's encoraged to store the result in a global variable to avoid multiple calls to server
raw_result <- function() {
  search_all_hits(index="events-*", q="event:keychain_item_not_found")
}

main <- function(raw_result) {
  # Mapping function, only resolved once for performance
  map_f <- map_functions()

  df <- data.frame()
  for (e in raw_result) {
    v <- apply_map_to_event(map_f[,2], e)
    df <- rbind(df,v)
  }
  names(df) <- map_f[,1]
  df
}

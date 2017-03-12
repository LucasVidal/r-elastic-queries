start <- function() {
  library("elastic") 
  library('httr')
  connect("search-authy-logs-production-wqgtexkfcofbtsi75ljdfkr5ke.us-east-1.es.amazonaws.com", es_transport_schema = "https", es_port = 443)
}

search_all_hits <- function(index, query, fields) {
  res <- Search(index = index, q=query, scroll="5m", search_type = "scan", config=verbose())
  out <- list()
  hits <- 1
  while(hits != 0){
    res <- scroll(scroll_id = res$`_scroll_id`, config=verbose())
    hits <- length(res$hits$hits)
    if(hits > 0)
      out <- c(out, res$hits$hits)
  }
  out
}

do_it <- function() {
  search_all_hits(index="events-*", q="event:keychain_item_not_found")
}


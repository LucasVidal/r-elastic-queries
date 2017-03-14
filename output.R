# Helper method, creates empty dataframe with names
dataframe_with_names <- function(names) {
  as.data.frame(setNames(replicate(length(names),numeric(0), simplify = F), names), stringsAsFactors = FALSE)
}

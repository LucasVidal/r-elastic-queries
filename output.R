# Helper method, creates empty dataframe with names
dataframe_with_names <- function(names) {
  as.data.frame(setNames(replicate(length(map[,1]),numeric(0), simplify = F), map[,1]))
}


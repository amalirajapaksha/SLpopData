#' List Available Datasets
#'
#' @export
list_datasets <- function() {
  utils::data(package = "SLpopData")$results[, c("Item", "Title")]
}

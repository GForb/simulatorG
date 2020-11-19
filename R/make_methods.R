

#' make_methods
#' Create  a list of method objects for use with the simulator package
#'
#' @param methods A list containing the methods to be made
#' @param labels A list containing the labels for each method. If empty defaults to method names.

#' @return Function returns a list of method objects
#' @export
#'
#' @examples make_methods(list(example), list("this is an example method"))

make_methods <- function(methods, labels = methods) {
  methods <- map2(methods, labels, ~make_method(method = .x, label = .y) )
  return(methods)
}

make_method <- function(method, label) {
  simulator::new_method(method, label, method = get(paste0("method_", method)))

}

method_example <- function(model, draw) {
  return(as.list("example"))
}

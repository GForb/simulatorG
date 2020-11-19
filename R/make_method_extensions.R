#' make_method_extentions
#'
#'function for creating method extention objects for package simulator.
#'
#' @param method_extentsions lsit of names for method_extentiosn. Functions defining the method extention must existed named method_extention_"name".
#' @param labels labels for method extentions
#'
#' @return returns list of method extention objects
#' @export
#'
#' @examples make_method_extentions(list("example"), list("this is an example"))
make_method_extensions <- function(method_extensions, labels = method_extensions) {
  methods <- map2(method_extensions, labels, ~make_method_extension(.x, .y))
  return(methods)
}

make_method_extension <- function(method, label) {
  simulator::new_method_extension(name = method,
                                 label = label,
                                 method_extension = get(paste0("method_extension_", method)))

}

method_extension_example <- function(model, draw, out, base_method) {
  return(as.list("example"))
}

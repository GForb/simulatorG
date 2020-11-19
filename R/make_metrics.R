#' make_metrics
#'
#' makes matrics objects for use with simulator package
#'
#' @param metrics list of metrics to be created
#' @param labels labels of metric objects
#'
#' @return List of metric objects
#' @export
#'
#' @examples
make_metrics <- function(metrics, labels = metrics) {
  metrics <- purrr:: map2(metrics, labels, ~make_metric(.x, .y))
  return(metrics)
}

make_metric <- function(metric, label) {
  metric <- simulator::new_metric(name = metric,
                                  label = label,
                                  metric = get(paste0("eval_", metric)))
    return(metric)
}

eval_example <- function(model, out) {
  return("test")
}


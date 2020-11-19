#' evals_as_tibble
#'
#' @param sim_objects A list of simulation object from the simulator package which incledes evaluations of methods
#' @param include_model_parameters A logical indicating whether the label and parameters from the models should be included in the tibble
#' @return Returns a tibble of results.
#' @export
#'
#' @examples
evals_as_tibble <- function(sim_objects) {
  map_dfr(sim_objects, eval_as_tibble) %>%
    as_tibble
}

eval_as_tibble <- function(sim_object) {

sim_object %>%
    evals %>%
    as.data.frame %>%
    as_tibble %>%
    pivot_longer(cols = c(everything(), -Model, -Method, -Draw, -time), names_to = "metric")

}

#' Title
#'
#' @param sim A simulator simulation object
#' @param evals_tibble Tibble containing results of evaluations
#'
#' @return Evaluations tibble with model paramaters added as columns
#' @export
#'
#' @examples
add_model_to_evals <- function(evals_tibble, sim) {
  model_df <- sim %>% simulator::model() %>% as.data.frame
  dplyr::left_join(evals_tibble,model_df , by = c("Model" = "name")) %>%
    as_tibble
}

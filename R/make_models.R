
#' make models
#'
#'This function is to be deleted as models are passed to simulator with make functions.
#'
#'
make_models <- function(models, labels, params) {
  argument_table <- tibble::tibble(model = models, label = labels, params = (params))
  models <- purrr:::pmap(argument_table, make_model)
  return(models)
}

make_model <- function(model, label, params) {
  argument_list <- c(list(name = model,
                          label = label,
                          simulate = get(paste0("gen_", model))),
                     params)
  do.call(simulator::new_model, args = argument_list)
}

gen_example <- function(nsim, a, b) {
  data.frame(a = a, b = b)
}

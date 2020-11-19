#' calc_se_bias
#'
#' Calcualtes the standard deviations of column of beta coeficients)
#'
#' @param data a tibble containing the beta coeficients
#' @param beta a string indicating which column contains the beta coeficients
#' @param by variabels to group by
#'
#' @return the data frame with a column containing empirical standard errors added
#' @export
#'
#' @examples data %>% calc_empirical_se
calc_se_bias <- function(data, estimates = "estimate", est_se = "std.error") {
    empirical_se <- data %>%
      filter(metric %in% estimates) %>%
      group_by(Model, Method, metric) %>%
      summarise_at(.vars = "value", .funs = list(empirical_se = sd))

    data <- empirical_se %>%
      mutate(metric = est_se) %>%
      right_join(data, by = c("metric", "Method", "Model")) %>%
      filter(metric %in% est_se) %>%
      mutate(se_bias = value - empirical_se) %>%
      select(-value, -empirical_se) %>%
      rename(value = se_bias) %>%
      mutate(metric = paste0(metric, "_bias")) %>%
      bind_rows(data) %>%
      ungroup

    #Addng empirical se to results
    # data <- empirical_se %>%
    #   rename(value = empirical_se) %>%
    #   mutate(metric = paste0(metric, "_se_empirical")) %>%
    #   bind_rows(data) %>%
    #   ungroup

  return(data)

}


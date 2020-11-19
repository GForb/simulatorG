#' Title simulator_results_summary
#'
#' @param evaluations_tibble Evaluations from a simulator simulations in a tibble created by evals_as_tibble
#' @param .funs a list of functions to be passed to dplyr::summarise_all
#'
#' @return a tibble containing summaries of the evaluation metrics
#' @export
#'
#' @examples
simulator_results_summary <- function(evaluations_tibble, .funs = list(mean)) {
  evaluations_tibble %>%
    select(-Draw, -time, label) %>%
    group_by_at(vars(-value)) %>%
    get_all_summaries
}

get_all_summaries <- function(data, na.rm  = TRUE) {
  data %>% summarise_all(.funs = list(count = ~sum(!is.na(.)),
                             mean = ~mean(., na.rm  = na.rm ),
                             sd = ~sd(., na.rm = na.rm),
                             median = ~stats::median(., na.rm  = na.rm ),
                             q1 = ~stats::quantile(., probs = 0.25, na.rm = na.rm ),
                             q3 = ~stats::quantile(.,probs = 0.75, na.rm  = na.rm ),
                             min = ~min(., na.rm  = na.rm ),
                             max = ~max(., na.rm  = na.rm ))) %>%
    mutate(se = sd/sqrt(count)) %>%
    mutate(ll = mean - qnorm(0.975)*se) %>%
    mutate(ul = mean + qnorm(0.975)*se) %>%
    ungroup
}

mean_se <- function(variables) {

}

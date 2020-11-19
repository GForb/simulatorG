#' Title ggplot2 code for plotting reuslts
#'
#' @param data data set of results summaries
#' @param metric metric to be plotted
#' @param nominal_level nominal level for horizontal line added to plot
#' @param shape variable to be used for shape
#' @param colour variable to be used for colour of points
#' @param jitter_width horizontal jitter.
#'
#' @return
#' @export
#'
#' @examples
plot_results <- function(data, metric , shape, colour, jitter_width = NU, nominal_level = NULL) {
  plot <- data %>%
    filter(metric == metric) %>%
    ggplot2::ggplot(mapping = ggplot2::aes(x = n, y = mean, shape = .data[[shape]], colour = .data[[colour]])) +
    ggplot2::geom_jitter()

  if(!is.null(nominal_level)){
    plot <- plot +  ggplot2::geom_hline(yintercept = nominal_level, colour = "red", linetype = "dashed",size=0.5 )
  }
  return(plot)
}

#' Graph Circulation By Dewey Classification
#'
#' \code{deweygraph} produces a bar graph showing the total aggregate
#' circulation for 10 broad dewey classifications.
#'
#' This function accepts a data frame containing bibliographic data for
#' non-fiction monographs using Dewey Decimal Classification and must contain at
#' least the following named columns: CHARGES - an integer for the total number
#' of charges for each item; CALLNUM - a numeric value describing the item's
#' Dewey Decimal Classification. A bar graph is produced using ggplot2,
#' subdividing data according to 10 broad Dewey Decimal Classes (100s, 200s,
#' etc.) and showing total aggregate circulation for all items in each class.
#'
#' @param librarydata Data frame which must contain at least two columns, one labeled
#'   CHARGES containing integer data, another labeled CALLNUM containing numeric data.
#' @return Returns a bar graph.
#' @examples
#' deweygraph(cleanlib)
#'
#' @export

deweygraph <- function(librarydata){
  ggplot2::ggplot(librarydata, ggplot2::aes(librarydata$CALLNUM)) + ggplot2::scale_x_continuous(breaks = seq(0,1000,by=100), minor_breaks = NULL) + ggplot2::xlab("Dewey Section") + ggplot2::ylab("Charges") + ggplot2::stat_summary_bin(ggplot2::aes(y = CHARGES),color = "black", fill = "blue", fun.y = "sum", geom = "bar", bins = 10)
}

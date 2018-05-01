library(eeptools)

#' Compute library circulation regression.
#'
#' \code{libregress} calculates a linear regression model with circulation
#' frequency (charges per year) as the dependent variable and item price, number
#' of pages, and time in collection (age) as independent variables.
#'
#' This function accepts a data frame containing bibliographic data for
#' non-fiction monographs using Dewey Decimal Classification and must contain at
#' least the following named columns: CHARGES - an integer for the total number
#' of charges for each item; PAGES - an integer describing the number of pages
#' for each item;PRICE - a double containing the price of each item. CREATED - a
#' string describing the date the item was entered into the collection in
#' "mm/dd/yyyy" format. The function computes the "age" of each item in years by
#' subtracting the date created from the current date. It then calculates the
#' frequency of circulation by dividing the total number of charges by the age.
#' A linear regression model is then computed from the data, with circulation
#' frequency as the dependent variable and item price, pages, and age as the
#' independent variables.
#'
#' @param librarydata Data frame which must contain three columns labeled
#'   CHARGES, PAGES, and PRICE containing numeric data, and one column labeled
#'   CREATED containing strings in "mm/dd/yyyy" format.
#' @param circonly If TRUE, items with zero charges are excluded from the regression.
#' @return Returns a linear regression.
#' @examples
#' libregress(cleanlib)
#' libregress(cleanlib, circonly = TRUE)
#'
#' @export

libregress <- function(librarydata, circonly = FALSE){
  librarydata <- circfreqcalc(librarydata)
  if (circonly == TRUE){librarydata <- librarydata[(librarydata$CHARGES != 0),]}
  lm(formula = CIRCFREQ ~ PRICE + PAGES + AGE, data = librarydata)
}

circfreqcalc <- function(librarydata){
  d <- Sys.Date()
  format(d, format = "%m/%d/%Y")
  for (n in librarydata){
    itemage <- eeptools::age_calc(dob = as.Date(librarydata$CREATED, format = "%m/%d/%Y"), enddate = d, units = "years")
    librarydata$AGE = itemage
    librarydata$CIRCFREQ = librarydata$CHARGES/itemage
  }
  return(librarydata)
}


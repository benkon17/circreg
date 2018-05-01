library(stringr)

#' Clean library circulation data.
#'
#' \code{cleandata} converts and cleans raw data obtained from library
#' management systems (i.e SIRSI), in preparation for use in regression
#' modeling.
#'
#' This function accepts a data frame containing bibliographic data for
#' non-fiction monographs using Dewey Decimal Classification and must contain at
#' least the following named columns: CALLNUM - a string consisting of
#' alpha-numeric call numbers; PAGES - string containing the number of pages in
#' the monograph (e.g. MARC tag for physical description);PRICE - a string
#' containing the price of the item.The function extracts numeric values for
#' dewey classification, number of pages, and price for each item. It then
#' removes all items with CALLNUM not in the range of 0 to 1000, all items with
#' values for PAGES less than 5 or NA, and all items with PRICE equal to zero.
#'
#' @param librarydata Data frame containing at least three columns labeled
#'   CALLNUM, PAGES, and PRICE.
#' @return Returns a data frame with numeric values for CALLNUM, PAGES, and
#'   PRICE and items with invalid entries removed.
#' @examples
#' cleandata(libdata)
#' @export


cleandata <- function(librarydata){

#function for extracting numeric dewey numbers
deweynumeric <- function(librarydata){
  deweyextract <- function(string){
    stringr::str_extract(string, "\\d+\\.?\\d*")
  }
  for (n in librarydata){
    options(scipen = 999)
    librarydata$CALLNUM <- as.double(deweyextract(librarydata$CALLNUM))
    }
  return(librarydata)
}

#function for extracting numeric price
pricenumeric <- function(librarydata){
  priceextract <- function(string){
    stringr::str_extract(string, "\\d+\\.?\\d*")
  }
  for (n in librarydata){
    options(scipen = 999)
    librarydata$PRICE <- as.double(priceextract(librarydata$PRICE))
  }
  return(librarydata)
}

#function for extracting number of pages
pagenumeric <- function(librarydata){
  pageextract <- function(string){
    stringr::str_extract(string, "\\d+")
  }
  for (n in librarydata){
    options(scipen = 999)
    librarydata$PAGES <- as.integer(pageextract(librarydata$PAGES))
  }
  return(librarydata)
}

#function to remove deweys less than 1 or greater than 1000
rmdeweyol <- function(librarydata){
  librarydata <- librarydata[(librarydata$CALLNUM > 0.0 & librarydata$CALLNUM < 1000.0),]
  return(librarydata)
}

#function to remove items with price $0.00
rmfreebies <- function(librarydata){
  librarydata <- librarydata[(librarydata$PRICE != 0.0),]
  return(librarydata)
}

#function to remove items with pages NA or less than 5
rmnopages <- function(librarydata){
  librarydata <- librarydata[complete.cases(librarydata),]
  librarydata <- librarydata[librarydata$PAGES > 5,]
  return(librarydata)
}

deweys <- deweynumeric(libdata)
paged <- pagenumeric(deweys)
priced <- pricenumeric(paged)
truedeweys <- rmdeweyol(priced)
pricecheck <- rmfreebies(truedeweys)
cleaned <- rmnopages(pricecheck)
return(cleaned)

}

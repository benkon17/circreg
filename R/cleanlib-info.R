#' Cleaned Bibliographic data for 11840 juvenile non-fiction monographs.
#'
#' A cleaned dataset containing circulation and bibliographic information for 11840
#' juvenile non-fiction works in a public library collection.
#'
#' @format A data frame with 11840 rows and eight variables: 
#' \describe{
#'   \item{TITLE}{title of work} 
#'   \item{PAGES}{integer value equal to number of pages} 
#'   \item{CALLNUM}{numeric Dewey Decimal Classification} 
#'   \item{CHARGES}{total number of charges for item since entry into library catalog} 
#'   \item{LASTUSED}{date item was last used, mm/dd/yyyy} 
#'   \item{COPY}{copy number of the item} 
#'   \item{PRICE}{double indicating price of the item in US dollars} 
#'   \item{CREATED}{date the item was entered into library catalog, mm/dd/yyyy} 
#'   }
#' @source Obtained from the Delray Beach Public Library via library management
#'   system report (SIRSI).
"cleanlib"
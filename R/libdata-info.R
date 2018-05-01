#' Bibliographic data for 14509 juvenile non-fiction monographs.
#'
#' A dataset containing circulation and bibliographic information for 14509
#' juvenile non-fiction works in a public library collection.
#'
#' @format A data fram with 14509 rows and eight variables:
#' \describe{
#'   \item{TITLE}{title of work}
#'   \item{PAGES}{MARC formatted physical description of item, number of pages}
#'   \item{CALLNUM}{call number as it appears in library catalog}
#'   \item{CHARGES}{total number of charges for the item since entry into library catalog}
#'   \item{LASTUSED}{date item was last used}
#'   \item{COPY}{copy number of the item}
#'   \item{PRICE}{price of the item in US dollars}
#'   \item{CREATED}{date the item was entered into library catalog}
#'   }
#' @source Obtained from the Delray Beach Public Library via library management
#'   system report (SIRSI).
"libdata"

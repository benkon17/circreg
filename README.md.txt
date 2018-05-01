---
output:
  md_document:
    variant: markdown_github
---

# Building linear regression models for library circulation.
---

This package proposes a multiple linear regression model based on bibliographic and circulation information for non-fiction monographs in a public library system (or one that uses Dewey Decimal Classification). It assumes that an item's frequency of circulation (in charges per year) is linearly correlated with its price, time within the library system, and reading level (approximated by number of pages). Please note that these assumptions have not been thoroughly tested and the applicability of such a model may vary from library to library.
---

## Data preparation
---

Reports from library management systems may be used to gather and pre-process the data. The sample data provided was exported to a Microsoft excel file from SIRSI, converted to a comma separated file (csv), and then read into r using the read.csv function. The following minimum attributes will be necessary to complete the regression and should be named as follows:

*CHARGES - an integer representing the total number of charges for each item.
*PAGES - a string containing the number of pages in the item. Can be taken from the MARC tag for physical description (300).
*CALLNUM - a string representing the call number for the item. Should contain a Dewey Decimal Classification number.
*PRICE - the price of the item. May be be numeric or string.
*CREATED - a string representing the date the item was entered into the library system, in mm/dd/yyyy format.
---

## Features
---
The package comprises three main functions:

*cleandata() - used to extract numeric values for price, Dewey number, and number of pages. Removes items which are out of range or do not exist.
*deweygraph() - produces a bar graph showing total aggregate circulation for broad Dewey categories (100s, 200s, 300s, etc). Requires numeric Dewey values, which are produced using the cleandata() function.
*libregress() - computes age (time in library system) and frequency of circulation for each item, then calculates the multiple linear regression using frequency of circulation as the dependent variable and price, age, and number of pages as the independent variables.
---

## Installation

Use install_github("benkon17/circreg")
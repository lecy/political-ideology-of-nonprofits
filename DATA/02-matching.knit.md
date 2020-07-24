---
title: "Creating Matched Samples for Supermajority Voter Districts"
output:
  html_document:
    theme: readable
    df_print: paged
    highlight: tango
    smart: false
    toc: yes
    toc_float: no
    code_folding: show
---











# R Packages



```r
install.packages( "MatchIt" )
install.packages( "rgenoud" )
install.packages( "ggplot2" )
```



```r
library( MatchIt )    # popular matching package in R
library( rgenoud )    # genetic search used in matching 
library( dplyr )      # data wrangling 
library( ggplot2 )    # nice graphs 
library( stargazer )  # reports descriptive statistics 
library( pander )     # formats tables for printing in RMD files  
```



# Load Data

This file was generated from the data steps. 





































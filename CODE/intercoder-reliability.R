
library( irr )


# S-Type, O-Type, P-Type
kappa2( cbind( as.character(d1$Tax1), as.character(d2$Tax1) ), "unweighted" )
 
 Cohen's Kappa for 2 Raters (Weights: unweighted)

 Subjects = 125 
   Raters = 2 
    Kappa = 0.802 

        z = 12.5 
  p-value = 0 



# Religious
kappa2( cbind( as.character(d1$Tax2), as.character(d2$Tax2) ), "unweighted" )

Cohen's Kappa for 2 Raters (Weights: unweighted)

 Subjects = 125 
   Raters = 2 
    Kappa = 0.948 

        z = 10.6 
  p-value = 0 


# Vulnerable
kappa2( cbind( as.character(d1$Tax3), as.character(d2$Tax3) ), "unweighted" )

 Cohen's Kappa for 2 Raters (Weights: unweighted)

 Subjects = 125 
   Raters = 2 
    Kappa = 0.848 

        z = 9.69 
  p-value = 0 






d1 <- read.table( "clipboard", sep="\t", header=T )
d2 <- read.table( "clipboard", sep="\t", header=T )



d1 <- 
structure(list(Tax1 = structure(c(1L, 3L, 3L, 2L, 3L, 3L, 3L, 
3L, 3L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 2L, 3L, 3L, 2L, 
3L, 1L, 3L, 1L, 2L, 1L, 3L, 3L, 2L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 
1L, 2L, 3L, 2L, 3L, 1L, 1L, 3L, 2L, 3L, 2L, 1L, 2L, 1L, 2L, 1L, 
3L, 3L, 3L, 1L, 3L, 3L, 3L, 2L, 2L, 1L, 2L, 3L, 1L, 2L, 2L, 2L, 
2L, 2L, 3L, 2L, 3L, 3L, 2L, 2L, 2L, 3L, 2L, 3L, 2L, 1L, 1L, 2L, 
1L, 2L, 3L, 3L, 3L, 3L, 2L, 2L, 3L, 2L, 2L, 3L, 2L, 2L, 3L, 1L, 
2L, 3L, 1L, 3L, 2L, 2L, 3L, 3L, 2L, 3L, 3L, 3L, 3L, 2L, 1L, 2L, 
1L, 2L, 2L, 3L, 2L, 1L), .Label = c("O-Group", "P-Group", "S-Group"
), class = "factor"), Tax2 = structure(c(1L, 1L, 1L, 1L, 2L, 
2L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 
2L, 1L, 2L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 2L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 2L, 
1L, 1L, 1L, 2L, 2L, 1L, 1L, 1L), .Label = c("NOT", "Religious"
), class = "factor"), Tax3 = structure(c(2L, 2L, 1L, 2L, 2L, 
1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 
2L, 2L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
1L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
2L, 2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 
2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
1L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 1L, 2L, 
2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L), .Label = c("Disadvantaged", 
"Non-disadvantaged"), class = "factor")), .Names = c("Tax1", 
"Tax2", "Tax3"), class = "data.frame", row.names = c(NA, -125L
))


d2 <- 
structure(list(Tax1 = structure(c(1L, 3L, 3L, 3L, 3L, 3L, 3L, 
3L, 3L, 2L, 2L, 3L, 2L, 1L, 1L, 1L, 3L, 1L, 1L, 2L, 3L, 3L, 3L, 
3L, 2L, 3L, 1L, 2L, 1L, 3L, 3L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 1L, 
1L, 3L, 3L, 2L, 3L, 1L, 1L, 3L, 3L, 3L, 2L, 1L, 3L, 1L, 2L, 1L, 
2L, 3L, 3L, 3L, 3L, 3L, 3L, 2L, 2L, 1L, 2L, 3L, 1L, 2L, 1L, 2L, 
2L, 2L, 3L, 2L, 3L, 3L, 2L, 2L, 2L, 3L, 2L, 3L, 2L, 1L, 1L, 2L, 
1L, 2L, 3L, 3L, 3L, 3L, 2L, 2L, 3L, 1L, 2L, 3L, 2L, 2L, 3L, 1L, 
2L, 3L, 1L, 3L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 2L, 1L, 2L, 
1L, 2L, 2L, 3L, 2L, 3L), .Label = c("O-Group", "P-Group", "S-Group"
), class = "factor"), Tax2 = structure(c(1L, 1L, 1L, 1L, 2L, 
1L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 
2L, 1L, 2L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 2L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 2L, 
1L, 1L, 1L, 2L, 2L, 1L, 1L, 1L), .Label = c("NOT", "Religious"
), class = "factor"), Tax3 = structure(c(2L, 2L, 1L, 2L, 2L, 
1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 
2L, 2L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
1L, 2L, 3L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 
2L, 2L, 1L, 1L, 1L, 1L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
2L, 2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
1L, 2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 1L, 2L, 
2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L), .Label = c("Disadvantaged", 
"Non-disadvantaged", "Not Applicable"), class = "factor")), .Names = c("Tax1", 
"Tax2", "Tax3"), class = "data.frame", row.names = c(NA, -125L
))






library( dplyr )



table( x$Tax1, x$Politics ) %>% prop.table( margin=2 ) %>% round(2) 
table( x$Tax1, x$Politics ) %>% chisq.test( simulate.p.value = TRUE )

table( x$Tax2, x$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( x$Tax2, x$Politics ) %>% chisq.test( simulate.p.value = TRUE )

table( x$Tax3, x$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( x$Tax3, x$Politics ) %>% chisq.test( simulate.p.value = TRUE )


table( x$Tax3, x$Tax2, x$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( x$Tax3, x$Tax2, x$Politics ) %>% chisq.test( simulate.p.value = TRUE )


d2 <- read.table( "clipboard", sep="\t", header=T )

table( d2$Tax1, d2$Politics ) %>% prop.table( margin=2 ) %>% round(2) 
table(d2$Tax1, d2$Politics ) %>% chisq.test( simulate.p.value = TRUE )

table( d2$Tax2, d2$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( d2$Tax2, d2$Politics ) %>% chisq.test( simulate.p.value = TRUE )


table( d2$Tax3, d2$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( d2$Tax3, d2$Politics ) %>% chisq.test( simulate.p.value = TRUE )

d3 <- d2
d3$Tax3[ d3$Tax3 == "Not Applicable" ] <- NA
d3$Tax3 <- factor( d3$Tax3 )
table( d3$Tax3, d3$Politics ) %>% prop.table( margin=2 ) %>% round(2)
table( d3$Tax3, d3$Politics ) %>% chisq.test( simulate.p.value = TRUE )





dat <- read.csv( "https://www.dropbox.com/s/s2b2y1sndvgogqd/chi-square.csv?dl=1" )

t1 <- table( dat$Group, dat$Politics )

chisq.test( t1 ) 

t2 <- table( dat$Vulnerable, dat$Politics )

chisq.test( t2 ) 

t3 <- table( dat$Religious, dat$Politics )

chisq.test( t3 ) 






x <-
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
), class = "factor"), Tax3 = structure(c(2L, 2L, 1L, 2L, 1L, 
1L, 1L, 1L, NA, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 1L, 
2L, 2L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 2L, 
1L, 1L, 2L, 1L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
2L, 2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 
2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
1L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 1L, 2L, 
2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L), .Label = c("Disadvantaged", 
"Non-disadvantaged"), class = "factor"), Politics = structure(c(2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = c("D", 
"R"), class = "factor")), .Names = c("Tax1", "Tax2", "Tax3", 
"Politics"), class = "data.frame", row.names = c(NA, -125L))





d2 <- 
structure(list(Politics = structure(c(2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = c("D", "R"), class = "factor"), 
    F1 = structure(c(2L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 3L, 
    3L, 4L, 3L, 2L, 2L, 2L, 4L, 2L, 2L, 3L, 4L, 4L, 4L, 4L, 3L, 
    4L, 2L, 3L, 2L, 4L, 4L, 3L, 3L, 3L, 3L, 3L, 4L, 4L, 2L, 2L, 
    4L, 4L, 3L, 4L, 2L, 2L, 4L, 4L, 4L, 3L, 2L, 4L, 2L, 3L, 2L, 
    3L, 4L, 4L, 4L, 4L, 4L, 4L, 3L, 3L, 2L, 3L, 4L, 2L, 3L, 2L, 
    3L, 3L, 3L, 4L, 3L, 4L, 4L, 3L, 3L, 3L, 4L, 3L, 4L, 3L, 2L, 
    2L, 3L, 2L, 3L, 4L, 4L, 4L, 4L, 3L, 3L, 4L, 2L, 3L, 4L, 3L, 
    3L, 4L, 2L, 3L, 4L, 2L, 4L, 3L, 1L, 4L, 4L, 4L, 4L, 4L, 4L, 
    4L, 3L, 2L, 3L, 2L, 3L, 3L, 4L, 3L, 4L), .Label = c("Not Applicable", 
    "O-Group", "P-Group", "S-Group"), class = "factor"), F2 = structure(c(1L, 
    1L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 
    2L, 1L, 1L, 1L, 2L, 2L, 1L, 2L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 
    1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 
    2L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 
    1L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
    1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
    1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 
    1L, 2L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 2L, 
    2L, 1L, 1L, 1L), .Label = c("NOT", "Religious"), class = "factor"), 
    F3 = structure(c(2L, 2L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 2L, 
    2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 
    1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 3L, 
    2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 
    1L, 1L, 1L, 1L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 
    2L, 2L, 2L, 1L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 2L, 
    2L, 2L, 2L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 
    2L, 1L, 2L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 
    1L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 2L), .Label = c("Disadvantaged", 
    "Non-disadvantaged", "Not Applicable"), class = "factor")), .Names = c("Politics", 
"Tax2", "Tax2", "Tax3"), class = "data.frame", row.names = c(NA, -125L
))

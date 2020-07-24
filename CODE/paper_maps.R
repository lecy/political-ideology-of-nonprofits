
# setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - Republican and Democratic Nonprofits/Data and Analysis" )
#
# source( "02 - Create VTD to Census Tract Crosswalk.R" )


# load data from step 2 - NOT WORKING B/C of CENSUS DATA

setwd( "C:/Users/jlecy/Dropbox/04 - PAPERS/02 - Under Review/25 - Republican and Democratic Nonprofits/Data and Analysis/Census Data" )

census.dat <- read.csv( "Census Plus Crosswalk.csv", colClasses="character" )





##### LOAD CENSUS DATA AND VTD CROSSWALK FOR TEXAS



setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - Republican and Democratic Nonprofits/Data and Analysis/Census Data" )


crosswalk <- read.csv( "crosswalk.csv", colClasses="character" )

crosswalk$tract.key <- paste( crosswalk$county, gsub("\\.","",crosswalk$tract), sep="" )


census <- read.csv( "Texas Census Data.csv", colClasses="character" )

census.dat <- merge( crosswalk, census, by.x="tract.key", by.y="geoid" )









########    TEXAS   #########

# TX <- readShapePoly( fn="./Election data and state shapefiles/Texas_VTD", proj4string=CRS("+proj=longlat +datum=WGS84") )

library( rgdal )

setwd( "C:/Users/jlecy/Dropbox/04 - PAPERS/02 - Under Review/25 - Republican and Democratic Nonprofits/Data and Analysis/Election data and state shapefiles" )


TX <- readOGR(".","Texas_VTD")

tx <- as.data.frame( TX )







# identify supermajority districts

vote.dem <- tx$Pres_D_08 / (tx$Pres_D_08 + tx$Pres_R_08)

TX$dem.super <- as.numeric( vote.dem > 0.70 )

TX$repub.super <- as.numeric( vote.dem < 0.30 )


TX$Pres_D_08 <- as.numeric( as.character( TX$Pres_D_08 ) ) 
TX$Pres_R_08 <- as.numeric( as.character( TX$Pres_R_08 ) )

party1 <- rep( "white", length(TX) )
party1[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) < 0.3 ] <- "red"
party1[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) > 0.7 ] <- "blue"
TX$party1 <- party1

plot( TX, col=party1, border="light gray", lwd=0.5 )

par( mar=c(0,0,0,0) )
plot( TX, col=party1, border=NA, bg="gray80" )



party2 <- rep( "white", length(TX) )
party2[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) < 0.3 ] <- "gray70"
party2[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) > 0.7 ] <- "black"
TX$party2 <- party2

par( mar=c(0,0,0,0) )
plot( TX, col=party, border=NA, bg="gray80" )



library("rgeos")

tex.border <- gUnaryUnion( TX )

par( mar=c(0,0,0,0) )
plot( TX, col=party1, border=NA )
plot( tex.border, col=NA, border="darkgray", add=T )

plot( gUnaryUnion(xx), col = "red", axes = TRUE )
plot(gUnaryUnion(xx[c(9, 31, 82), ]), col = "blue", add = TRUE)




plot( TX, border="gray" )

points( coordinates( rep.tex ), pch=21, col="gray", bg="red", cex=1.5 )
points( coordinates( dem.tex ), pch=21, col="gray", bg="blue", cex=1.5 )






# houston

# county fips


TX$CNTY <- as.numeric( as.character( TX$CNTY ) )


these <- c( 015, 039, 071, 157, 167, 201, 291, 339, 407, 473 )

houston <- TX[ TX$CNTY %in% these , ]

par( mar=c(0,0,0,0) )
plot( houston, col=houston$party1, border=NA, bg="gray80" )




# AUSTIN

these <- c( 021, 055, 209, 453, 491 )

houston <- TX[ TX$CNTY %in% these , ]

plot( houston, col=houston$party, border=NA, bg="gray80" )



# DALLAS

these <- c( 085, 113, 121, 139, 213, 231, 257, 397 )
houston <- TX[ TX$CNTY %in% these , ]

plot( houston, col=houston$party, border=NA, bg="gray80" )




# merge voting and census dat

full.dat <- merge( tx, census.dat, by.x="vtdkey", by.y="vtdname" )



# identify supermajority districts

vote.dem <- full.dat$Pres_D_08 / (full.dat$Pres_D_08 + full.dat$Pres_R_08)

full.dat$dem.super <- as.numeric( vote.dem > 0.70 )

full.dat$repub.super <- as.numeric( vote.dem < 0.30 )


dems <- full.dat[ vote.dem > 0.70 , ]

repubs <- full.dat[ vote.dem < 0.30 , ]

match.dat <- rbind( dems, repubs )

match.dat <- na.omit( match.dat )




# match supermajority districts

# poverty.rate <-  as.numeric(match.dat$poverty) / as.numeric(match.dat$totalpop)

match.dat$poverty[171] <- "0.0"

poverty.rate <- as.numeric(match.dat$poverty)

# black.pop <- as.numeric(match.dat$black) / as.numeric(match.dat$totalpop)

black.pop <- as.numeric(match.dat$black)

white.pop <- as.numeric( match.dat$white )

pop.density <-  as.numeric(match.dat$totalpop) / as.numeric(match.dat$Shape_area)

dem.super <- match.dat$dem.super

match.dat$pop.density <- pop.density * 1000





library(MatchIt)

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density, 
                 data = match.dat,  method = "nearest" )


my.dat <- data.frame( geoname=match.dat$geoname, dem.super, poverty.rate, black.pop, pop.density )

my.dat <- na.omit( my.dat )

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density, 
                 data = my.dat,  method = "nearest" )

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density, 
                 data = my.dat,  method = "nearest", discard="both" )

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density, 
                 data = my.dat,  method = "nearest", discard="control" )

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density, 
                 data = my.dat,  method = "nearest", discard="treat" )






###   THIS ONE WORKS!

library(MatchIt)

my.dat <- data.frame( geoname=match.dat$geoname, dem.super, poverty.rate, black.pop, pop.density )

my.dat <- na.omit( my.dat )

m.out <- matchit( dem.super ~ poverty.rate + black.pop + pop.density,
                  data = my.dat, method = "genetic", discard="both" )

summary( m.out )

m.dat <- match.data( m.out )

summary( match.data(m.out, group = "treat") )
summary( match.data(m.out, group = "control") )

# summary( m.dat )
#
# Summary of balance for matched data:
#              Means Treated Means Control SD Control Mean Diff eQQ Med eQQ Mean eQQ Max
# distance            0.6893        0.6556     0.2990    0.0337  0.2683   0.2577  0.4534
# poverty.rate       28.4595       26.6419    12.6593    1.8177  7.9000   8.4889 22.5000
# black.pop          18.7121       17.0800    20.4719    1.6321  1.8000   8.2349 34.5000
# pop.density         0.0112        0.0110     0.0403    0.0001  0.0007   0.0076  0.1046






### CREATE A BALANCED SET WITH ONLY ONE CONTROL COUNTY FOR EACH TREATMENT COUNTY

matches <- m.out$match.matrix

these.matched <- row.names( matches)

# keep only the closest matches - each treatment group appears once, controls can appear many

dupes.temp <- data.frame( treat=row.names(matches), control=matches[,1], distance=m.out$distance[ these.matched ],
                          stringsAsFactors=F )

dupes.temp <- na.omit( dupes.temp[ order(dupes.temp$control) , ] )



dupes <- NULL

for( i in unique(dupes.temp$control) )
{
    sub.dupes <- dupes.temp[ dupes.temp$control == i , ]
    
    keep <- which( sub.dupes$distance == max(sub.dupes$distance) )
    
    dupes <- rbind( dupes, sub.dupes[ keep, ] )
    
}

these.ones <- c( dupes$treat, dupes$control )

balanced <- match.dat[ as.numeric(these.ones) , ]

from.to.temp1 <- paste( match.dat[ as.numeric(dupes$treat) , "vtdkey" ], "to", match.dat[ as.numeric(dupes$control) , "vtdkey" ], sep="" )
from.to.temp2 <- paste( match.dat[ as.numeric(dupes$control) , "vtdkey" ], "to", match.dat[ as.numeric(dupes$treat) , "vtdkey" ], sep="" )

balanced$match.pair <- c( from.to.temp1, from.to.temp2 )

t.test( as.numeric(balanced$poverty) ~ balanced$dem.super )
t.test( as.numeric(balanced$black) ~ balanced$dem.super )
t.test( balanced$pop.density ~ balanced$dem.super )




# view the matched pairs together

relevant.vars <- c( "vtdkey","cntyname","white","black","poverty","pop.density","dem.super","repub.super" )

compare <- cbind( match.dat[ as.numeric(dupes$treat) , relevant.vars ], match.dat[ as.numeric(dupes$control) , relevant.vars ] )

# write.csv( compare, "Matched Pairs.csv", row.names=F )








### MATCH NONPROFITS TO DEMOCRATIC COUNTIES




# library( maptools )
# 
# setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - Republican and Democratic Nonprofits/Data and Analysis/New folder" )
# 
# tx.all <- readShapePoly( fn="tl_2010_48477_vtd10", proj4string=CRS("+proj=longlat +datum=WGS84") )

setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - Republican and Democratic Nonprofits/Data and Analysis/Election data and state shapefiles" )

TX <- readOGR(".","Texas_VTD")

TX <- spTransform( TX, CRS("+proj=longlat +datum=WGS84"))



dem.vtds <- substr( match.dat[ as.numeric(dupes$treat) , "vtdkey" ], 3, 9 )

dem.tex <- TX[ as.numeric(as.character(TX$CNTYVTD)) %in% as.numeric(dem.vtds) , ]

rep.vtds <- substr( match.dat[ as.numeric(dupes$control) , "vtdkey" ], 3, 9 )

rep.tex <- TX[ as.numeric(as.character(TX$CNTYVTD)) %in% as.numeric(rep.vtds) , ]




plot( TX, border="gray" )

points( coordinates( rep.tex ), pch=21, col="gray", bg="red", cex=1.5 )
points( coordinates( dem.tex ), pch=21, col="gray", bg="blue", cex=1.5 )


party <- rep( NA, length(TX) )
party[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) < 0.3 ] <- "red"
party[ TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) > 0.7 ] <- "blue"

plot( TX, col=party, border="light gray" )


sum( TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) < 0.3, na.rm=T )
# [1] 2886

sum( TX$Pres_D_08 / ( TX$Pres_D_08 + TX$Pres_R_08 ) > 0.7, na.rm=T )
# [1] 1451






setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/05 - Nonprofit Growth/Data" )

library( foreign )

core2010 <- read.spss( "Core 2010 PC.sav", to.data.frame=T ) # 22,295 in TX

core.sub <- core2010[ core2010$STATE == "TX" , ]

lat <- core.sub$LATITUDE # x axis

lon <- core.sub$LONGITUD # y axis


# map of nonprofit locations

plot( TX, border="light gray" )

points( lon, lat, col=rgb(1,127/255,39/255,alpha=0.1), cex=0.6, pch=19 )


lon.lat <- data.frame( lon, lat )

lon.lat <- na.omit( lon.lat )

keep.rows <- row.names( lon.lat )



lon.lat <- SpatialPoints(coords=lon.lat, proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0") )

proj4string( lon.lat )

# lon.lat <- spTransform( lon.lat, CRS("+proj=longlat +datum=WGS84"))
# 
# proj4string( lon.lat )

proj4string( dem.tex )

plot( dem.tex )
plot( lon.lat, col="orange" , add=TRUE)



#### IDENTIFY POINTS INSIDE DEM SUPERMAJORITY DISTRICTS

nps.dem <- na.omit(over( lon.lat,  dem.tex ))

matched.nps.dem <- row.names( na.omit( nps.dem ) )

dem.nps <- core.sub[ as.numeric(matched.nps.dem) , ]

# > table( dem.nps$NTEE1 )
# 
#  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z 
# 16 27  1  4 13  4  9  0  5  1  0  3  1  6 12 20  3  0 11  5  1  0  4 10  1  1


# > summary( dem.nps$TOTREV2 )
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#  -969000    52260   163300  1728000   818800 55510000
 



#### IDENTIFY POINTS INSIDE REP SUPERMAJORITY DISTRICTS 

nps.rep <- na.omit( over( lon.lat,  rep.tex ) )

matched.nps.rep <- row.names( na.omit( nps.rep ) )

rep.nps <- core.sub[ as.numeric(matched.nps.rep) , ]



table( rep.nps$NTEE1 )

# A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z 
# 21 35  1  2 19  3  1  2  3  2  3  9  3  9  3 22  1  1  3  8  0  1  0 12  0  1 

summary( rep.nps$TOTREV2 )

#      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#    -19600     42610    106200   4030000    667000 305900000 




summary( rep.nps$ASS_EOY )
summary( dem.nps$ASS_EOY )

summary( rep.nps$TOTREV )
summary( dem.nps$TOTREV )

rep.nps$TOTREV[ rep.nps$TOTREV == 0 ] <- NA

summary( rep.nps$CONT / rep.nps$TOTREV )
summary( dem.nps$CONT / dem.nps$TOTREV )


summary( 2010 - as.numeric( substr( rep.nps$RULEDATE, 1, 4 ) ) )
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   -2.00    8.00   18.00   22.05   32.00   73.00 
summary( 2010 - as.numeric( substr( dem.nps$RULEDATE, 1, 4 ) ) )
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   -1.00    8.00   17.00   32.71   29.75 2010.00 
  

# > summary( rep.nps$CONT / rep.nps$TOTREV )
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
# -0.20680  0.02916  0.27320  0.43360  0.89630  1.10100        1 

# > summary( dem.nps$CONT / dem.nps$TOTREV )
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -0.4199  0.1000  0.6548  0.5813  0.9837  1.2770


dat.01 <- rbind( data.frame( NTEE=as.character(rep.nps$NTEE1), PARTY="Rep" ), data.frame( NTEE=as.character(dem.nps$NTEE1), PARTY="Dem" ) ) 

tab.01 <- table( dat.01$NTEE, dat.01$PARTY )

chisq.test( tab.01 ) 

# > chisq.test( tab.01 ) 
# 
#         Pearson's Chi-squared test
# 
# data:  tab.01
# X-squared = 40.2838, df = 25, p-value = 0.02726



chisq.test( tab.01, simulate=T )

# X-squared = 40.2838, df = NA, p-value = 0.01199


    Rep Dem
  A  21  16
  B  35  27
  C   1   1
  D   2   4
  E  19  13
  F   3   4
  G   1   9
  H   2   0
  I   3   5
  J   2   1
  K   3   0
  L   9   3
  M   3   1
  N   9   6
  O   3  12
  P  22  20
  Q   1   3
  R   1   0
  S   3  11
  T   8   5
  V   1   0
  X  12  10
  Z   1   1
  U   0   1
  W   0   4
  Y   0   1


NTEE major group

A	Arts, Culture, and Humanities
B	Education
C	Environmental Quality, Protection, and Beautification
D	Animal-Related
E	Health
F	Mental Health, Crisis Intervention
G	Diseases, Disorders, Medical Disciplines
H	Medical Research
I	Crime, Legal Related
J	Employment, Job Related
K	Food, Agriculture, and Nutrition
L	Housing, Shelter
M	Public Safety
N	Recreation, Sports, Leisure, Athletics
O	Youth Development
P	Human Services - Multipurpose and Other
Q	International, Foreign Affairs, and National Security
R	Civil Rights, Social Action, Advocacy
S	Community Improvement, Capacity Building
T	Philanthropy, Voluntarism, and Grantmaking Foundations
U	Science and Technology Research Institutes, Services
V	Social Science Research Institutes, Services
W	Public, Society Benefit - Multipurpose and Other
X	Religion Related, Spiritual Development
Y	Mutual/Membership Benefit Organizations, Other
Z	Unknown







setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - Republican and Democratic Nonprofits/Data and Analysis/Results" )

write.csv( rep.nps[ , 1:74 ], "Matched Republican Nonprofits in TX.csv", row.names=F )

write.csv( dem.nps[ , 1:74 ], "Matched Democratic Nonprofits in TX.csv", row.names=F )


# Sanity Check

pdf( "Sanity Check.pdf" )

lon.lat.rep <- data.frame( rep.nps$LONGITUD, rep.nps$LATITUDE )

lon.lat.rep <- SpatialPoints(coords=lon.lat.rep, proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0") )

proj4string( lon.lat.rep )

plot( rep.tex, main="Republican" )

plot( lon.lat.rep, col="red", pch=19, cex=0.05, add=TRUE )


lon.lat.dem <- data.frame( dem.nps$LONGITUD, dem.nps$LATITUDE )

lon.lat.dem <- SpatialPoints(coords=lon.lat.dem, proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0") )

proj4string( lon.lat.dem )

plot( dem.tex, main="Democrat" )

plot( lon.lat.dem, col="blue", pch=19, cex=0.05, add=TRUE )

dev.off()










# Washington County

tx.sub <- TX[ TX$CNTY == 477 , ]

plot( tx.sub )

party <- rep( NA, length(tx.sub) )
party[ tx.sub$Pres_D_08 / ( tx.sub$Pres_D_08 + tx.sub$Pres_R_08 ) < 0.3 ] <- "red"
party[ tx.sub$Pres_D_08 / ( tx.sub$Pres_D_08 + tx.sub$Pres_R_08 ) > 0.7 ] <- "blue"

plot( tx.sub, col=party )

# matched vtds in Washington County

case.col <- rep( NA, length(tx.sub) )
case.col[ tx.sub$VTD %in% c("0115","0205") ] <- "red"
case.col[ tx.sub$VTD %in% c("0116","0104") ] <- "blue"

plot( tx.sub, border="light gray", col=case.col )


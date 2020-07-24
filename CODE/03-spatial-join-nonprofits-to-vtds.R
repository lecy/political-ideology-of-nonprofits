
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

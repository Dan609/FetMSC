
##### Tracks importing from local dirs ##########
#################################################
# Choose dir ---------
file_list_12p_C10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)


file_list_12p_L10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_12p_Y10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_16p_C10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)


file_list_16p_L10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_16p_Y10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE) 

file_list_20p_C10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_20p_L10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_20p_Y10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_26p_C10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_26p_L10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

file_list_26p_Y10 <- list.files(path = , choose.dir(),
                              pattern = "csv",
                              all.files = FALSE,
                              full.names = TRUE, recursive = TRUE,
                              ignore.case = FALSE, include.dirs = FALSE,
                              no.. = FALSE)

#file_list_12p_C1010 <- list.files(path = , choose.dir(),
#pattern = "csv",
# all.files = FALSE,
#full.names = TRUE, recursive = TRUE,
#ignore.case = FALSE, include.dirs = FALSE,
# no.. = FALSE)

#file_list_12p_Y10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_12p_L10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_16p_C1010 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)


#file_list_16p_L10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_16p_Y10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE) 

#file_list_20p_C10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_20p_L1010 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_20p_Y10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_26p_C1010 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_26p_L10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)

#file_list_26p_Y10 <- list.files(path = , choose.dir(),
pattern = "csv",
all.files = FALSE,
full.names = TRUE, recursive = TRUE,
ignore.case = FALSE, include.dirs = FALSE,
no.. = FALSE)


###############################################
# Read cell tracks obtained from ImageJ and
# assign a unique number to each track
###############################################

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_12p_C10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '12p_C10.csv', row.names=FALSE) #
##
#
#
tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_12p_L10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '12p_L10.csv', row.names=FALSE) #
##
#
#


#tracks <- list()
#hundreds <- 1
#rm(tmp)

#for (file_name in file_list_12p_L10) {

#  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
#  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
#  tracks <- rbind(tracks, tmp)
# hundreds <- hundreds + 1

}

#colnames(tracks)<- c("Track","Slice","X","Y")
#tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
#tracks$X <- tracks$X*0.662252 # xy calibration:         
#tracks$Y <- tracks$Y*0.662252 # 
#length(unique(tracks$Track))
#write.csv(tracks, '12p_L10.csv', row.names=FALSE) #
##
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_12p_Y10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '12p_Y10.csv', row.names=FALSE) #
##
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_16p_C10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '16p_C10.csv', row.names=FALSE) #
##
#
#
tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_16p_L10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '16p_L10.csv', row.names=FALSE) #

#tracks <- list()
#hundreds <- 1
#rm(tmp)

#for (file_name in file_list_16p_L10) {

# tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
#tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
# tracks <- rbind(tracks, tmp)
# hundreds <- hundreds + 1

#}

#colnames(tracks)<- c("Track","Slice","X","Y")
#tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
#tracks$X <- tracks$X*0.662252 # xy calibration:         
#tracks$Y <- tracks$Y*0.662252 # 
#length(unique(tracks$Track))
#write.csv(tracks, '16p_L10.csv', row.names=FALSE) #
##
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_16p_Y10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '16p_Y10.csv', row.names=FALSE) #
##
#


tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_20p_C10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '20p_C10.csv', row.names=FALSE) #
##
#
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_20p_L10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '20p_L10.csv', row.names=FALSE) #
##
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_20p_Y10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '20p_Y10.csv', row.names=FALSE) #
##
#


tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_26p_C10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '26p_C10.csv', row.names=FALSE) #
##
#
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_26p_L10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '26p_L10.csv', row.names=FALSE) #
##
#

tracks <- list()
hundreds <- 1
rm(tmp)

for (file_name in file_list_26p_Y10) {
  
  tmp <- read.csv(file_name, skip = 1, header = FALSE)[1:4]
  tmp$V1 <- tmp$V1 + hundreds * 100 # rename tracks
  tracks <- rbind(tracks, tmp)
  hundreds <- hundreds + 1
  
}

colnames(tracks)<- c("Track","Slice","X","Y")
tracks$Slice <- (tracks$Slice - 1)*.25 # time to hours: 15 min = 0.25 h
tracks$X <- tracks$X*0.662252 # xy calibration:         
tracks$Y <- tracks$Y*0.662252 # 
length(unique(tracks$Track))
write.csv(tracks, '26p_Y10.csv', row.names=FALSE) #
##
#




############################
# READ
# TRACKS
############################
t_12p_C10 <- read.tracks.csv('12p_C10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)




t_12p_L10 <- read.tracks.csv('12p_L10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)


t_12p_Y10 <- read.tracks.csv('12p_Y10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)

t_16p_C10 <- read.tracks.csv('16p_C10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)




t_16p_L10 <- read.tracks.csv('16p_L10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)


t_16p_Y10 <- read.tracks.csv('16p_Y10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)

t_20p_C10 <- read.tracks.csv('20p_C10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)

#t_20p_C10 <- t_20p_C10[c(1:49, 58:106)]


t_20p_L10 <- read.tracks.csv('20p_L10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)


t_20p_Y10 <- read.tracks.csv('20p_Y10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)


#t_20p_Y10 <- t_20p_Y10[c(1:85, 90:96, 98)]




t_26p_C10 <- read.tracks.csv('26p_C10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)

#t_26p_C10 <- t_26p_C10[c(1:73, 80:94)]




t_26p_L10 <- read.tracks.csv('26p_L10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)


t_26p_Y10 <- read.tracks.csv('26p_Y10.csv',
                           id.column = 1,
                           time.column = 2,
                           pos.columns = c(3, 4),
                           scale.t = 1, # a value by which to multiply each time point
                           scale.pos = 1, # a value, by which to multiply each spatial position
                           header = TRUE,
                           sep = ",",
                           track.sep.blankline = FALSE)

#t_26p_Y10 <- t_26p_Y10[c(1:72, 76:89, 92:96)]




#####################################
# ROSE
# PLOT
# ###################################

plot( normalizeTracks(t_12p_C10[15:35]), 
      main = "12p_C10 \n Normalized data (N = 20)" )



#plot(t_FC_KC[1:20], main = "t_FC_KC\n(N = 10)")

# Overlay starting points to view directionality


#plot( normalizeTracks(t_12p_C10[1:10]), 
#      main = "12p_C10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_12p_L10[15:35]), 
      main = "12p_L10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_12p_Y10[15:35]), 
      main = "12p_Y10 \n Normalized data (N = 20)" )



plot( normalizeTracks(t_16p_C10[10:30]), 
      main = "16p_C10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_16p_L10[10:30]), 
      main = "16p_L10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_16p_Y10[10:30]), 
      main = "16p_Y10 \n Normalized data (N = 20)" )



plot( normalizeTracks(t_20p_C10[10:30]), 
      main = "20p_C10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_20p_L10[10:30]), 
      main = "20p_L1010 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_20p_Y10[10:30]), 
      main = "20p_Y10 \n Normalized data (N = 20)" )




plot( normalizeTracks(t_26p_C10[10:30]), 
      main = "26p_C10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_26p_L10[10:30]), 
      main = "26p_L10 \n Normalized data (N = 20)" )

plot( normalizeTracks(t_26p_Y10[10:30]), 
      main = "26p_Y10 \n Normalized data (N = 20)" )

#
# MSD
#
#
# Now, let's compare the MSD plot for the three different types of cells:
# Combine into a single dataframe with one column indicating the celltype
# To truly compare them, report subtrack length not in number of steps but
# in their duration (which may differ between different datasets)
#

t_12p_C10.msd <- aggregate( t_12p_C10, squareDisplacement, FUN = "mean.se" )
t_12p_C10.msd$Probe <- "t_12p_C10"
t_12p_C10.msd$dt <- t_12p_C10.msd$i * timeStep( t_12p_C10 )

t_12p_L10.msd <- aggregate( t_12p_L10, squareDisplacement, FUN = "mean.se" )
t_12p_L10.msd$Probe <- "t_12p_L10"
t_12p_L10.msd$dt <- t_12p_L10.msd$i * timeStep( t_12p_L10 )

t_12p_Y10.msd <- aggregate( t_12p_Y10, squareDisplacement, FUN = "mean.se" )
t_12p_Y10.msd$Probe <- "t_12p_Y10"
t_12p_Y10.msd$dt <- t_12p_Y10.msd$i * timeStep( t_12p_Y10 )




t_16p_C10.msd <- aggregate( t_16p_C10, squareDisplacement, FUN = "mean.se" )
t_16p_C10.msd$Probe <- "t_16p_C10"
t_16p_C10.msd$dt <- t_16p_C10.msd$i * timeStep( t_16p_C10 )

t_16p_L10.msd <- aggregate( t_16p_L10, squareDisplacement, FUN = "mean.se" )
t_16p_L10.msd$Probe <- "t_16p_L10"
t_16p_L10.msd$dt <- t_16p_L10.msd$i * timeStep( t_16p_L10 )

t_16p_Y10.msd <- aggregate( t_16p_Y10, squareDisplacement, FUN = "mean.se" )
t_16p_Y10.msd$Probe <- "t_16p_Y10"
t_16p_Y10.msd$dt <- t_16p_Y10.msd$i * timeStep( t_16p_Y10 )







t_20p_C10.msd <- aggregate( t_20p_C10, squareDisplacement, FUN = "mean.se" )
t_20p_C10.msd$Probe <- "t_20p_C10"
t_20p_C10.msd$dt <- t_20p_C10.msd$i * timeStep( t_20p_C10 )

t_20p_L10.msd <- aggregate( t_20p_L10, squareDisplacement, FUN = "mean.se" )
t_20p_L10.msd$Probe <- "t_20p_L10"
t_20p_L10.msd$dt <- t_20p_L10.msd$i * timeStep( t_20p_L10 )

t_20p_Y10.msd <- aggregate( t_20p_Y10, squareDisplacement, FUN = "mean.se" )
t_20p_Y10.msd$Probe <- "t_20p_Y10"
t_20p_Y10.msd$dt <- t_20p_Y10.msd$i * timeStep( t_20p_Y10 )





t_26p_C10.msd <- aggregate( t_26p_C10, squareDisplacement, FUN = "mean.se" )
t_26p_C10.msd$Probe <- "t_26p_C10"
t_26p_C10.msd$dt <- t_26p_C10.msd$i * timeStep( t_26p_C10 )

t_26p_L10.msd <- aggregate( t_26p_L10, squareDisplacement, FUN = "mean.se" )
t_26p_L10.msd$Probe <- "t_26p_L10"
t_26p_L10.msd$dt <- t_26p_L10.msd$i * timeStep( t_26p_L10 )

t_26p_Y10.msd <- aggregate( t_26p_Y10, squareDisplacement, FUN = "mean.se" )
t_26p_Y10.msd$Probe <- "t_26p_Y10"
t_26p_Y10.msd$dt <- t_26p_Y10.msd$i * timeStep( t_26p_Y10 )



#########################
############
### Control
msddata_C <- rbind( t_12p_C10.msd, t_16p_C10.msd, t_20p_C10.msd, t_26p_C10.msd )

MSDplot_C <- ggplot( msddata_C, aes( x = dt , 
                                     y = mean, 
                                     color = Probe, 
                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Control 10% FBS")

MSDplot_C

#########################
############
### LPA
msddata_L <- rbind( t_12p_L10.msd, t_16p_L10.msd, t_20p_L10.msd, t_26p_L10.msd )

MSDplot_L <- ggplot( msddata_L, aes( x = dt , 
                                     y = mean, 
                                     color = Probe, 
                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("LPA 10% FBS")

MSDplot_L

#########################
############
### Y27632
msddata_Y <- rbind( t_12p_Y10.msd, t_16p_Y10.msd, t_20p_Y10.msd, t_26p_Y10.msd )

MSDplot_Y <- ggplot( msddata_Y, aes( x = dt , 
                                     y = mean, 
                                     color = Probe, 
                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Y27632 10% FBS")


MSDplot_Y

#########################
############
### passage 12
msddata_12p <- rbind( t_12p_C10.msd, t_12p_L10.msd, t_12p_Y10.msd )

MSDplot_12p <- ggplot( msddata_12p, aes( x = dt , 
                                         y = mean, 
                                         color = Probe, 
                                         fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("FetMSC 12p 10% FBS")

MSDplot_12p


#########################
############
### passage 13
msddata_16p <- rbind( t_16p_C10.msd, t_16p_L10.msd, t_16p_Y10.msd )

MSDplot_16p <- ggplot( msddata_16p, aes( x = dt , 
                                         y = mean, 
                                         color = Probe, 
                                         fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("FetMSC 16p 10% FBS")


MSDplot_16p

#########################
############
### passage 20
msddata_20p <- rbind( t_20p_C10.msd, t_20p_L10.msd, t_20p_Y10.msd )

MSDplot_20p <- ggplot( msddata_20p, aes( x = dt , 
                                         y = mean, 
                                         color = Probe, 
                                         fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("FetMSC 20p 10% FBS")


MSDplot_20p

#########################
############
### passage 26
msddata_26p <- rbind( t_26p_C10.msd, t_26p_L10.msd, t_26p_Y10.msd )

MSDplot_26p <- ggplot( msddata_26p, aes( x = dt , 
                                         y = mean, 
                                         color = Probe, 
                                         fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("FetMSC 26p 10% FBS")


MSDplot_26p





# Plot MSD and compare with random walk simulation for 12p
# SET function to change timestep
time <- function( x, k ){
  x[,'t'] <- x[,'t']*k
  return(x)
}

# get displacement vectors
step.displacements <- t( sapply( subtracks(t_12p_C10, 1), displacementVector ) )

# get mean and sd of displacement in each dimension
step.means <- apply( step.displacements, 2, mean )
step.sd <- apply( step.displacements, 2, sd )

# simulate brownian motion with the same statistics
brownian.tracks <- simulateTracks( 50, brownianTrack( nsteps = 96, dim = 2,
                                                      mean = step.means,
                                                      sd = step.sd ) )

# Call function on each track using lapply
filtered.brownian.tracks <- lapply( brownian.tracks, function(x) time( x, .25 ) ) #
filtered.brownian.tracks <- as.tracks( filtered.brownian.tracks )
is.tracks( filtered.brownian.tracks )

# Rose Plot new simulation 
plot( filtered.brownian.tracks[1:10], main = "Simulated random walk\n (N=10)" )

# 
msd.brownian <- aggregate( filtered.brownian.tracks, squareDisplacement, FUN = "mean.se" )
msd.brownian$Probe <- "brownian"
msd.brownian$dt <- msd.brownian$i * timeStep( filtered.brownian.tracks )

######## Plot new simulation
ggplot( msd.brownian, aes( x = dt , 
                           y = mean, 
                           color = Probe, 
                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (h)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Random walk with 12p parameters")

# par(mfrow=c(1,2))
# Plot new simulation versus real data
### compare two msd plots
msddata_brownian2 <- rbind( t_12p_C10.msd, msd.brownian )

# Plot
MSDplot_brownian2 <- ggplot( msddata_brownian2, aes( x = dt , 
                                                     y = mean, 
                                                     color = Probe, 
                                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("12p_C10 and random walk")

MSDplot_brownian2

# Compare 12p and RW
msddata_12p_brownian <- rbind( t_12p_C10.msd, t_12p_L10.msd, t_12p_Y10.msd, msd.brownian )
head(msddata_12p_brownian)

# Plot
MSDplot_12p_brownian <- ggplot( msddata_12p_brownian, aes( x = dt , 
                                                           y = mean, 
                                                           color = Probe, 
                                                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("12p and random walk 10% FBS")


MSDplot_12p_brownian
######################
###########
######
###
#




# Plot MSD and compare with random walk simulation for 16p
# SET function to change timestep
time <- function( x, k ){
  x[,'t'] <- x[,'t']*k
  return(x)
}

# get displacement vectors
step.displacements <- t( sapply( subtracks(t_16p_C10, 1), displacementVector ) )

# get mean and sd of displacement in each dimension
step.means <- apply( step.displacements, 2, mean )
step.sd <- apply( step.displacements, 2, sd )

# simulate brownian motion with the same statistics
brownian.tracks <- simulateTracks( 50, brownianTrack( nsteps = 96, dim = 2,
                                                      mean = step.means,
                                                      sd = step.sd ) )

# Call function on each track using lapply
filtered.brownian.tracks <- lapply( brownian.tracks, function(x) time( x, .25 ) ) #
filtered.brownian.tracks <- as.tracks( filtered.brownian.tracks )
is.tracks( filtered.brownian.tracks )

# Rose Plot new simulation 
plot( filtered.brownian.tracks[1:10], main = "Simulated random walk\n (N=10)" )

# 
msd.brownian <- aggregate( filtered.brownian.tracks, squareDisplacement, FUN = "mean.se" )
msd.brownian$Probe <- "brownian"
msd.brownian$dt <- msd.brownian$i * timeStep( filtered.brownian.tracks )

######## Plot new simulation
ggplot( msd.brownian, aes( x = dt , 
                           y = mean, 
                           color = Probe, 
                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"????? (????)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Random walk with 16p parameters 10% FBS")

# par(mfrow=c(1,2))
# Plot new simulation versus real data
### compare two msd plots
msddata_brownian2 <- rbind( t_16p_C10.msd, msd.brownian )

# Plot
MSDplot_brownian2 <- ggplot( msddata_brownian2, aes( x = dt , 
                                                     y = mean, 
                                                     color = Probe, 
                                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("16p_C10 and random walk")

MSDplot_brownian2

# Compare 16p and RW
msddata_16p_brownian <- rbind( t_16p_C10.msd, t_16p_L10.msd, t_16p_Y10.msd, msd.brownian )
head(msddata_16p_brownian)

# Plot
MSDplot_16p_brownian <- ggplot( msddata_16p_brownian, aes( x = dt , 
                                                           y = mean, 
                                                           color = Probe, 
                                                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("16p and random walk 10% FBS")


MSDplot_16p_brownian
######################
###########
######
###
#


# Plot MSD and compare with random walk simulation for 20p
# SET function to change timestep
time <- function( x, k ){
  x[,'t'] <- x[,'t']*k
  return(x)
}

# get displacement vectors
step.displacements <- t( sapply( subtracks(t_20p_C10, 1), displacementVector ) )

# get mean and sd of displacement in each dimension
step.means <- apply( step.displacements, 2, mean )
step.sd <- apply( step.displacements, 2, sd )

# simulate brownian motion with the same statistics
brownian.tracks <- simulateTracks( 50, brownianTrack( nsteps = 96, dim = 2,
                                                      mean = step.means,
                                                      sd = step.sd ) )

# Call function on each track using lapply
filtered.brownian.tracks <- lapply( brownian.tracks, function(x) time( x, .25 ) ) #
filtered.brownian.tracks <- as.tracks( filtered.brownian.tracks )
is.tracks( filtered.brownian.tracks )

# Rose Plot new simulation 
plot( filtered.brownian.tracks[1:10], main = "Simulated random walk\n (N=10)" )

# 
msd.brownian <- aggregate( filtered.brownian.tracks, squareDisplacement, FUN = "mean.se" )
msd.brownian$Probe <- "brownian"
msd.brownian$dt <- msd.brownian$i * timeStep( filtered.brownian.tracks )

######## Plot new simulation
ggplot( msd.brownian, aes( x = dt , 
                           y = mean, 
                           color = Probe, 
                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"????? (????)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Random walk with 20p parameters 10% FBS")

# par(mfrow=c(1,2))
# Plot new simulation versus real data
### compare two msd plots
msddata_brownian2 <- rbind( t_20p_C10.msd, msd.brownian )

# Plot
MSDplot_brownian2 <- ggplot( msddata_brownian2, aes( x = dt , 
                                                     y = mean, 
                                                     color = Probe, 
                                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("20p_C10 and random walk")

MSDplot_brownian2

# Compare 20p and RW
msddata_20p_brownian <- rbind( t_20p_C10.msd, t_20p_L10.msd, t_20p_Y10.msd, msd.brownian )
head(msddata_20p_brownian)

# Plot
MSDplot_20p_brownian <- ggplot( msddata_20p_brownian, aes( x = dt , 
                                                           y = mean, 
                                                           color = Probe, 
                                                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("20p and random walk 10% FBS")


MSDplot_20p_brownian
######################
###########
######
###
#


# Plot MSD and compare with random walk simulation for 26p
# SET function to change timestep
time <- function( x, k ){
  x[,'t'] <- x[,'t']*k
  return(x)
}

# get displacement vectors
step.displacements <- t( sapply( subtracks(t_26p_C10, 1), displacementVector ) )

# get mean and sd of displacement in each dimension
step.means <- apply( step.displacements, 2, mean )
step.sd <- apply( step.displacements, 2, sd )

# simulate brownian motion with the same statistics
brownian.tracks <- simulateTracks( 50, brownianTrack( nsteps = 96, dim = 2,
                                                      mean = step.means,
                                                      sd = step.sd ) )

# Call function on each track using lapply
filtered.brownian.tracks <- lapply( brownian.tracks, function(x) time( x, .25 ) ) #
filtered.brownian.tracks <- as.tracks( filtered.brownian.tracks )
is.tracks( filtered.brownian.tracks )

# Rose Plot new simulation 
plot( filtered.brownian.tracks[1:10], main = "Simulated random walk\n (N=10)" )

# 
msd.brownian <- aggregate( filtered.brownian.tracks, squareDisplacement, FUN = "mean.se" )
msd.brownian$Probe <- "brownian"
msd.brownian$dt <- msd.brownian$i * timeStep( filtered.brownian.tracks )

######## Plot new simulation
ggplot( msd.brownian, aes( x = dt , 
                           y = mean, 
                           color = Probe, 
                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, ymax = upper) , alpha = 0.2 , color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"????? (????)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("Random walk with 26p parameters 10% FBS")

# par(mfrow=c(1,2))
# Plot new simulation versus real data
### compare two msd plots
msddata_brownian2 <- rbind( t_26p_C10.msd, msd.brownian )

# Plot
MSDplot_brownian2 <- ggplot( msddata_brownian2, aes( x = dt , 
                                                     y = mean, 
                                                     color = Probe, 
                                                     fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("26p_C10 and random walk")

MSDplot_brownian2

# Compare 26p and RW
msddata_26p_brownian <- rbind( t_26p_C10.msd, t_26p_L10.msd, t_26p_Y10.msd, msd.brownian )
head(msddata_26p_brownian)

# Plot
MSDplot_26p_brownian <- ggplot( msddata_26p_brownian, aes( x = dt , 
                                                           y = mean, 
                                                           color = Probe, 
                                                           fill = Probe ) ) +
  geom_ribbon( aes( ymin = lower, 
                    ymax = upper), 
               alpha = 0.2, 
               color=NA ) +
  geom_line( ) +
  labs( x = expression( paste(Delta,"t (hours)") ),
        y = "MSD") +
  theme_classic() + 
  ggtitle("26p and random walk 10% FBS")


MSDplot_26p_brownian
######################
###########
######
###
#


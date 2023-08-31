# Set names
alltracks <- setNames(data.frame(matrix(ncol = 15, nrow = 0)), mynames)

#alltracks_p26C <- setNames(data.frame(matrix(ncol = 15, nrow = 0)), mynames)
#alltracks_p26L <- setNames(data.frame(matrix(ncol = 15, nrow = 0)), mynames)
#alltracks_p26Y <- setNames(data.frame(matrix(ncol = 15, nrow = 0)), mynames)


#alltracks_p26C$probe <- as.character(alltracks_p26C$probe)
#alltracks_p26L$probe <- as.character(alltracks_p26L$probe)
#alltracks_p26Y$probe <- as.character(alltracks_p26Y$probe)

alltracks$probe <- as.character(alltracks$probe)

#tracks <- alltracks
tracks_p26C <- alltracks # 
tracks_p26L <- alltracks # 
tracks_p26Y <- alltracks # 



#################################################
# Choose dir function for mac <<<<<<<<<<<<<<<<<<
#choose.dir <- function() {
# system("osascript -e 'tell app \"R\" to POSIX path of (choose folder with prompt \"Choose Folder:\")' > /tmp/R_folder",
# intern = FALSE, ignore.stderr = TRUE)
# p <- system("cat /tmp/R_folder && rm -f /tmp/R_folder", intern = TRUE)
# return(ifelse(length(p), p, NA))
#}






rm(choose.dir)



##### Tracks importing from local dirs ##########
#################################################
# Choose dir ---------
file_list_p26C <- list.files(path = , choose.dir(),
                             pattern = "csv",
                             all.files = FALSE,
                             full.names = TRUE, recursive = TRUE,
                             ignore.case = FALSE, include.dirs = FALSE,
                             no.. = FALSE)

file_list_p26L <- list.files(path = , choose.dir(),
                             pattern = "csv",
                             all.files = FALSE,
                             full.names = TRUE, recursive = TRUE,
                             ignore.case = FALSE, include.dirs = FALSE,
                             no.. = FALSE)

file_list_p26Y <- list.files(path = , choose.dir(),
                             pattern = "csv",
                             all.files = FALSE,
                             full.names = TRUE, recursive = TRUE,
                             ignore.case = FALSE, include.dirs = FALSE,
                             no.. = FALSE)


#################################################
############# Call to function ##################
#################################################

# Start scan for Control
for (file_name in file_list_p26C) {
  tracks_p26C <- rbind(tracks_p26C, 
                       traj_analysis_p26C(file_name))}


# Start scan for LPA
for (file_name in file_list_p26L) {
  tracks_p26L <- rbind(tracks_p26L, 
                       traj_analysis_p26L(file_name))}


# Start scan for Y27632
for (file_name in file_list_p26Y) {
  tracks_p26Y <- rbind(tracks_p26Y, 
                       traj_analysis_p26Y(file_name))}



#################################################
############# Prepare data ######################
#################################################
# Merge all tracks-----------------------
alltracks <- rbind(tracks_p26C, tracks_p26L, tracks_p26Y) # collect all tracks





# Set time to hours, remove tracks and mean_angle columns
all.h <- alltracks
head(all.h)
data <- cbind(all.h[,c(6,7,8,9)]*3600, all.h[,c(2,3,4,5,10,11,12,13,15)])
data$time <- "24h"
data$cellLine <- "FetMSC"
head(data)
tail(data)

write.csv(data, file = 'data.csv')
write.xlsx(data, file = 'data26_serum10.xlsx')

# Set names
mynames <- c("track",
             "length",
             "distance",
             "straight",
             "square_displacement",
             "mean_speed",
             "sd_speed",
             "max_speed",
             "min_speed",
             "sinuosity",
             "emax",
             "DC",
             "SDDC",
             "mean_angle",
             "probe")
# set constants
hundred = 100


#######################################
# p12
traj_analysis_p12C <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p12C'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p12C.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p12L <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p12L'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p12L.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p12Y <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p12Y'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p12Y.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p6Z <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p6Z'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p6Z.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p6D <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p6D'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p6D.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p6_10 <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p6_10'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p6_10.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok




# p16
traj_analysis_p16C <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p16C'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p16C.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok

traj_analysis_p16L <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p16L'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p16L.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok

traj_analysis_p16Y <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p16Y'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p16Y.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok

traj_analysis_p15Z <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/23.75) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p15Z'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p15Z.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok

traj_analysis_p15D <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/23.75) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p15D'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p15D.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok

traj_analysis_p15_10 <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 95/3600/23.75) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p15_10'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p15_10.csv')
  #tracks <<- traj_params
  return(traj_params) } # 96 frames ok



# p20
traj_analysis_p20C <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p20C'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p20C.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p20L <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p20L'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p20L.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p20Y <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p20Y'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p20Y.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok


# p26
traj_analysis_p26C <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p26C'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p26C.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p26L <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p26L'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p26L.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok

traj_analysis_p26Y <- function(input) {
  
  data <- read.csv(input,  skip = 1, header = FALSE)
  
  traj_params <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                          c("track",
                            "length",
                            "distance",
                            "straight",
                            "square_displacement",
                            "mean_speed",
                            "sd_speed",
                            "max_speed",
                            "min_speed",
                            "sinuosity",
                            "emax",
                            "DC",
                            "SDDC",
                            "mean_angle",
                            "probe"))
  
  traj_params$probe <- as.character(traj_params$probe)
  
  for (i in unique(data$V1)) {
    
    # Define x, y, and time coordinates
    coords <- data.frame(x = data$V3[data$V1 == i],
                         y = data$V4[data$V1 == i],
                         # times = c(1:96))
                         timeCol = data$V2[data$V1 == i],
                         spatialUnits = "pixels", timeUnits = "hours")
    
    trj <- TrajFromCoords(coords, spatialUnits = "pixels", timeUnits = "seconds", fps = 96/3600/24) #fps frames/3600/hours = 1/120
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    # A 0.6579 object had length 1 pixels in the video, scale to micrometres
    trj <- TrajScale(trj, 0.6525 / 1, "micrometer") # 7.5 px = 10 microns
    TrajGetUnits(trj) # Returns the spatial units of a trajectory
    TrajGetTimeUnits(trj)	#Returns the temporal units of a trajectory
    TrajStepLengths(trj)	#Returns the lengths of each step within the trajectory
    # Rediscretization
    # The function TrajResampleTime linearly interpolates points along a trajectory
    # to create a new trajectory with fixed step time intervals.
    # trj <- TrajResampleTime(trj, 901)
    TrajDuration(trj) # Returns the temporal duration of the trajectory (or a portion)
    TrajGetFPS(trj)
    par(mar=c(5,5,5,5))
    # Plot it
    plot(trj, lwd = 2)
    points(trj, draw.start.pt = FALSE, pch = 21, col = "black", cex = 1.2)
    # Trajectory analysis
    # The TrajDerivatives function calculates linear speed and acceleration along a Trajectory
    derivs <- TrajDerivatives(trj)
    
    traj_params <- add_row(traj_params,
                           track = i,
                           # total length of the trajectory
                           length = TrajLength(trj),
                           # straight-line distance from the start to the end of the trajectory
                           distance = TrajDistance(trj),
                           # Straightness index
                           straight = TrajStraightness(trj), # D/L ratio
                           # expected square displacement of a correlated random walk
                           square_displacement = TrajExpectedSquareDisplacement(trj),
                           # Measures of speed
                           mean_speed = mean(derivs$speed),
                           sd_speed = sd(derivs$speed),
                           max_speed = max(derivs$speed),
                           min_speed = min(derivs$speed),
                           # Measures of straightness
                           sinuosity = TrajSinuosity2(trj),
                           emax = TrajEmax(trj),
                           SDDC  =  sd(TrajDirectionalChange(trj)),
                           DC = mean(TrajDirectionalChange(trj)),
                           #mean_angle = TrajMeanVectorOfTurningAngles(trj),
                           mean_angle = 0,
                           probe = 'p26Y'
                           #probe = 1
    )
    
    head(traj_params)
    
  }
  
  # print(traj_params)
  write.csv(traj_params, file = 'traj_p26Y.csv')
  #tracks <<- traj_params
  return(traj_params) } # 97 frames ok







#rm(traj_analysis_p20)
#######################################




###################################
# Remove outliers function------
###
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
###########################

# Function to calculate the mean and the standard deviation
# for each group
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
#############################
# Remove NAs
#tracks_15p_C <- tracks_15p_C[complete.cases(tracks_15p_C), ]
#data <- read.csv(input, check.names = F)


# Function to remove all data after given timepoint
# x must be a single track matrix, which is what this function will
# receive from lapply
removeAfterT <- function( x, time.cutoff ){
  
  # Filter out later timepoints
  x2 <- x[ x[,"t"] <= time.cutoff, ]
  
  # Return the new matrix, or NULL if there are no timepoints before the cutoff
  if( nrow(x2) == 0 ){
    return(NULL)
  } else {
    return(x2)
  }
}



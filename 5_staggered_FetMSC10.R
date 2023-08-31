#
#
# STAGGERED analysis
#
# compute metrics on all possible subtracks in a single track
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))

# plot for one track _12p10
filled.contour( applyStaggered( t_12p_C10[[2]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_12p_L10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_12p_Y10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# plot for one track _16p10
filled.contour( applyStaggered( t_16p_C10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_16p_L10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_16p_Y10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# plot for one track _20p10
filled.contour( applyStaggered( t_20p_C10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_20p_L10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_20p_Y10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)
# plot for one track _26p10
filled.contour( applyStaggered( t_26p_C10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_26p_L10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_26p_Y10[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)


#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_C10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_C10)) {
  stag_12p_C10 <- stag_12p_C10 + applyStaggered( t_12p_C10[[i]], speed, matrix = TRUE )
}
mean_stag_12p_C10 <- stag_12p_C10 / length(t_12p_C10)

filled.contour( mean_stag_12p_C10,
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_L10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_L10)) {
  stag_12p_L <- stag_12p_L10 + applyStaggered( t_12p_L10[[i]], speed, matrix = TRUE )
}
mean_stag_12p_L10 <- stag_12p_L10 / length(t_12p_L10)

filled.contour( mean_stag_12p_L10,
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_Y10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_Y10)) {
  stag_12p_Y10 <- stag_12p_Y + applyStaggered( t_12p_Y10[[i]], speed, matrix = TRUE )
}
mean_stag_12p_Y10 <- stag_12p_Y10 / length(t_12p_Y10)

filled.contour( mean_stag_12p_Y10,
                plot.title = title(main = "FetMSC, pas. 12, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)


#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_C10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_C10)) {
  stag_16p_C10 <- stag_16p_C10 + applyStaggered( t_16p_C10[[i]], speed, matrix = TRUE )
}
mean_stag_16p_C10 <- stag_16p_C10 / length(t_16p_C10)

filled.contour( mean_stag_16p_C10,
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_L10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_L10)) {
  stag_16p_L10 <- stag_16p_L10 + applyStaggered( t_16p_L10[[i]], speed, matrix = TRUE )
}
mean_stag_16p_L10 <- stag_16p_L10 / length(t_16p_L10)

filled.contour( mean_stag_16p_L10,
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)


#
## average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_Y10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_Y10)) {
  stag_16p_Y10 <- stag_16p_Y10 + applyStaggered( t_16p_Y10[[i]], speed, matrix = TRUE )
}
mean_stag_16p_Y10 <- stag_16p_Y10 / length(t_16p_Y10)

filled.contour( mean_stag_16p_Y10,
                plot.title = title(main = "FetMSC, pas. 16, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)
##
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_C10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_C10)) {
  stag_20p_C10 <- stag_20p_C10 + applyStaggered( t_20p_C10[[i]], speed, matrix = TRUE )
}
mean_stag_20p_C10 <- stag_20p_C10 / length(t_20p_C10)

filled.contour( mean_stag_20p_C10,
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_L10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_L10)) {
  stag_20p_L10 <- stag_20p_L10 + applyStaggered( t_20p_L10[[i]], speed, matrix = TRUE )
}
mean_stag_20p_L10 <- stag_20p_L10 / length(t_20p_L10)

filled.contour( mean_stag_20p_L10,
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_Y10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_Y10)) {
  stag_20p_Y10 <- stag_20p_Y10 + applyStaggered( t_20p_Y10[[i]], speed, matrix = TRUE )
}
mean_stag_20p_Y10 <- stag_20p_Y10 / length(t_20p_Y10)

filled.contour( mean_stag_20p_Y10,
                plot.title = title(main = "FetMSC, pas. 20, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_C10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_C10)) {
  stag_26p_C10 <- stag_26p_C10 + applyStaggered( t_26p_C10[[i]], speed, matrix = TRUE )
}
mean_stag_26p_C10 <- stag_26p_C10 / length(t_26p_C10)

filled.contour( mean_stag_26p_C10,
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_L10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_L10)) {
  stag_26p_L10 <- stag_26p_L10 + applyStaggered( t_26p_L10[[i]], speed, matrix = TRUE )
}
mean_stag_26p_L10 <- stag_26p_L10 / length(t_26p_L10)

filled.contour( mean_stag_26p_L10,
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_Y10 <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_Y10)) {
  stag_26p_Y10 <- stag_26p_Y10 + applyStaggered( t_26p_Y10[[i]], speed, matrix = TRUE )
}
mean_stag_26p_Y10 <- stag_26p_Y10 / length(t_26p_Y10)

filled.contour( mean_stag_26p_Y10,
                plot.title = title(main = "FetMSC, pas. 26, 10% FBS\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)








# Measure code running time
#system.time({ for (i in 1:length(t_16p_C10)) {
# stag_16p_C <- stag_16p_C + applyStaggered( t_16p_C10[[i]], speed, matrix = TRUE )
#} })
#
# 
# Set Color Palettes
#library("viridis") # viridis(n), magma(n), inferno(n), plasma(n)
#library("ggsci") # pal_npg(), pal_aaas(), pal_lancet(), pal_jco()
#palette <- colorRampPalette(c("darkblue", "blue", "lightblue1",
#                              "green", "yellow", "red", "darkred"))
#palette <- colorRampPalette(c('darkred','red','blue','lightblue'))
#palette <- colorRampPalette(c("blue","yellow","red"))
#palette <- function(n) hcl.colors(n, "YlOrRd", rev = TRUE)
#palette <- viridis(35)
#cols = palette
#cols = plasma(24)

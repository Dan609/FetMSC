#
#
# STAGGERED analysis
#
# compute metrics on all possible subtracks in a single track
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))

# plot for one track _12p
filled.contour( applyStaggered( t_12p_C[[2]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_12p_L[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_12p_Y[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 12\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# plot for one track _16p
filled.contour( applyStaggered( t_16p_C[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_16p_L[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_16p_Y[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 16\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# plot for one track _20p
filled.contour( applyStaggered( t_20p_C[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_20p_L[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_20p_Y[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 20\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)
# plot for one track _26p
filled.contour( applyStaggered( t_26p_C[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_26p_L[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

filled.contour( applyStaggered( t_26p_Y[[15]], speed, matrix = TRUE ),
                plot.title = title(main = "FetMSC, pas. 26\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)


#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_C <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_C)) {
  stag_12p_C <- stag_12p_C + applyStaggered( t_12p_C[[i]], speed, matrix = TRUE )
}
mean_stag_12p_C <- stag_12p_C / length(t_12p_C)

filled.contour( mean_stag_12p_C,
                plot.title = title(main = "FetMSC, pas. 12\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_L <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_L)) {
  stag_12p_L <- stag_12p_L + applyStaggered( t_12p_L[[i]], speed, matrix = TRUE )
}
mean_stag_12p_L <- stag_12p_L / length(t_12p_L)

filled.contour( mean_stag_12p_L,
                plot.title = title(main = "FetMSC, pas. 12\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_12p_Y <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_12p_Y)) {
  stag_12p_Y <- stag_12p_Y + applyStaggered( t_12p_Y[[i]], speed, matrix = TRUE )
}
mean_stag_12p_Y <- stag_12p_Y / length(t_12p_Y)

filled.contour( mean_stag_12p_Y,
                plot.title = title(main = "FetMSC, pas. 12\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)


#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_C <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_C)) {
  stag_16p_C <- stag_16p_C + applyStaggered( t_16p_C[[i]], speed, matrix = TRUE )
}
mean_stag_16p_C <- stag_16p_C / length(t_16p_C)

filled.contour( mean_stag_16p_C,
                plot.title = title(main = "FetMSC, pas. 16\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_L <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_L)) {
  stag_16p_L <- stag_16p_L + applyStaggered( t_16p_L[[i]], speed, matrix = TRUE )
}
mean_stag_16p_L <- stag_16p_L / length(t_16p_L)

filled.contour( mean_stag_16p_L,
                plot.title = title(main = "FetMSC, pas. 16\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_16p_Y <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_16p_Y)) {
  stag_16p_Y <- stag_16p_Y + applyStaggered( t_16p_Y[[i]], speed, matrix = TRUE )
}
mean_stag_16p_Y <- stag_16p_Y / length(t_16p_Y)

filled.contour( mean_stag_16p_Y,
                plot.title = title(main = "FetMSC, pas. 16\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_C <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_C)) {
  stag_20p_C <- stag_20p_C + applyStaggered( t_20p_C[[i]], speed, matrix = TRUE )
}
mean_stag_20p_C <- stag_20p_C / length(t_20p_C)

filled.contour( mean_stag_20p_C,
                plot.title = title(main = "FetMSC, pas. 20\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_L <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_L)) {
  stag_20p_L <- stag_20p_L + applyStaggered( t_20p_L[[i]], speed, matrix = TRUE )
}
mean_stag_20p_L <- stag_20p_L / length(t_20p_L)

filled.contour( mean_stag_20p_L,
                plot.title = title(main = "FetMSC, pas. 20\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_20p_Y <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_20p_Y)) {
  stag_20p_Y <- stag_20p_Y + applyStaggered( t_20p_Y[[i]], speed, matrix = TRUE )
}
mean_stag_20p_Y <- stag_20p_Y / length(t_20p_Y)

filled.contour( mean_stag_20p_Y,
                plot.title = title(main = "FetMSC, pas. 20\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

#
# MEAN STAGGERED
#
# compute metrics on all possible subtracks in a track
# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_C <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_C)) {
  stag_26p_C <- stag_26p_C + applyStaggered( t_26p_C[[i]], speed, matrix = TRUE )
}
mean_stag_26p_C <- stag_26p_C / length(t_26p_C)

filled.contour( mean_stag_26p_C,
                plot.title = title(main = "FetMSC, pas. 26\nControl, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_L <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_L)) {
  stag_26p_L <- stag_26p_L + applyStaggered( t_26p_L[[i]], speed, matrix = TRUE )
}
mean_stag_26p_L <- stag_26p_L / length(t_26p_L)

filled.contour( mean_stag_26p_L,
                plot.title = title(main = "FetMSC, pas. 26\nLPA, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)

# average step matrices (time consuming)
cols = rev(colorRampPalette(c('darkred','red','blue','lightblue'))(30))
stag_26p_Y <- matrix( rep( 0, len=9409), nrow = 97)
for (i in 1:length(t_26p_Y)) {
  stag_26p_Y <- stag_26p_Y + applyStaggered( t_26p_Y[[i]], speed, matrix = TRUE )
}
mean_stag_26p_Y <- stag_26p_Y / length(t_26p_Y)

filled.contour( mean_stag_26p_Y,
                plot.title = title(main = "FetMSC, pas. 26\nY27632, 24h"),
                #xlab = "X",ylab = "Y"),
                key.title = title(main="Speed\n(μm/h)"),
                col = cols)#,nlevels = 25)








# Measure code running time
#system.time({ for (i in 1:length(t_16p_C)) {
 # stag_16p_C <- stag_16p_C + applyStaggered( t_16p_C[[i]], speed, matrix = TRUE )
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

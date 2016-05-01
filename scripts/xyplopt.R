x = rnorm(100)

y = rnorm(100)

webdir = Sys.getenv(‘R_WEB_DIR’)

filename = paste(webdir, ’/xyplot.png’, sep=“)

png(filename)

plot(x, y)

dev.off()

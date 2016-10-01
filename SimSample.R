# function simsample

simsample = function(mean = 10, stdev = 1, maxsize = 20, reps = 10){
	index = 0
	x = rep(1:maxsize, times = reps)
	y = c(1:maxsize*reps)
	for (i in 1:reps){
		for (j in 1:maxsize){
			index = index + 1
			y[index] = mean(rnorm(j, mean, stdev))
		}
	}
	plot(x, y, pch = 19, col = "blue", cex = 0.5, ylim = c(mean - 3 * stdev, mean + 3 * stdev), ylab = "mean", xlab = "sample size")
	abline(h = mean, col = "green", lwd = 2)
	abline(h = mean + qnorm(0.25) * stdev, lty = 2, col = "red", lwd = 2)
	abline(h = mean - qnorm(0.25) * stdev, lty = 2, col = "red", lwd = 2)
	out = list("samplesize" = x, "average" = y)
	invisible(out)
}
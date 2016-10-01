shadeArea = function(data, lowlim, uplim, ...){
  avg = mean(data)
  stddev = sd(data)
  # set the lower and upper boundaries for plotting along the x-axis
  lower = avg - 4 * stddev
  upper = avg + 4 * stddev
  # create 101 points along the x-axis distributed equally between the lower 
  # and the upper boundaries
  x = seq(lower, upper, (upper - lower)/100)
  # plot the normal distribution curve
  plot(x,dnorm(x, mean = avg,sd = stddev), 
       type = "l", bty = "n", xaxs = "i", yaxs = "i", yaxt = "n", ...)
  # set size of polygons and plot polygons
  dx = seq(lowlim, uplim, 0.01)
  polygon(c(lowlim, dx, uplim), 
          c(0, dnorm(dx, avg, stddev), 0), 
          border = NA, col = "blue")
}
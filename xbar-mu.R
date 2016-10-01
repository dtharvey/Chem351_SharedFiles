xbar_mu = function(dataset, truemean = 0, ha = "two.sided", alpha = 0.05, ...) {
  #run the t.test given options
  out = t.test(dataset, mu = truemean, alternative = ha, conf.level = 1 - alpha)
  # plot sample's density function using experimental mean and std error of the mean
  avg = mean(dataset)
  stddev = sd(dataset)/sqrt(length(dataset))
  lower = avg - 8 * stddev
  upper = avg + 8 * stddev
  # lowlim = qnorm(alpha/2, avg, stddev)
  # uplim = qnorm(1 - alpha/2, avg, stddev)
  x = seq(lower, upper, (upper - lower)/1000)
  plot(x,dnorm(x, mean = avg, sd = stddev), 
       type = "n", bty = "n", xaxs = "i", yaxs = "i", yaxt = "n", ylab = "density", ...)
  # shade area where null hypothesis is retained
  if (ha == "two.sided") {
    lowlim = qnorm(alpha/2, avg, stddev)
    uplim = qnorm(1 - alpha/2, avg, stddev)
  } else if (ha == "greater") {
    lowlim = qnorm(alpha, avg, stddev)
    uplim = upper
  } else if (ha == "less") {
    lowlim = lower
    uplim = qnorm(1 - alpha, avg, stddev)
  }
  dx = seq(lowlim, uplim, 0.001)
  polygon(c(lowlim, dx, uplim), 
          c(0, dnorm(dx, avg, stddev), 0), 
          border = NA, col = "skyblue")
  # annotate the plot
  ymax = max(dnorm(x, mean = avg, sd = stddev))
  lines(x,dnorm(x, mean = avg, sd = stddev), lwd = 3)
  abline(v = truemean, lwd = 2, lty = 2, col = "red")
  title(main = paste0("t = ", round(out$statistic, 3), ", df = ", out$parameter, ", p-value = ", round(out$p.value, 3)))
  # text(x = truemean, y = 0.8 * ymax, pos = 4, labels = "µ", col = "red")
}



  
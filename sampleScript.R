x1 = runif(1000)
x2 = runif(1000)
y1 = rnorm(1000)
y2 = rnorm(1000)
old.par = par(mfrow = c(2,2))
plot(x1, x2)
plot(y1, y2)
plot(x1, y1)
plot(x2, y2)
par(old.par)
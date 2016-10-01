# examine help file for functions related to normal distributions

help(Normal)

# each function takes the mean and the standard deviation as arguments, with
# default value of 0 and 1, respectively; lower.tail is a logical argument that
# specifies if we are interested in values below a stated value (the default) or
# above the stated value

# rnorm: returns vector of n random samples drawn from a normal distribution

# dnorm: returns value of f(x), the probability or density, for normal distribution

# prorm: returns probability of a result ≤ x if lower.tail = TRUE; returns
# probability of a result > x is lower.tail = FALSE

# qnorm: returns value of x for which the range -inf to x has the probability p

# create a sample of normally distributed data and examine the sample

d = rnorm(n = 1000, mean = 0, sd = 1)

plot(d)

mean(d)

sd(d)

boxplot(d, horizontal = TRUE, ylim = c(-4, 4))

rug(d)

hist(d, freq = FALSE, xlim = c(-4,4), ylim = c(0, 0.5))

rug(d)

# dnorm

xaxis = seq(-4, 4, 0.1)

plot(x = xaxis, y = dnorm(xaxis), type = "l", lwd = 2, col = "blue", ylim = c(0, 0.5))

hist(d, freq = FALSE, xlim = c(-4,4), ylim = c(0, 0.5))

rug(d)

lines(x = xaxis, y = dnorm(xaxis), lwd = 2, col = "blue")

# pnorm

plot(x = xaxis, y = pnorm(xaxis), type = "l", lwd = 2, col = "blue")

lines(xaxis, pnorm(xaxis, lower.tail = FALSE), lwd = 2, col = "red")

pnorm(c(-4:4))

pnorm(c(-4:4), lower.tail = FALSE)

prob = seq(0, 1, 0.01)

# qnorm

plot(prob, qnorm(prob), type = "l", lwd = 2, col = "blue")

grid(col = "red", lty = 2)

qqnorm(d, pch = 19, col = "blue")

qqline(d, lwd = 2)

load("Distributions.RData")

hist(normal)

qqnorm(normal)

qqline(normal)

hist (leftskew)

qqnorm(leftskew)

qqline(leftskew)

hist(rightskew)

qqnorm(rightskew)

qqline(rightskew)

# solutions to SPS02

load("MM.RData")

yellow = MMdata$yellow

yellow

qqnorm(yellow, pch = 19, col = "gold")

qqline(yellow, lwd = 2)

# probability between 16 and 23

source("shadeArea.R")

shadeArea(yellow, 16, 23, xlab = "number of yellow M&Ms", ylab = "probability")

pnorm(16, mean(yellow), sd(yellow), lower.tail = FALSE) - pnorm(23, mean(yellow), sd(yellow), lower.tail = FALSE)

# probability greater than 17

shadeArea(yellow, 17, 35, xlab = "number of yellow M&Ms", ylab = "probability")

pnorm(17, mean(yellow), sd(yellow), lower.tail = FALSE)

# probability less than 13

shadeArea(yellow, 0, 13, xlab = "number of yellow M&Ms", ylab = "probability")

pnorm(13, mean(yellow), sd(yellow))


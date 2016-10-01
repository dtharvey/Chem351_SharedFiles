# Using R for Confidence Intervals and Signficance Tests

help(TDist)

help(t.test)

help(var.test)

# signficance test of sample's mean to a theoretical mean

# SPS03.1 (H0: xbar = mu; HA: xbar ≠ mu; two-tailed test; alpa = 0.05)

texp = (0.513 - 0.520)*sqrt(3)/0.0500; texp
  
tcrit = qt(0.05/2, 2, lower.tail = TRUE); tcrit

tcrit = qt(0.05/2, 2, lower.tail = FALSE); tcrit

# SPS03.2 (H0: xbar = mu; HA: xbar > mu; one-tailed test; alpha = 0.05)

nitrate = c(51.0, 51.3, 51.6, 50.9)

t.test(nitrate, mu = 50.0, alternative = "greater", conf.level = 0.95)

texp = (mean(nitrate) - 50.0)*sqrt(4)/sd(nitrate); texp

tcrit = qt(0.05, 3, lower.tail = FALSE); tcrit

source("xbar-mu.R")

xbar_mu(nitrate, truemean = 50.0, ha = "greater", alpha = 0.05, xlab = "ppm nitrate")

## significance tests for unpaired data

# SPS03.3 (H0: xbar1 = xbar2; HA: xbar1 ≠ xbar2; two-tailed test; alpah = 0.05)

lab1 = c(0.470, 0.448, 0.463, 0.449, 0.482, 0.454, 0.477, 0.409)

lab2 = c(0.529, 0.490, 0.489, 0.521, 0.486, 0.502)

mean(lab1); sd(lab1)

mean(lab2); sd(lab2)

var.test(lab1, lab2, ratio = 1, alternative = "two.sided", conf.level = 0.95)

t.test(lab1, lab2, mu = 0, alternative = "two.sided", paired = FALSE, var.equal = TRUE, conf.level = 0.95)

# significance tests for paired data (data from last class)

a.w = c(0.430, 0.266, 0.457, 0.531, 0.707, 0.716)

s.w = c(0.415, 0.238, 0.390, 0.410, 0.605, 0.609)

t.test(a.w, s.w, mu = 0, alternative = "two.sided", paired = TRUE)

t.test(a.w - s.w, mu = 0, alternative = "two.sided")

xbar_mu(a.w - s.w)

# testing sample variance and population variance

# AC2.1 Ex4.17 (H0: equal; HA: not equal; two-tailed; alpha = 0.05)

aspirin = c(254, 249, 252, 252, 249, 249, 250, 247, 251, 252)

popvar = 25

samvar = var(aspirin); samvar

Fexp = popvar/samvar; Fexp

Fcrit = qf(0.05/2, Inf, 9, lower.tail = FALSE); Fcrit

# non-parametric tests for means (no assumption about underlying distribution)

help(wilcox.test)

analyte = c(104, 79, 98, 150, 87, 136, 101); analyte

wilcox.test(analyte, mu = 95)

s1 = c(9.8, 10.2, 10.7, 9.5, 10.5); s1

s2 = c(7.7, 9.7, 8.0, 9.9, 9.0); s2

wilcox.test(s1, s2, alternative = "two.sided", conf.level = 0.95)

# tests for outliers (need to install the outliers package)

library(outliers)

help(dixon.test)

penny = round(c(rnorm(9, 2.5, 0.04), 3.11), digits = 3); penny

dixon.test(penny, two.sided = FALSE)

help(grubbs.test) # based on relative error: Gexp = (outlier - mean)/sd

grubbs.test(penny)

# Using R for an Analysis of Variance

help(aov)

# forming data frames for an analysis of variance

tab.a = c(5.67, 5.67, 5.55, 5.57)

tab.b = c(5.75, 5.47, 5.43, 5.45)

tab.c = c(4.74, 4.45, 4.65, 4.94)

tablets = data.frame(tab.a, tab.b, tab.c); tablets

# still not the right format

help(stack)

tabs = stack(tablets); tabs

unstack(tabs)

names(tabs)

names(tabs) = c("conc.fe", "tab.id")

tabs

# other ways to stack

fe = c(tab.a, tab.b, tab.c); fe

id = c(rep("tab.a", times = length(tab.a)), rep("tab.b", times = length(tab.b)), rep("tab.c", times = length(tab.c))); id

tabs.2 = data.frame(fe, id); tabs.2

tab.d = c(5.67, 5.67, 5.55, 5.57, 5.65)

tab.e = c(5.75, 5.47, 5.43, 5.45)

tab.f = c(4.74, 4.45, 4.65, 4.94)

tab.e[5] = NA; tab.e

tab.f[5] = NA; tab.f

tabs.3 = data.frame(tab.d, tab.e, tab.f); tabs.3

tabs.4 = stack(tabs.3); tabs.4

tabs.4 = na.omit(tabs.4); tabs.4

# writing formulas

help(formula)

boxplot(tablets)

boxplot(conc.fe ~ tab.id, data = tabs, col = c("blue", "green", "red"))

tabs.out = aov(conc.fe ~ tab.id, data = tabs)

summary(tabs.out)

# evaluating source of difference

help(TukeyHSD)

TukeyHSD(tabs.out, conf.level = 0.95)

tabs.hsd = TukeyHSD(tabs.out, conf.level = 0.95)

plot(tabs.hsd)

# let's pretty this up a bit

old.par = par(mar = c(5, 8, 4, 2))   # gives margin bottom, left, top, right

plot(tabs.hsd, las = 1)   # all axis labels horizontal

par(old.par)

# anova with two independent variables

tablets

acid = rep(c("HCl", "HCl", "HNO3", "HNO3"), times = 3)

tabsnew = data.frame(tabs, acid); tabsnew

tabsnew.out = aov(conc.fe ~ tab.id * acid, data = tabsnew)

summary(tabsnew.out)

tabsnew.hsd = TukeyHSD(tabsnew.out, conf.level = 0.95); tabsnew.hsd

old.par = par(mar = c(5, 12, 4, 2))   # gives margin bottom, left, top, right

plot(tabsnew.hsd, las = 1)   # all axis labels horizontal

par(old.par)


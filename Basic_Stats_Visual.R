# first we load the file MM.RData and examine its structure...

str(MMdata)

# ... and extract the data for yellow M&Ms so that it easier to work with

yellow = MMdata$yellow

yellow

# BASIC DESCRIPTIVE STATISTICS

# to find the mean and the median, we use mean() and median()

mean(yellow)
median(yellow)

# to find the variance and the standard deviation, we use var() and sd()

var(yellow)
sd(yellow)

# or we can take the square root of the variance; note that we can nest one command inside of another

sqrt(var(yellow))

# to find the IQR, we use IQR()

IQR(yellow)

# ...but wait, this does not agree with the value of 4 given in SPS01; this is because R uses a different algorithm to find the IQR than did we, which we can see if we use summary()

summary(yellow)

# where we see that it returns the same result for F_L (identified here as 1st Qu.) but a different result for F_U (identified here 3rd Qu.)

# let's source the script file iqr.R, which defines a function to calculate IQR as we defined it in class, and then examine the script to see how it works

source(file.choose())

iqr

# okay...now back to the main event

iqr(yellow)

# and now we have agreement

# to find the MAD, we use mad()

mad(yellow)

#...but wait, this does not match the value of 2 given in SPS01; here the problem is that we did not account for the default inputs to mad() because we were not aware of them; let's look at the help file for mad()...

help(mad)

#...which tells us that the command has six inputs, five of which have default values that are used if we do not specify them when we enter the command:

# x: our data in the form of a vector

# center: defines the value for which we calculate individual deviations; note that it defaults to the median so we did not need to change its value

# constant: a scaling factor; the reason for the default value of 1.4826 is not clear from the help file, but setting the constant to 1 will solve our problem

# na.rm: a logical value on whether to exclude missing (NA) values; the default of FALSE returns an error if a value is missing on the assumption that we forgot to enter it (we would have set this to TRUE if we knew we had missing values)

# low and high: these provide alternative ways to calculate the median, but defaults to FALSE, which is the median as we have defined it

# trying again using a constant of 1

mad(yellow, constant = 1)

# gives us the correct value

# VISUALIZING DATA

# a good first step is to examine the data in a table that shows the frequency of each unique result; we can accomplish this using the table() command

table(yellow)

# R has a command for stem-and-leaf diagrams, which is stem(), which runs in the console

stem(yellow)

#  the result is hard to interpret because it groups the unique results into pairs; thus, the entry 4|0 is really 4|nothing and 5|0 combined: when in doubt, look at the help file

help(stem)

# which shows us that we can use the scale argument to expand the stems

stem(yellow, scale = 2)

# R's stem() command does not use the plot window, but we can use its stripchart() command to make something similar to a stem-and-leaf diagram

stripchart(yellow)

# this seems to have too few points (14), but this is the number of unique results; clearly points for samples with the same number of yellow M&Ms are overlayed on each other; let's look at the help file

help(stripchart)

# the method argument shows us that the default option is to overlay points; let's use the stack option and change the offset to 1

stripchart(yellow, method = "stack", offset = 1)

# there are lots of other arguments here that we can use to control the symbol used to plot points (pch), the color of the points (col), and to add labels to the x-axis (xlab) and the y-axis (ylab), and to set limits for the x-axis (xlim) and the y-axis (ylim); let's change the symbol, add some color, add labels to the axes, and extend the x-axis limits from 0 to 25

stripchart(yellow, method = "stack", offset = 1, pch = 19, col = "gold", xlab = "number of yellow M&Ms in a bag", ylab = "frequency", xlim = c(0, 25))

# to plot a histogram we use the hist() command

hist(yellow)

# let's look at the options for hist()

help(hist)

# and try setting the limits on the bins using break, adding some color, and altering the main label and the x-axis label; we will also assign it to an object so we can retrieve the returned values

hist.out = hist(yellow, breaks = c(4.5, 7.5, 10.5, 13.5, 16.5, 19.5, 22.5, 25.5), col = "yellow", main = "histogram of yellow M&Ms", xlab = "number of yellow M&Ms in a bag")

hist.out

# now, let's create a boxplot

boxplot(yellow)

# let's look at the options for boxplot()

help(boxplot)

# note that we can show multiple boxplots at once by listing multiple objects

boxplot(yellow, MMdata$blue, MMdata$brown)

# ...but, the default labels are not helpful; the help file suggests we can pass a vector of names

boxplot(yellow, MMdata$blue, MMdata$brown, names = c("yellow", "blue", "brown"))

# we also can pass the relevant columns from a data.frame and it will use the column names to label the plot

boxplot(MMdata[ , 3:8])

# let's pretty it up a bit and assign it to an object so we can view the returned values

b.p = boxplot(MMdata[ , 3:8], col = c("blue", "brown", "green", "orange", "red", "yellow"), main = "boxplots by color for 1.69-oz bags of M&Ms", ylab = "number of M&Ms")

b.p

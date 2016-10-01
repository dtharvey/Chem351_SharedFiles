# this is a comment; it is ignored by R

# the symbol > in the console is the command prompt; this is where you enter a command that you want R to execute

1 + 3

# we can assign the result of a calculation to an object by assigning the object a name

answer = 1 + 3

Answer = 2 + 4

answer

Answer

# a vector is an object that contains an ordered collection of elements all of the same type

v00 = c(1.1, 2.2, 3.3)

v01 = c(1, 2, 3) 

v02 = c(TRUE, TRUE, FALSE)

v03 = c("alpha", "bravo", "charley")

v03[3] = "charlie"

v00[4] = 4.4

v04 = c(v01[1], v02[2], v03[3])

v05 = seq(from = 0, to = 20, by = 4)

v06 = seq(0, 10, 2)

v07 = rep(1:4, times = 2)

v08 = rep(1:4, each = 2)

v09 = v08 - v07

v10 = v09 == 0

v11 = which(v09 < 1)

v12 = v09[!v09 < 1]

# a data.frame is a collection of vectors of equal length that need not be of a single type of element

df01 = data.frame(v07, v08, v09, v10)

v13 = df01[1, ]

v14 = df01[ , 3:4]

v15 = df01[4, 3]

v16 = df01$v08

# a matrix is similar to a data.frame, but all elements must be of the same type

m01 = matrix(1:10, nrow = 5)

m02 = matrix(1:10, ncol = 5)

# a list is similar to a vector, but its elements are other objects

l01 = list(v00, df01, m01)

# managing your workspace environment

ls()

rm(df01)

ls()

rm(list = ls())

ls()

# reading in data from .RData files and .csv data file

getwd()

load(file = "BeefLiver.RData")

elements = read.csv(file = "ElementData.csv")

source(file = "sampleScript.R")

elements = read.csv(file.choose())

# saving data to .RData file or .csv file

save(PBconc, elements, file = "saved.RData")

write.csv(elements, file = "saved.cvs")

# miscellaneous commands

help(head)

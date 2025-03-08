## ------------------------------------------------------------------------------------------
# a.
vec <- seq(11,30)
# b.
vec[7]
# c.
vec[-15]
# d.
vec[c(2,5)]
# e.
index <- seq(1,length(vec),by=2)
vec[index]


## ------------------------------------------------------------------------------------------
# a.
fare <- titanic$fare
MeanFare <- sum(fare)/length(fare)
MeanFare
# standard deviation (in three baby steps)
numerator <- sum((fare-MeanFare)^2)
denominator <- (length(fare)-1)
StdFare  <- sqrt(numerator/denominator)
StdFare
# b.
mean(fare)
sd(fare)


## ------------------------------------------------------------------------------------------
#| echo: false
#| warning: false
library(readxl)
titanic <- read_excel("../slides/data/Titanic3.xlsx")


## ------------------------------------------------------------------------------------------
dim(titanic)


## ------------------------------------------------------------------------------------------
str(titanic)
mode(titanic)


## ------------------------------------------------------------------------------------------
#| echo: false
titanic <- read_excel("../slides/data/Titanic3.xlsx", na = "NA")


## ------------------------------------------------------------------------------------------
#| echo: true
head(titanic, 10)
tail(titanic, 10)


## ------------------------------------------------------------------------------------------
#| echo: true
titanic <- as.data.frame(titanic)


## ------------------------------------------------------------------------------------------
head(titanic, 10)
tail(titanic, 10)


## ----summary-------------------------------------------------------------------------------
summary(titanic)


## ------------------------------------------------------------------------------------------
## some quantiles
quantile(titanic$age, probs=c(0.05,0.25,0.5,0.75,0.95), na.rm=TRUE)
quantile(titanic$fare, probs=c(0.05,0.25,0.5,0.75,0.95), na.rm=TRUE)
## the IQR (note that this is a single number)
IQR(titanic$age, na.rm=TRUE)
IQR(titanic$fare, na.rm=TRUE)
## the the standard deviation
sd(titanic$age, na.rm = TRUE)
sd(titanic$fare, na.rm = TRUE)


## ------------------------------------------------------------------------------------------
## basic tables
table(titanic$pclass)
table(titanic$sex)
table(titanic$sex, titanic$survived)
# has no added value because no missings
table(titanic$sex, titanic$survived, useNA = "always")


## ------------------------------------------------------------------------------------------
#| echo: true
addmargins(table(titanic$sex, titanic$survived))
proportions(table(titanic$sex, titanic$survived))


## ------------------------------------------------------------------------------------------
## basic tables
proportions(table(titanic$sex, titanic$survived), margin = 2)


## ------------------------------------------------------------------------------------------
subset(titanic,age>70)[,c("name","home_dest")]


## ------------------------------------------------------------------------------------------
subset(titanic, name=="Artagaveytia, Mr. Ramon")


## ------------------------------------------------------------------------------------------
first <- xtabs(~sex+survived, data=titanic, subset=(pclass=="1st"))
first
third <- xtabs(~sex+survived, data=titanic, subset=(pclass=="3rd"))
third


## ----add-status----------------------------------------------------------------------------
titanic$status <- factor(titanic$survived, labels=c("no","yes"))


## ------------------------------------------------------------------------------------------
summary(titanic)


## ------------------------------------------------------------------------------------------
#| echo: true
titanic$dob <- as.Date(titanic$dob, origin = "1960/1/1")


## ------------------------------------------------------------------------------------------
#| echo: true
table(format(titanic$dob, "%d"))


## ------------------------------------------------------------------------------------------
#| echo: true
min(titanic$dob, na.rm = TRUE)
max(titanic$age, na.rm = TRUE)
min(titanic$dob, na.rm = TRUE) + max(titanic$age, na.rm = TRUE) * 365.25


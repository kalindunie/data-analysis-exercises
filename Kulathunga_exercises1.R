# TILP2400 Exercises 1
# Kalindunie Kulathunga

# Task 1
# R and RStudio installed

# Task 2
# RScript created and saved

# Task 3
# Loaded the data
getwd()

hdata <- read.table("healthdata.txt", header = TRUE)

#Task 4
names(hdata)

head(hdata)

#Question What do the above commands print?
#names(hdata) command prints the column names of the dataset. 
#head(hdata) command prints the first part of the dataset. Generally, displays the first 6 rows along with column names.


#Task5
nrow(hdata)
ncol(hdata)

#How many observations are in the dataset? 876
#How many variables are in the dataset? 10

dim(hdata)
#Test the command dim(). What does it reveal? Provides the dimentions of objects, generally the number of rows and columns it contains. 
#that is [1] 876  10

#Task6
str(hdata)

#What are the data types of the variables for cholesterol (chol) and smoking status (smoking )?
#chol: numeric (num)
#smoking: character string (chr)

hdata$chol
hdata$syst
 
#What are the first three values for blood pressure in the dataset? 168, 126, 106


#Task7
hdata$smoking <- factor(hdata$smoking)
levels(hdata$smoking)

hdata$age <- factor(hdata$age)
levels(hdata$age)

#How many different age groups are present in the dataset? 4 groups

class(hdata$age)


#Task8
hdata$logsyst <- log(hdata$syst)

hdata$sqrtbmi <- sqrt(hdata$bmi)

hdata$mwaist <- (hdata$waist)/100


#Task9
hdata[5, 2]

hdata[1:10, ]

hdata[ , 1:4]

hdata[1:5, c(1, 2, 10)]

hdata[hdata$gender == "male", ]

hdata[ , c("chol", "syst")]

hdata[hdata$gender == "male", c("chol", "syst")]

hdata[hdata$gender == "female", c("smoking", "age", "syst")]
#What is the smoking status, age group, and blood pressure value of the first woman in your dataset?
#         smoking   age     syst
#2844        no     45-54   126


#Task10
any(is.na(hdata))

any(is.na(hdata$age))

any(is.na(hdata$marit))
#Are there any missing observations in the marit variable? Yes

hdataN <- na.omit(hdata)

nrow(hdataN)
#How many observations are now in the dataset hdataN, from which rows with missing data have been removed? 874
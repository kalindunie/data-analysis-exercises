# TILP2400 Exercises 2
# Kalindunie Kulathunga

hdata <- read.table("healthdata.txt", header = TRUE)


#Task 1

str(hdata)

hdata$age <- factor(hdata$age)

hdata$gender <- factor(hdata$gender)

hdata$smoking <- factor(hdata$smoking)


#Task 2
table(hdata$age)

table(hdata$smoking)
#In which smoking category are there the most participants? Non-smoking category
#How many people are in that category? 623


#Task 3
prop.table(table(hdata$age)) * 100

prop.table(table(hdata$gender)) * 100
#What percentage of participants are men? 47%
#What percentage of participants are women? 53%


#Task 4
f <- table(hdata$age)
f
sumf <- cumsum(f)
sumf
#How many participants in the study are under 45 years old? 427


#Task 5
relf <- prop.table(f) * 100
relsumf <- cumsum(relf)
relsumf
#What percentage of participants in the study are under 55 years old? 73.7%


#Task 6
round(cbind(f, relf, sumf, relsumf), 1)
#What percentage of the participants were aged 45-54? 25%
#How many participants were aged 25-44? 427


#Task 7
table(hdata$age, hdata$smoking)
#How many 55-64-year-olds smoke regularly? 34
#What is the corresponding number for 25-34-year-olds? 55


#Task 8
prop.table(table(hdata$age, hdata$gender), margin = 1) * 100
round(prop.table(table(hdata$age, hdata$gender), margin = 1) * 100, 1)
#In which age group is the gender distribution the most skewed?25-34
#In which age group is the gender distribution the most uniform? 55-64


#Task 9
round(prop.table(table(hdata$age, hdata$gender), margin = 2) * 100, 1)
#What percentage of the women in the study are aged 55-64? 25.2%
#What percentage of the men belong to the youngest age group? 22.6%


#Task 10
hdataord <- hdata[order(hdata$syst, decreasing = TRUE), ]
head(hdataord)
#What are the three highest blood pressure values in the data? 240, 222, 214


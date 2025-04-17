# TILP2400 Exercises 5
# Kalindunie Kulathunga

hdata <- read.table("healthdata.txt", header = TRUE)

hdata$age <- factor(hdata$age)

hdata$gender <- factor(hdata$gender)

hdata$smoking <- factor(hdata$smoking)

str(hdata)


#Task 1

plot(hdata$chol, hdata$syst, xlab = "Cholesterol levels", ylab = "Blood pressure")

#Describe the scatter plot verbally: 
#Based on the plot, can we conclude that there is a strong linear relationship between the variables?
#There is a positive linear dependency between blood pressure and cholesterol levels.But not stronger.  

#Does the scatter plot reveal any outliers?
# Yes there are higher blood pressure values associated with low cholesterol values, and vice versa.  


#Task 2

plot(hdata$chol, hdata$syst, 
     xlab = "Cholesterol levels", 
     ylab = "Blood pressure",
     col = ifelse(hdata$gender== "female", "purple", "black")
)

#Does the plot reveal diﬀerences in blood pressure between women and men?
#Yes. Women and men blood pressure values are different.


#Task 3

cor(hdata$chol, hdata$syst)

#Does the result support the conclusion you made in the previous task about the strength of the linear relationship?
#Yes. Correlation coeﬃcient is 0.2754011. Therefore there is a weak, but positive linear relationship. 


#Task 4

subdata <- subset(hdata, select = c("syst", "chol", "weight", "waist", "bmi"))

cor(subdata)

#Which variable does blood pressure syst correlate most strongly with? 
#Waist circumference

#And with which variable does it correlate the weakest?
#Cholesterol


#Task 5

cor(subdata, method = "spearman")

#Do the values of the correlation coeﬃcients change compared to task 4? 
#Yes, the value of correlation coeﬃcients slightly increased. 

#If so, what might be the reason for the change? 
#Because it measures how much the orders of two variables' observations are alike regardless of their linear dependency. 
#Furthermore outliers are disregarded in this method. 


#Task 6

hdataF <- subset(hdata, gender == "female")

plot(hdataF$chol, hdataF$syst, 
     xlab = "Cholesterol level", 
     ylab = "Blood Pressure",
     main = "Blood Pressure and Cholesterol levels of Women")

cor(hdataF$chol, hdataF$syst)

hdataM <- subset(hdata, gender == "male")

plot(hdataM$chol, hdataM$syst,
     xlab = "Cholesterol level", 
     ylab = "Blood Pressure",
     main = "Blood Pressure and Cholesterol levels of Men")

cor(hdataM$chol, hdataM$syst)

#Which gender shows a stronger relationship between the variables?
# Female


#Task 7

boxplot(syst~ age, data = hdata, range = 0,
        ylab = "Blood Pressure", 
        xlab = "Age Group", 
        col = c("lightblue", "lightgreen", "pink", "lightyellow"))

#Based on the plot, is blood pressure associated with a person’s age?
#Yes. It seems that blood pressure increase when people aged. 

boxplot(syst~ smoking, data = hdata, range = 0, 
        ylab = "Blood Pressure", 
        xlab = "Smoking", 
        col = c("lightblue", "lightgreen", "pink", "lightyellow"))

#Based on the plot, is blood pressure associated with a person’s smoking status?
#No. It seems that blood pressure does not strongly depend on the smoking status. 


#Task 8

table <- table(hdata$smoking, hdata$age)

prop.table(table, margin = 1)*100

#Can the contingency table be used to determine whether the variables are dependent?
#Yes. Since relative frequencies change across rows and columns, it seems that smoking status affected by age.


#Task 9

#H0 : “smoking and age are independent”
#H1 : “smoking and age are dependent”

chisq.test(hdata$smoking, hdata$age) 

#Interpret the test result: are the variables dependent?
#P-value is 0.001921 which is very smaller. Therefore, we can reject the null hypothesis and 
#conclude that smoking and age are dependent. 


#Task 10

table <- table(hdata$smoking, hdata$gender)

prop.table(table, margin = 1)*100

#Can the contingency table be used to determine whether the variables are dependent?
#Yes. Since relative frequencies change across rows and columns, it seems that smoking status affected by gender.

#H0 : “smoking and gender are independent”
#H1 : “smoking and gender are dependent”

chisq.test(hdata$smoking, hdata$gender)

#Interpret the test result: are the variables dependent?
#P-value is 0.001554 which is very smaller. Therefore, we can reject the null hypothesis and 
#conclude that smoking and gender are dependent.

#Are the variables dependent based on the contingency table and the χ2 test?
#Yes. According to contingency table and χ2 test, smoking and gender are dependent. 



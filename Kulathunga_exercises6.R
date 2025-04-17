# TILP2400 Exercises 6
# Kalindunie Kulathunga


hdata <- read.table("healthdata.txt", header = TRUE, sep = " ", stringsAsFactors = FALSE)

hdata$gender <- factor(hdata$gender)

class(hdata$gender)


#Task 1
plot(hdata$chol, hdata$syst, 
     xlab = "Cholesterol levels", 
     ylab = "Blood pressure",
     col = ifelse(hdata$gender== "female", "purple", "black")
)

model1 <- lm(syst~ chol, data = hdata)
model1

# Average_BP = 106.506 + 5.015*chol

coefficients <- coef(model1)
coefficients

abline(a = coefficients[1], b = coefficients[2], col = "red")

abline(106.506, 5.015, col = "red")


#Task 2

#Provide an interpretation for the intercept a. 
#What type of individuals does this term represent in terms of average blood pressure?
#When cholesterol level is zero, average blood pressure is 106.506 mmHg. 

#Provide an interpretation for the slope b.
#When cholesterol level increase by 1 unit, systolic blood pressure increase by 5.015 units. 


#Task 3

confint(model1)

#what do they tell us about the average blood pressure at the population level?
# 95% confident that true population regression coefficient for cholesterol level falls between [3.85, 6.18]. 
# As this interval does not include zero, the effect of cholesterol on blood pressure is statistically significant. 
# 95% confident that the true population intercept falls between [99.80, 113.21], which is the average blood pressure when the cholesterol level is zero. 


#Task 4

syst = 106.506 + 5.015*6
print(syst)

# 136.596mmHg

dataNEW <- data.frame(chol = 6)

predict(model1, dataNEW, interval = "predict")


#Task 5

# hdata$gender <- ifelse(hdata$gender == "female", 0,1 )

# hdata$gender <- factor(hdata$gender)

model2 <- lm(syst ~ chol + gender, data = hdata)

coef(model2)


# Average_BP = 105.23 + 4.80*chol + 5.30*gender


#Task 6

#What type of individual’s average blood pressure does this value represent?
# When female cholesterol level is zero, the average blood pressure level is 105.23 mmHg.

#Now, provide an interpretation for the coeﬃcients b1 and b2.
# b1:4.80 is the change in average blood pressure level of same gender individuals, when their cholesterol level increase by one unit.  
# b2:male average blood pressure is greater than 5.30mmHg at the same cholesterol level as female. 


#Task 7

confint(model2)

#what do they tell us about the average blood pressures at the population level?
# 95% confident that true population intercept falls between [98.55 - 111.91]
# intercept is the average blood pressure level of female when their cholesterol level is zero. 

# 95% confident that true population cholesterol coefficient falls between [3.64, 5.96].
# 95% confident that average systolic blood pressure falls within this interval, when cholesterol level of same gender increase by 1 unit. 

#confident interval of gender is [2.70, 7.89], means 95% confident that within the same cholesterol level, 
#average blood pressure is between [2.70, 7.89] units higher than that of female. 

# Are the regression coeﬃcients statistically significant based on the confidence interval analyses?
# Since confident interval of true population interval does not include zero, intercept is statistically significant. 
# Since cholesterol coefficient of female falls between [3.64, 5.96] and does not include zero, systolic blood pressure depends on the cholesterol level, significantly. 
# Since gender coefficient falls between [2.70, 7.89] and does not include zero, systolic blood pressure depends on the gender, within the same cholesterol level. 
 

#Task 8

# syst_female = 105.23 + 4.80*chol

# syst_male = 105.23 + 4.80*chol + 5.30

plot(hdata$chol, hdata$syst, 
     xlab = "Cholesterol levels", 
     ylab = "Blood pressure")

coefficients <- coef(model2)

abline(105.23, 4.80, col = "red")

abline(105.23 + 5.30, 4.80, col = "blue")


#Task 9

syst_female = 105.23 + 4.80*6
print(syst_female)
# 134.03mmHg

syst_male = 105.23 + 4.80*6 + 5.30
print(syst_male)

#What is the diﬀerence between the predictions for men and women?

Difference = syst_male - syst_female
print(Difference)
# 139.33mmHg

#The difference is 5.30mmHg. This is the effect on systolic blood pressure by gender, as indicated by regression coefficient (b2=5.30)


#Task 10

dataNEW <- data.frame(chol = c(6, 6), gender = c("0", "1"))

predict(model2, dataNEW, interval = "predict")

#Are the predictions the same as the ones you calculated in Task 9? Yes

#Which gender’s predictions have more uncertainty?
X_female = 172.2656 - 95.80139
print(X_female)
# 76.46

X_male = 177.5631 - 101.09323
print(X_male)
# 76.46

# Both prediction intervals have same width. Therefore, uncertainties are equal in both genders. 


#Task 11

fittedv <- fitted(model2)

sresiduals <- rstandard(model2)

plot(fittedv, sresiduals, 
     xlab = "Predicted Blood Pressure", 
     ylab = "Standardized Residuals",
     main =  "Residual Vs Fitted Values",
     pch = 16, col = "blue")

abline(h = 0, col = "red", lwd = 2)

# Do you observe any systematic pattern in the plot? No

qqnorm(sresiduals)

abline(0,1, col = "red")

#Are the points now roughly along a straight line? Yes, points are only scattered near tails. 
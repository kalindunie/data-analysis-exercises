# TILP2400 Exercises 4
# Kalindunie Kulathunga

hdata <- read.table("healthdata.txt", header = TRUE)

hdata$gender <- factor(hdata$gender)

str(hdata)


#Task 1

hist(hdata$syst, main = "Systolic Blood Pressure",
     xlab = "Blood Pressure",
     col = "lightblue")
box()
  
#Describe the shape of the distribution in words: Is the distribution symmetric? Skewed Distribution
#Do you observe any outliers? Yes. There are few higher blood pressure values

hist(hdata$chol, main = "Distribution of Cholestrol Values", col = "purple", xlab = "cholesterol" )

#The distribution of cholesterol is slightly skewed. 
#There are few high cholesterol values. 


#Task 2

hdataF <- subset(hdata, gender== "female")

nrow(hdataF)

hdataM <- subset(hdata, gender== "male")

nrow(hdataM)

#How many men and how many women participated in the study? 
#women = 464
#men = 412


#Task 3

mean_F <- mean(hdataF$syst, na.rm = TRUE)

mean_M <- mean(hdataM$syst, na.rm = TRUE)

cat(mean_F)
cat(mean_M)

mean_M - mean_F 
#How much do women’s and men’s blood pressures diﬀer on average? 6.27mmHg

sd_BP_F <- sd(hdataF$syst, na.rm = TRUE)

sd_BP_M <- sd(hdataM$syst, na.rm = TRUE)

cat(sd_BP_F)

cat(sd_BP_M)

#Which gender’s blood pressure has more variation? Female


#Task 4

median_F <- median(hdataF$syst, na.rm = TRUE)

median_M <- median(hdataM$syst, na.rm = TRUE)

cat(median_F)

cat(median_M)

interquartile_F <- quantile(hdataF$syst, probs = c(0.25, 0.75), na.rm = TRUE)

interquartile_M <- quantile(hdataM$syst, probs = c(0.25, 0.75), na.rm = TRUE)

print(interquartile_F)

print(interquartile_M)

#What is the exact interpretation of the medians? 
#Half of men have systolic blood pressure below 136mmHg and half of men have systolic blood pressure above 136mmHg.     
#similarly, Half of women have systolic blood pressure below 128mmHg and half of women have systolic blood pressure above 128mmHg. 

#What about the interquartile ranges?
#For women median systolic blood pressure falls between 116mmHg (Q1) and 144mmHg(Q3)
#For men median systolic blood pressure falls between 124mmHg (Q1) and 148mmHg(Q3)

#The medians diﬀer slightly from the sample means calculated in Task 3. What is the reason for this?
#Because the data shows a skewed distribution as there are outliers due to high blood pressure values. 


#Task 5

boxplot(syst~ gender, data = hdata, range = 0, col = c("lightblue", "lightgreen"))

#How can you determine from the plot which gender has more variability in blood pressure?
#By size of IQR, whiskers' length and observing outliers. 

#And which gender has a greater range of blood pressure values? Female


#Task 6

# get_mode <- function(x) {
#   uniq_x <- unique(x)               # Get unique values
#   uniq_x[which.max(tabulate(match(x, uniq_x)))]  # Return the most frequent value
# }
# 
# marit <- hdata$marit  # Extract the marital status column from hdata
# edlevel <- hdata$edlevel
# 
# mode_marit <- get_mode(marit)
# mode_edlevel <- get_mode(edlevel)
# 
# # Print results
# print(mode_marit)
# print(mode_edlevel)

table(hdata$marit)

table(hdata$edlevel)

#What is the typical marital status of the participants? married or cohabiting

#What about their education level? basic education or equivalent


#Task 7

x <- mean(hdata$syst, na.rm = TRUE)

s <- sd(hdata$syst, na.rm = TRUE)

n <- sum(!is.na(hdata$syst))

lower_bound <- x - 2 * (s / sqrt(n))
print(round(lower_bound, 2))

upper_bound <- x + 2 * (s / sqrt(n))
print(round(upper_bound, 2))

#Interpret the confidence interval in words.
#95% confidence that average blood pressure in the population falls between 133.53mmHg and 136.28mmHg.

#What does the confidence interval tell us about the population mean?
#The average systolic blood pressure of Finnish people, aged 25-64 is falls between this interval range. 


#Task 8

# One-sample t-test
t.test(hdata$syst, mu = 130)

#Explain what conclusions can you draw from the test regarding the validity of the null hypothesis in the population?
#Sample mean of blood pressure is 134.91. The t-test value of 7.118 shows a significant difference the sample mean and 130. 
#P-value is 2.281e-12, which is extremely smaller. That means the average blood pressure of Finns is significantly difference from 130. 
#Confidence interval is  [133.5535, 136.2592] for which 130 does not fall. 
#Therefore, it can be concluded that the average systolic blood pressure of Finns is significantly different from 130. 
#Hence, null hypothesis can be rejected. 


#Task 9

t.test(hdata$syst, mu = 135, alternative = "greater")

#Explain what conclusions can you draw from the test regarding the validity of the null hypothesis in the population?
#t-value is -0.1358. Since this is verly close to zero, average blood pressure of Finns is close to 135. 
#P-value is 0.554. Since p-value is higher than 0.05 we cannot reject H₀. Therefore, it is clear that the average blood pressure of Finns not substantially greater than 135. 
#95% Confidence Interval [133.7714, Inf] includes 135. Therefore, we cannot confidently say that true mean is greater than 135. 
#Furthermore sample mean is 134.91 which is closer to 135. Considering all these fact, null hypothesis cannot be rejected. 


#Task 10

t.test(hdataF$syst, hdataM$syst, alternative = "two.sided", var.equal = TRUE)

#Explain what conclusions can you draw from the test regarding the validity of the null hypothesis in the population?
#Mean blood pressure of women is 131.95, mean blood pressure of men is 138.23
#95% confidence interval [-8.95, -3.59] does not include 0, means that the difference is significant. 
#Negative t-value of -4.5929 indicates that women blood pressure is less than men. 
#P-value is 5.013e-06, which is smaller than 0.05, therefore null hypothesis can be rejected. 
#Considering all these facts null hypothesis can be rejected. 
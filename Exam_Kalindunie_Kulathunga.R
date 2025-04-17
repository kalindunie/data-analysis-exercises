# Kalindunie Kulathunga

houses <- read.table("http://users.jyu.fi/~slahola/files/houses.txt", header = TRUE)
houses$type <- factor(houses$type)
houses$cond <- factor(houses$cond)

#Task 1
# a)

table(houses$year, houses$cond)
round(prop.table(table(houses$year, houses$cond), margin = 1) * 100, 2)

# 1970s - 80%

# b)
table(houses$year, houses$type)
prop.table(table(houses$year, houses$type), margin = 2) * 100

# 12.5%


# Task 2
# a)

one_room <- subset(houses, houses$type == "1")
two_room <- subset(houses, houses$type == "2")

# b)

summary(one_room$price)
sd(one_room$price, na.rm = TRUE)

# Location (Central Tendency):
# Minimum: The lowest price is 47,000.
# 1st Quartile (Q1): The price below which 25% of the data falls is 80,750.
# Median (Q2): The middle value (50th percentile) of the prices is 91,400.
# Mean: The average price is 97,267.
# 3rd Quartile (Q3): The price below which 75% of the data falls is 105,250.
# Maximum: The highest price is 169,000.

#Variation
# Standard Deviation (SD): Deviation from mean price is 27,018.05. 


summary(two_room$price)
sd(two_room$price, na.rm = TRUE)

# Minimum: The lowest price is 67,000.
# 1st Quartile (Q1): The price below which 25% of the data falls is 105,000.
# Median (Q2): The middle value (50th percentile) of the prices is 125,000.
# Mean: The average price is 124,194.
# 3rd Quartile (Q3): The price below which 75% of the data falls is 140,000.
# Maximum: The highest price is 201,000.

#Variation
# Standard Deviation (SD): Deviation from mean price is 29,074.86. 

# summary statistics help reducing data's information and provide summarized information of data.

# c)

cor(two_room$price, two_room$size)

# Since correlation coefficient is 0.252, relationship is weak and positive.
# Therefore, price is not strongly depend on size. 


# Task 3
# a)

model <- lm(price ~ size, data = houses)
model

# b)

# Price = 61447 + 1220(size)

# c) 

plot(price ~ size, data = houses, xlab = "Size of apartment", ylab = "Price of apartment")
abline(model, col = "purple")

# d) 

predict(model, data.frame(size = 50))

# 122,455.70 


# Task 4

# a)

model <- lm(price ~ size+ cond + type, data = houses)
model

# b)

# Price =  64335 + 764(size) + 26761(cond2) + 7939(type2)

#  c) 

# intercept = 64335, describes the average price when type 1 and condition 1 apartment size is zero.

# regression coefficient = 764 describes the price increase when size of the apartment increase by one unit when apartment type and condition is constant.

# regression coefficient = 26761 describes the average change in price of condition2 apartment is greater than condition1 apartment by 26761 units, when size and type are constant. 

# regression coefficient = 7939, describes that price of type2 apartment is greater than type1 apartment by 7939 units when size and condition is constant.

# d)

summary(model)

# Intercept p-value = 3.56e-10,and less than 0.05. Therefor,coefficient is significant.  

# size p-value = 0.0116,less than 0.05, but close to 0.05. Therefore, size and price is statistically significant. 
# Hence price of apartment depends on the size. 

# cond2 p-value = 1.84e-10 and less than 0.05. Therefor, condition and price is statistically significant.
# Hence price of apartment depends on the condition. 

# type2 p-value = 0.2694 and greater than 0.05. Therefore, type and price is not statistically significant. 
# Hence price of apartment does not depend on the type.  
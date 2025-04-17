# TILP2400 Exercises 3
# Kalindunie Kulathunga

#Task 1

str(hdata)

hdata$age <- factor(hdata$age)

hdata$gender <- factor(hdata$gender)

hdata$smoking <- factor(hdata$smoking)


#Task 2

table1 <- table(hdata$age)

barplot(table1, horiz = FALSE)


#Task 3

barplot(table1, horiz = FALSE, ylab= "count", ylim = c(0,250), space = 0.3, 
        col = "blue", main = "Participants by age group")


#Task 4

table1 <- prop.table(table(hdata$gender)) * 100

table1 <- sort(table1, decreasing = FALSE)

barplot(table1, horiz = TRUE)


#Task 5

barplot(table1, horiz = TRUE, xlab = "%", xlim = c(0,60),
        main = "Participants percentages by gender", col = "yellow")


#Task 6

table1 <- table(hdata$gender, hdata$age)
barplot(table1, beside = TRUE, horiz = FALSE)


#Task 7

barplot(table1, beside = TRUE, horiz = FALSE, ylim = c(0,150), ylab = "Number of Participants", 
        col = c("pink", "purple"), 
        main = "Participants by gender and age group")


#Task 8
barplot(table1, beside = TRUE, horiz = FALSE, ylim = c(0,150),
        ylab = "Number of Participants", col = c("pink", "purple"), 
        main = "Participants by gender and age group")

legend("topleft", legend = c("female", "male"), fill = c("pink", "purple"),
       bty = "n")
box()


#Task 9

pdf("Chart.pdf")

table1 <- table(hdata$gender, hdata$age)

barplot(table1, beside = TRUE, horiz = FALSE,
        ylim = c(0,150), ylab = "Number of Participants", 
        col = c("pink", "purple"), 
        main = "Number of participants by gender and age group")

legend("topleft", legend = c("female", "male"), fill = c("pink", "purple"),
       bty = "n")
box()

dev.off()

getwd()


#Task 10

#margin = 2 calculates percentages within each smoking category
table1 <- prop.table(table(hdata$smoking,hdata$gender), 2) * 100 

table1 <- table1[order(rowSums(table1), decreasing = FALSE), ]

barplot(table1, beside = TRUE, horiz = TRUE, 
        col = c("red", "purple", "blue"), 
        xlim = c(0,100), xlab = "%",
        main = "Smoking by gender")

legend("topright", legend = c("no", "yes", "sometimes"), 
       fill = c("blue", "purple", "red"),
       bty = "n")

box()
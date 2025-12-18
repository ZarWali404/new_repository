data <- read.csv("~/Documents/zb_r_assignment/zarghoona_bahawi_itc255.csv", header = TRUE)
View(data)
head(data)

#here i have changed the QNT variable of Age to QlT variable of AgeGroup
data$AgeGroup <- cut(data$Age,
                     breaks = c(-Inf, 24, 35, Inf),
                     labels = c("Young", "Adult", "Senior"))
View (data)

# Select only Name, Age, and Medicine Type
data_selected <- data[, c("Name", "Age", "Medicine.Type")]
head(data_selected)

# People older than 30
data_age30 <- data[data$Age > 30, ]

# People who are Very satisfied
data_very_sat <- data[data$Satisfaction == "Very satisfied", ]

data$AgeGroup <- cut(data$Age,
                     breaks = c(-Inf, 24, 35, Inf),
                     labels = c("Young", "Adult", "Senior"))

# Sort by Age (ascending)
data_sorted_age <- data[order(data$Age), ]

# Sort by Height (descending)
data_sorted_height <- data[order(-data$Height), ]

# Frequency of Medicine Type
table(data$Medicine.Type)

# Frequency of Age Group
table(data$AgeGroup)

# Summary of numeric variables
summary(data$Age)
summary(data$Height)


# Average age by Gender
aggregate(Age ~ Gender, data = data, mean)


# Remove Name column
data_no_name <- data[, -1]

data <- read.csv("~/Documents/zb_r_assignment/zarghoona_bahawi_itc255.csv", header = TRUE)
View(data)

#here i have changed the QNT variable of Age to QlT variable of AgeGroup
data$AgeGroup <- cut(data$Age,
                     breaks = c(-Inf, 24, 35, Inf),
                     labels = c("Young", "Adult", "Senior"))
View (data)

# Frequency table for AgeGroup
age_fdt <- table(data$AgeGroup)

# Frequency table (absolute frequency)
abs_freq <- table(data$AgeGroup)


# Relative frequency (proportion)
rel_freq <- prop.table(abs_freq)

# Cumulative frequency
cum_freq <- cumsum(abs_freq)

# Add percentages
age_percent <- prop.table(age_fdt) * 100

# Combine counts and percentages
age_fdt_table <- cbind(Absolute = abs_freq,
                       Relative = round(rel_freq, 2),
                       Cumulative = cum_freq, 
                       Frequency = age_fdt, 
                       Percentage = round(age_percent, 2))

# Print the FDT
print(age_fdt_table)




#Graphs

# Bar chart for AgeGroup QLT
barplot(table(data$AgeGroup),
        main="Bar Chart of Age Groups",
        col=c("skyblue","orange","green"),
        ylab="Frequency",
        xlab="Age Group")
# Pie chart for AgeGroup QLT
pie(table(data$AgeGroup),
    main="Pie Chart of Age Groups",
    col=c("skyblue","orange","green"))


# Histogram for Age QNT
hist(data$Age,
     main="Histogram of Age",
     xlab="Age",
     col="lightblue",
     border="black")
# Density plot for Age QNT
plot(density(data$Age),
     main="Density Plot of Age",
     xlab="Age",
     ylab="Density",
     col="red",
     lwd=2)



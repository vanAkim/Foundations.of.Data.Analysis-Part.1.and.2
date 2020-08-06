bull = BullRiders

# How many of the first 10 riders in the dataset have been pro for 10 years or more?
table(bull$YearsPro[seq(1,10,by=1)])

plot(bull$Rides13,bull$Top10_13)

##########################
# PRELAB
##########################

#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  > 0 ,]

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)

# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))

# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)

# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

#identify a specific record
which(new_bull$Top10_13==2 & new_bull$Rides13==22)
new_bull[4,]

##########################
# LAB
##########################

#Subset for riders that participated in at least one event in 2013
new_bull12 = bull[bull$Events12  > 0 ,]

# Visualize and describe the first variable of interest
hist(new_bull12$Earnings12)
fivenum(new_bull12$Earnings12)
mean(new_bull12$Earnings12)
sd(new_bull12$Earnings12)

# Create a correlation matrix 
vars <- c("Earnings12", "RidePer12", "CupPoints12")
cor(new_bull12[,vars])

# Create a scatterplot
plot(new_bull12$RidePer12,new_bull12$Earnings12)

# identify specific case
which(new_bull12$Earnings12 == max(new_bull12$Earnings12))
new_bull12[4,]

#Subset the data
nooutlier <- new_bull12[new_bull12$Earnings12 < 1000000 ,] 

# Create a correlation matrix 
vars <- c("Earnings12", "RidePer12", "CupPoints12")
cor(nooutlier[,vars])


##########################
# Problem set
##########################

new_bull = bull[bull$Rides14  > 0 ,]

RidesPerEvent14 <- new_bull$Rides14/new_bull$Events14

hist(RidesPerEvent14)
fivenum(RidesPerEvent14)

plot(RidesPerEvent14,new_bull$Rank14)
abline(lm(new_bull$Rank14~RidesPerEvent14))

cor(RidesPerEvent14,new_bull$Rank14)

# Question 2
min_study = c(30,45,180,95,130,140,80,60,110,0,80)
grade = c(74, 68, 87, 90, 94, 84, 88, 82, 93, 65, 90)
plot(min_study,grade)
cor(min_study,grade)
cor(min_study,grade)**2

which(min_study < 50)
grade[which(min_study < 50)]

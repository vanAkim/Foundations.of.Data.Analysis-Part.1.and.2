survey <- StudentSurvey

# 1b) How many of the first 10 students in the dataset had names longer than 5 letters?
table(survey$name_letters[1:10][survey$name_letters>5])

# 1c) How long is the name of the first student in the dataset who is happy less than 40% of the time?
survey$name_letters[survey$happy < 40][1]


#################################
# PRELAB
#################################

# Calculate the population parameters
hist(survey$name_letters)
fivenum(survey$name_letters)
mean(survey$name_letters)
sd(survey$name_letters)


# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =5)
xbar5[i] <-  mean(x)}


# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(2,10))


# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CLT.
sd(survey$name_letters)/sqrt(5)

#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(2,10))

mean(xbar15)
sd(xbar15)
sd(survey$name_letters)/sqrt(15)

#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(2,10))

mean(xbar25)
sd(xbar25)
sd(survey$name_letters)/sqrt(25)


#################################
# LAB
#################################

# Calculate the population parameters
hist(survey$happy)
fivenum(survey$happy)
mean(survey$happy)
sd(survey$happy)


# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =5)
xbar5[i] <-  mean(x)}


# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(0,100))


# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CLT.
sd(survey$happy)/sqrt(5)

#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(0,100))

mean(xbar15)
sd(xbar15)
sd(survey$happy)/sqrt(15)

#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(0,100))

mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(25)


#################################
# PROBLEM SET
#################################

hist(survey$austin)
fivenum(survey$austin)
mean(survey$austin)
sd(survey$austin)

# Draw 1,000 samples of n=10 and find the mean of each sample.
xbar10 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$austin, size =10)
xbar10[i] <-  mean(x)}

hist(xbar10,xlim=c(0,10))

mean(xbar10)
sd(xbar10)

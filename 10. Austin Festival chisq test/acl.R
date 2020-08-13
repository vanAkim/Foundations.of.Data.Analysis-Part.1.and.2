acl <- AustinCityLimits

# 1a. In what year did Allen Toussaint play at Austin City Limits?
acl$Year[acl$Artist == 'Allen Toussaint']

# 1b. How many years old was Allen Toussaint when he performed?
acl$Age[acl$Artist == 'Allen Toussaint']

# 1c. How many variables for Allen Toussaint have missing data?
table(acl[acl$Artist == 'Allen Toussaint', ])


#################
# PRELAB
#################

# Question 1 (Goodness of Fit)
# Create a table of counts for Gender
gender_tab <-table(acl$Gender)
gender_tab

# Create vector of expected proportions
ExpGender <- c(.50, .50)

# Check expected counts assumption
chisq.test(gender_tab, p=ExpGender)$expected

# Run goodness of fit
chisq.test(gender_tab, p=ExpGender)


# Question 2 (Test of Independence)
# Create two-way table
gender_top10 <-table(acl$Gender, acl$BB.wk.top10)
gender_top10

# Generate expected counts
chisq.test(gender_top10, correct=FALSE)$expected

# Run test of independence
chisq.test(gender_top10, correct=FALSE)

#################
# LAB
#################

# Question 1 (Goodness of Fit)
# Create a table of counts for Genre
genre_tab <-table(acl$Genre)
genre_tab

# Create vector of expected proportions
ExpGenre <- c(.25, .25, .25, .25)

# Check expected counts assumption
chisq.test(genre_tab, p=ExpGenre)$expected

# Run goodness of fit
chisq.test(genre_tab, p=ExpGenre)


# Question 2 (Test of Independence)
# Create two-way table
genre_100kT <-table(acl$Genre, acl$Twitter.100k)
genre_100kT
prop.table(genre_100kT, 1)

# Generate expected counts
chisq.test(genre_100kT, correct=FALSE)$expected

# Run test of independence
chisq.test(genre_100kT, correct=FALSE)

#################
# Problem set
#################

# You want to know if the proportion of female performers on Austin City Limits Live has changed in the past two years.

acl$Recent[acl$Year < 2012] <- 0 
acl$Recent[acl$Year >= 2012] <- 1

gender_recent = table(acl$Recent,acl$Gender)
gender_recent

chisq.test(gender_recent, correct = F)$expected

chisq.test(gender_recent, correct = F)

########################################################################
# When crossing white and yellow summer squash, a genetic model predicts
# that 75% of resulting offspring will be white, 15% will be yellow and 10% will be green.

squash = c(152,39,14) # white, yellow, green
expsquash = c(0.75, 0.15, .10)

chisq.test(squash, p=expsquash)$expected
chisq.test(squash, p=expsquash)

########################################################################
# Approximately 13% of the world's population is left-handed, but is this proportion the same across men and women? 

lefthand = matrix(c(1,'M','L',2,'M','R',3,'F','R',4,'M','R',5,'F','R',6,'F','L',7,'F','L',8,'M','R',9,'F','R',10,'F','R',11,'M','L',12,'F','R',13,'M','R',14,'M','R',15,'F','R',16,'M','R',17,'M','R',18,'F','R',19,'F','L',20,'M','R',21,'F','R'), nrow=3, ncol = 21)
lefthand = data.frame(lefthand)
lefthand = t(lefthand)
lefthand = data.frame(lefthand[,1], lefthand[,2], lefthand[,3])
colnames(lefthand) = c('ID','Gender', 'DominantHand')
rownames(lefthand) <- 1:nrow(lefthand)

table = table(lefthand$Gender, lefthand$DominantHand)
table

chisq.test(lefthand$Gender, lefthand$DominantHand)$expected

########################################################################
# A telephone survey asked a random sample of Indiana voters about their
# home internet usage, as well as what type of community (rural, suburban or urban) they lived in.

data = data.frame(rep('',123), rep('',123))
colnames(data) <- c('Community', 'Internet')

data[,1] = c(rep('Rural',28), rep('Suburabn',42), rep('Urban',53))

data[,2] = c( rep('Y',13), rep('N',28-13), rep('Y',35), rep('N',42-35), rep('Y',50), rep('N',53-50))

internet_tab = table(data$Community, data$Internet)
internet_tab

# 4c. What proportion of respondents did NOT have internet access at home?
length(data$Internet[data$Internet == 'N'])/length(data$Internet)

chisq.test(internet_tab, correct =F)$expected
chisq.test(internet_tab, correct =F)
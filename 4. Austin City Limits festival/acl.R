acl <- AustinCityLimits

# 1b. How many of the first 10 artists in the dataset were Grammy winners?
table(acl$Grammy[seq(1,10)])

# 1c) What genre was played by the first female artist
#     in the dataset who was over 60 years of age?

acl[acl$Gender == 'F' & acl$Age >= 60,'Genre'][1]


###########################################
# PRELAB
###########################################

#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]

# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender

# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway

# Visualize the counts
barplot(twoway, legend=T, beside=T)

# Calculate P(A): the probability of each genre being played
prop.table(genre)

# Calculate P(A|B): the probability of each genre being played, given the artist's gender
prop.table(twoway,1)


###########################################
# LAB
###########################################

# 1) How many male artists won a Grammy?
table(acl$Gender[acl$Grammy == 'Y'])

# 2) How many male artists did not win a Grammy?
table(acl$Gender[acl$Grammy == 'N'])

# 3) Which genre had the greatest number of Grammy wins?
table(acl$Genre[acl$Grammy == 'Y'])

# All of the questions below deal with the data frame that contains males only.
aclmales = acl[acl$Gender == 'M',]

# 4) What is the probability that a randomly selected artist was
#    a Grammy winner?
tabgrammy = table(aclmales$Grammy)
prop.table(tabgrammy)

# 5) To determine the probability of winning a Grammy if
#    the artist was a singer-songwriter, you would divide _______ by ________.
contable = table(aclmales$Grammy,aclmales$Genre)
contable
prop.table(contable,1)
table(aclmales$Grammy)

# What is the probability that a randomly selected male artist
# from each of the following genres won a Grammy?
prop.table(contable,2)

# Probability of winning a Grammy
barplot(prop.table(contable,2),legend=T,beside = T)


###########################################
# PROBLEM SET
###########################################

# 1a. How many artists in the dataset have 100,000 or more likes on Facebook? 
table(acl$Facebook.100k)

#1b. Which age group has the highest number of artists that have
#    100,000 or more likes on Facebook?
table(acl$Age.Group[acl$Facebook.100k == 1])

# For each age group, fill in the proportion of artists who have 100,000 or more likes on Facebook.
poptab = table(acl$Facebook.100k,acl$Age.Group)
prop.table(poptab,2)

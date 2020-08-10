post <- PostSurvey

# 1b. What is the classification of the first male student?
post[post$gender == 'Male', 'classification'][1]

# 1c. Of the first 10 students in the dataset, what percentage live on campus?
ctable = table(post[1:10, 'live_campus'])
prop.table(ctable)


##############
# PRELAB
##############

# Make a vector of happiness scores for each sample
underclass_happy <- post$happy[post$classification=='Freshman'|post$classification=='Sophomore']
upperclass_happy <- post$happy[post$classification=='Junior'|post$classification=='Senior']

# Check the normality assumption
hist(underclass_happy, xlab='Underclassman Happiness', main='Percent of Time Happy')
hist(upperclass_happy, xlab='Upperclassman Happiness', main='Percent of Time Happy')

# Run independent t-test
t.test(underclass_happy, upperclass_happy)

#1a. What percent of the time, on average, were underclassmen happy?
mean(underclass_happy)
mean(upperclass_happy)

##########
# Lab Question 2

# Make a vector of difference scores
post$diff_happy <- post$happy - post$post_happy

# Check the normality assumption
hist(post$diff_happy, xlab= 'Difference in Happiness over the Semester', main = 'Happy-Post Happy')

# Run dependent t-test
t.test(post$happy, post$post_happy, paired=T)

##############
# LAB
##############

# Make a vector of difference scores
post$diff_hm_time <- post$hw_hours_HS - post$hw_hours_college

# Check the normality assumption
hist(post$diff_hm_time, xlab= 'Difference in time spent per week on homeworks', main = 'HS - College')

# Run dependent t-test
t.test(post$hw_hours_HS, post$hw_hours_college, paired=T)
t.test(post$hw_hours_HS, post$hw_hours_college, paired=T, alternative = 'less')

# 1a. On average, students spent how many hours more on homework each week in college than they did in high school?
mean(post$diff_hm_time)

##########
# Lab Question 2

confreries = post$sleep_Sat[post$greek == 'yes']
alone = post$sleep_Sat[post$greek == 'no']

# Check the normality assumption
hist(confreries)
hist(alone)

#2a. On average, students who are Greek sleep how many hours less than Non-Greek students on Saturday nights?
mean(confreries)-mean(alone)

# Run independent t-test
t.test(confreries,alone, alternative='less')


##############
# PROBLEM SET
##############

# Is the increase in time spent studying from high school to college the same for nursing majors and biology majors?
nursing = post[post$major == 'Nursing', 'diff_hm_time']
biology = post[post$major == 'Biology', 'diff_hm_time']

hist(nursing)
hist(biology)

t.test(nursing,biology)

# Some nerve cells have the ability to regenerate.
# Researchers think that these cells may generate creatine phosphate (CP) to stimulate new cell growth.
# To test this hypothesis, researchers cut the nerves emanating from the left side of the spinal cord in a sample of rhesus monkeys,
# while the nerves on the right side were kept intact.  They then compared the CP levels (mg/100g) in nerve cells on both sides.

regen = c(16.3,4.8,10.7,14.0,15.7,9.9,29.3,20.4,15.7,7.6,16.2,14.7,15,8.4,23.3,17.7)
control = c(11.5,3.5,12.8,7.9,15.2,9.8,24,14.9,12.6,8.2,8.4,11,12.5,9.2,17.5,11.1)
diff_CP = regen-control
mean(regen-control)
sd(diff_CP)
sd(diff_CP)/sqrt(16)
t.test(regen,control,paired = TRUE)
mean(regen-control) + qt(0.025,15)*sd(diff_CP)/sqrt(16) # lower bound
mean(regen-control) + qt(0.975,15)*sd(diff_CP)/sqrt(16) # upper bound

bike = BikeData
table(bike$student) #how much students ?

table(bike$cyc_freq[seq(1, 10, by=1)]) #how much of the 10 first riders ride daily ?

female_riders = bike[bike$gender == 'F',]
female_riders[female_riders$cyc_freq == 'Less than once a month',] #the speed of the first female who cycles less than one time per month (in miles/hour)?

# Import the BikeData dataset, name it "bike"

# Find the number of students in the dataset
table(bike$cyc_freq)

# Pull out student data into a new dataframe
daily <-bike[bike$cyc_freq=='Daily',]

# Find how often the students ride, using the new dataframe
table(daily$gender)

# Create a vector for the distance variable
age <-daily$age
age_male = daily$age[daily$gender=='M']
age_female = daily$age[daily$gender=='F']

# Find average distance ridden
mean(age)
mean(age_female)
mean(age_male)

old_male_daily = daily[daily$gender=='M',]
old_male_daily = old_male_daily[old_male_daily$age>=30,]
world = WorldBankData

# 1a) What is the first "Low Income" country in the dataset?
world[world$IncomeGroup == 'Low income',]

# 1b) What was the rural population of Aruba in 1970? (Report without commas)
world[world$Country == 'Aruba' & world$year == 1970, 'rural.population']

# 1c) When was the first year Australia had data on the number of mobile device subscriptions? (Subscriptions more than 0)
world[world$Country == 'Australia' & world$mobile.users > 0, 'year']


##############################
# PRELAB
##############################

# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]

# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]

# Create a new variable in our datset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000

# Create a new variable in our dataset called time that represents "years since 1990"
us_select$time <- us_select$year - 1990

# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)

# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)


##############################
# LAB
##############################

# Subset data for just the United States and name the new data frame "us"
dn <- world[world$Country.Code == "DNK",]

dn$prop <- dn$internet.users / dn$population

dn_select <- dn[dn$year >= 1990, ]

# Create a new variable in our dataset called time that represents "years since 1990"
dn_select$time_since1990 <- dn_select$year - 1990

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(dn_select$time_since1990, dn_select$prop)
logisticFit(dn_select$time_since1990, dn_select$prop)

# C / y = 1 + ab^-t
# ((C/y)-1)/a = b^-t
# -t = ln(((C/y)-1)/a)/ln(b)


##############################
# PROBLEM
##############################

bz <- world[world$Country == "Brazil",]
bz_select <- bz[bz$year >= 1995, ]

bz_select$time_since1995 <- bz_select$year - 1995

bz_select$mobile.mil <- bz_select$mobile.users / 1000000

# 1a. Use RStudio to find the number of mobile users in Brazil (in millions) in 2000. (Round to 2 decimal places.)
bz_select$mobile.mil[bz_select$year == '2000']

# 1b. In what year did Brazil first record more than 100 million mobile users?
bz_select$year[bz_select$mobile.mil > 100]

linFit(bz_select$time_since1995, bz_select$mobile.mil)
expFit(bz_select$time_since1995, bz_select$mobile.mil)
logisticFit(bz_select$time_since1995, bz_select$mobile.mil)

logisticFitPred(bz_select$time_since1995, bz_select$mobile.mil, 30)
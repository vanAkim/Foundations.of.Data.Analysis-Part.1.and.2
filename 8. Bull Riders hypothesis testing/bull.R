bull <- BullRiders


###############################
# PRELAB
###############################

#Select bull riders from the US
USA <-bull[bull$Country=="USA",]

# Summarize the bull rider weights
mean(USA$Weight)
sd(USA$Weight)

# Visualize the weight distribution
hist(USA$Weight, main='Histogram of US Bull Rider Weights',xlab='Weight (lbs)')

# Run the single sample t-test
t.test(USA$Weight, mu=190)


###############################
# LAB
###############################

df = bull[bull$Events14 >= 5,]

mean(df$RidePer14)
sd(df$RidePer14)

hist(df$RidePer14)

t.test(df$RidePer14, mu=.5)


###############################
# PROBLEM
###############################

# 1 
earnings_per = bull$Earnings12[bull$Earnings12 > 0]/bull$Events12[bull$Events12 > 0]

hist(earnings_per)

earnings_per_log <- log(earnings_per)

hist(earnings_per_log)

mean(earnings_per_log)
sd(earnings_per_log)

SE = sd(earnings_per_log)/sqrt(29)
lower_bound = exp(mean(earnings_per_log) + SE*qt(0.025,28))
upper_bound = exp(mean(earnings_per_log) + SE*qt(0.975,28))

# 2
x = c( 29.4,29.0,28.4,28.8,28.9,29.3,28.5,28.2)
mean(x)
sd(x)

t.test(x,mu=28.5)
hist(x)

WR = WorldRecords

# 1a. How many different types of events are represented in the dataset?
table(WR$Event)

# 1b. In what year did Usain Bolt first break the world record for the men's 100m dash?
WR[which(WR$Athlete == 'Usain Bolt'),]

# 1c. Who was the first woman to break the women's 1 mile world record with a time of less than 260 seconds?
WR[WR$Event == 'Womens Mile' & WR$Record < 260,]


###########################
# PRELAB
###########################

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 

#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)


###########################
# LAB
###########################

#Subset the data
menmile <- WR[WR$Event=='Mens Mile',]
womenmile<- WR[WR$Event=='Womens Mile',] 

#Create scatterplots
plot(menmile$Year,menmile$Record,main='Mens Mile World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenmile$Year,womenmile$Record,main='Womens Mile World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menmile$Year, menmile$Record)
linFit(womenmile$Year,womenmile$Record)


###########################
# PROBLEM
###########################

menpole = WR[WR$Event == 'Mens Polevault' & WR$Year >= 1970,]

# 1a. What is the standing world record height (in meters) for men's pole vault? (Round to 2 decimal places.)
max(menpole$Record)

# 1b. In what year did the pole vault record first exceed 6 meters? (Look at the data to find the year.)
menpole[menpole$Record > 6,]

# 1c. Create a scatterplot showing the men's pole vault records since 1970 as a function of year. Fit a linear model to the data. 
plot(menpole$Year,menpole$Record)
linFit(menpole$Year,menpole$Record)

# 2. Band group
C = c(140,280,420,560)
h = c(0,2,4,6)
band = data.frame(C,h)
linFit(band$h, band$C)


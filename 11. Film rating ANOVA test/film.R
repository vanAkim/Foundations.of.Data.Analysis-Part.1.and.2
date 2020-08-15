film <- FilmData

# 1b. What is the name of the highest ranked film made by Universal Studios?
film$Film[film$Studio=='Uni.'][1]

# 1c. What was the lowest IMDB rating given to a film that ranked in the top 10 grossing films of all time?
min(film$IMDB[film$Rank <= 10])


#############
# PRELAB
#############

# Show how many films are in each group
table(film$Rating)

# Question 1

# Calculate avg film budget of each group
aggregate(Budget~Rating,film,mean)

# Calculate sd of film budget within each group
aggregate(Budget~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$Budget~film$Rating, main= "Film Budgets by Rating",
        ylab= "Budget", xlab= "MPAA Rating")

# Run ANOVA
modelbud <- aov(film$Budget~film$Rating)
summary(modelbud)

# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)

################################################
#Question 2

# Calculate avg IMDB score of each group
aggregate(IMDB~Rating,film,mean)

#Calculate sd of IMDB scores within each group
aggregate(IMDB~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$IMDB~film$Rating, main= "IMDB Scores by Rating",
        ylab= "IMDB Score", xlab= "MPAA Rating")

# Run ANOVA
modelscore <- aov(film$IMDB~film$Rating)
summary(modelscore)

# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)


#############
# LAB
#############

# Show how many films are in each group
table(film$Studio)

# Question 1

#,Calculate avg film Days of each group
aggregate(Days~Studio,film,mean)

# Calculate sd of film Days within each group
aggregate(Days~Studio,film,sd)

# Visualize the group means and variability
boxplot(film$Days~film$Studio, main= "Film Days by Studio",
        ylab= "Days", xlab= "MPAA Studio")

# Run ANOVA
modelbud <- aov(film$Days~film$Studio)
summary(modelbud)

# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)

################################################
#Question 2

# Calculate avg Pct.Dom score of each group
aggregate(Pct.Dom~Studio,film,mean)

#Calculate sd of Pct.Dom scores within each group
aggregate(Pct.Dom~Studio,film,sd)

# Visualize the group means and variability
boxplot(film$Pct.Dom~film$Studio, main= "Pct.Dom Scores by Studio",
        ylab= "Pct.Dom Score", xlab= "MPAA Studio")

# Run ANOVA
modelscore <- aov(film$Pct.Dom~film$Studio)
summary(modelscore)

# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)


#############
# Problem
#############

# Question 1
film$Budget.summary[film$Budget < 100] = 'low-budget'
film$Budget.summary[film$Budget >= 100 & film$Budget < 150] = 'medium-budget'
film$Budget.summary[film$Budget >= 150] = 'high-budget'

table(film$Budget.summary)

aggregate(Pct.Dom~Budget.summary,film,mean)

boxplot(film$Pct.Dom~film$Budget.summary)

modelscore = aov(film$Pct.Dom~film$Budget.summary)
summary(modelscore)

TukeyHSD(modelscore)

#Question 3
section.number = c(rep('1',6),rep('2',6),rep('3',6))

officer.id = rep(1:6,3)
officer.id = sort(officer.id)

tickets = t(matrix(c(8,3,1,4,7,2,6,0,7,8,2,6,6,7,5,4,5,0), ncol = 6, nrow = 3))
dim(tickets) = c(length(tickets),1)

police = data.frame(section.number,officer.id,tickets)

anovascore = aov(police$tickets~police$section.number)
summary(anovascore)
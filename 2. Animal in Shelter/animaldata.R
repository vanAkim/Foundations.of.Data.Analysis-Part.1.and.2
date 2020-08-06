animaldata = AnimalData

table(animaldata$Outcome.Type[seq(1, 10, by=1)])
table(animaldata$Outcome.Type)

adopted = animaldata$Days.Shelter[animaldata$Outcome.Type == 'Adoption']

hist(adopted,main='Days in shelter before adoption',xlab = 'Days in Shelter',breaks = 15)
fivenum(adopted)
mean(adopted)
median(adopted)
sd(adopted)
which(animaldata$Days.Shelter==max(adopted))
max(adopted)
animaldata[425,]


# Compare the weight of adult cats and dogs at the shelter.
# How typical would it be to find a 13-pound cat?  What about a 13-pound dog?

adult = animaldata[animaldata$Age.Intake >= 1,]
adultdogs = adult[adult$Animal.Type == 'Dog',]
adultcats = adult[adult$Animal.Type == 'Cat',]


hist(adultdogs$Weight, breaks = 10) # Right-skewed
adultdogs.weight = adultdogs$Weight
fivenum(adultdogs.weight)

hist(adultcats$Weight, breaks = 10) # Normal

adultcats.weight = adultcats$Weight
mean(adultcats.weight)
sd(adultcats.weight)
median(adultcats.weight)
# What is the z-score of a 13 pound adult cat?
zscore = (13 - mean(adultcats.weight))/sd(adultcats.weight)
# What proportion of adult cats weigh more than 13 pounds, according to your data?
1-pnorm(zscore)



table(animaldata$Intake.Type[animaldata$Animal.Type == 'Dog'])
81/sum(c(1,81,20,189))
dogs = animaldata[animaldata$Animal.Type == 'Dog',]
dogs.ownersurrender = dogs[dogs$Intake.Type == 'Owner Surrender',]
table(dogs.ownersurrender$Outcome.Type)
dogs.ownersurrender[dogs.ownersurrender$Outcome.Type == 'Return to Owner',]

students = c(20,20,15,15,15,10,5)
hist(students,breaks = 10)
pnorm(1.9) - pnorm(-1.2)

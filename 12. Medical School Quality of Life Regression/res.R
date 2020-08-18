library(SDSFoundations)

res <- TempskiResilience

#1b. The first listed student with a Med School Quality of Life score of 10 is how many years old?
res$Age[res$MS.QoL == 10][1]

# 1c. Of the first 10 participants, how many have a Med School Quality of Life over 5?
table(res$MS.QoL[1:10])


##########
# PRELAB
##########

#Subset into the Clinical Sciences
clin <- res[res$Group == "Clinical Sciences",]

#Question One
#Intial Correlations
vars <- c("QoL", "BDI")
cor(clin[,vars])

#RQ1 Model
ov_mod <- lm(QoL ~ BDI, data=clin)
summary(ov_mod)
confint(ov_mod)

#Diagnostics
plot(ov_mod, which=1)
cutoff <- 4/(ov_mod$df) 
plot(ov_mod, which=4, cook.levels=cutoff)

##########################################################
#Question Two
#Initial correlations
vars <- c("MS.QoL", "DREEM.S.SP", "DREEM.A.SP", "Resilience", "BDI", "Age")
cor(clin[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(clin[,vars], use="pairwise.complete.obs")

#RQ2 Model
ms_mod <- lm(MS.QoL ~ DREEM.S.SP + DREEM.A.SP + Resilience + BDI + Age, data=clin)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 


##########################################################
##########
# LAB
##########

#Subset into the Clinical Sciences
clin <- res[res$Group == "Basic Sciences",]

#Initial correlations
vars <- c("MS.QoL", "WHOQOL.PH", "WHOQOL.PSY", "WHOQOL.SOC", "WHOQOL.ENV")
cor(clin[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(clin[,vars], use="pairwise.complete.obs")

#RQ2 Model
ms_mod <- lm(MS.QoL ~ WHOQOL.PH + WHOQOL.PSY + WHOQOL.SOC + WHOQOL.ENV, data=clin)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 


##########################################################
##########
# Problem
##########

clin <- res[res$Group == "Clinical Sciences",]
vars <- c("BDI", "Female", "Age", "State.Anxiety", "Trait.anxiety")
cor(clin[,vars], use="pairwise.complete.obs")
ms_mod <- lm(BDI ~ Female + Age + State.Anxiety + Trait.anxiety, data=clin)
summary(ms_mod)
plot(ms_mod, which=1)

lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

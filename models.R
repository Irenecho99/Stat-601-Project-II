library(tidyverse)
rm(list = ls())
data <- read.csv('modefieddata.csv')
names(data)
data$state <- as.factor(data$state)
data$quarter <- as.factor(data$quarter)
data$unemployment.rate <- as.numeric(data$unemployment.rate)
data$new.cases <- as.numeric(data$new.cases)
data$death <- as.numeric(data$death)
data$lockdown.days <- as.numeric(data$lockdown.days)
data$vaccination.rate <- as.numeric(data$vaccination.rate)
data$GDP.USD. <- as.numeric(data$GDP.USD.)
data$Personal.Income <- as.numeric(data$Personal.Income)


library(lmtest)
full_mod<- lm(unemployment.rate ~., data = data)
summary(full_mod)
plot(resid(full_mod),type = "l")
dwtest(full_mod)
plot(rstandard(full_mod), type = "p")#heteroscedasticity validation
plot(fitted.values(full_mod), rstandard(full_mod)) +abline(h = 0) # linearity validation
qqnorm(rstandard(full_mod))# normality validation


data$state <- as.character(data$state)
data$state[data$state == "Alabama"] <-"Southeast"
data$state[data$state == "Alaska"] <-"West"
data$state[data$state == "Arizona"] <-"Southwest"
data$state[data$state == "Arkansas"] <-"Southeast"
data$state[data$state == "California"] <-"West"
data$state[data$state == "Alabama"] <-"Southeast"
data$state[data$state == "Alaska"] <-"West"
data$state[data$state == "Arizona"] <-"Southwest"
data$state[data$state == "Arkansas"] <-"Southeast"
data$state[data$state == "California"] <-"West"
data$state[data$state == "Colorado"] <-"West"
data$state[data$state == "Connecticut"] <-"Northeast"
data$state[data$state == "District of Columbia"] <-"Southeast"
data$state[data$state == "Delaware"] <-"Midwest"
data$state[data$state == "Florida"] <-"Southeast"
data$state[data$state == "Georgia"] <-"Southeast"
data$state[data$state == "Hawaii"] <-"West"
data$state[data$state == "Idaho"] <-"West"
data$state[data$state == "Illinois"] <-"Midwest"
data$state[data$state == "Indiana"] <-"Midwest"
data$state[data$state == "Iowa"] <-"Midwest"
data$state[data$state == "Kansas"] <-"Midwest"
data$state[data$state == "Kentucky"] <-"Southeast"
data$state[data$state == "Louisiana"] <-"Southeast"
data$state[data$state == "Maine"] <-"Northeast"
data$state[data$state == "Maryland"] <-"Northeast"
data$state[data$state == "Massachusetts"] <-"Northeast"
data$state[data$state == "Michigan"] <-"Midwest"
data$state[data$state == "Minnesota"] <-"Midwest"
data$state[data$state == "Mississippi"] <-"Midwest"
data$state[data$state == "Missouri"] <-"Midwest"
data$state[data$state == "Montana"] <-"West"
data$state[data$state == "Nebraska"] <-"Midwest"
data$state[data$state == "Nevada"] <-"West"
data$state[data$state == "New Hampshire"] <-"Northeast"
data$state[data$state == "New Jersey"] <-"Northeast"
data$state[data$state == "New Mexico"] <-"Southwest"
data$state[data$state == "New York"] <-"Northeast"
data$state[data$state == "North Carolina"] <-"Southeast"
data$state[data$state == "North Dakota"] <-"Midwest"
data$state[data$state == "Ohio"] <-"Midwest"
data$state[data$state == "Oklahoma"] <-"Southwest"
data$state[data$state == "Oregon"] <-"West"
data$state[data$state == "Pennsylvania"] <-"Northeast"
data$state[data$state == "Rhode Island"] <-"Northeast"
data$state[data$state == "South Carolina"] <-"Southeast"
data$state[data$state == "South Dakota"] <-"Midwest"
data$state[data$state == "Tennessee"] <-"Southeast"
data$state[data$state == "Texas"] <-"Southwest"
data$state[data$state == "Utah"] <-"West"
data$state[data$state == "Vermont"] <-"Northeast"
data$state[data$state == "Virginia"] <-"Southeast"
data$state[data$state == "Washington"] <-"West"
data$state[data$state == "West Virginia"] <-"Southeast"
data$state[data$state == "Wisconsin"] <-"Midwest"
data$state[data$state == "Wyoming"] <-"West"
fit1 = lm(unemployment.rate ~ ., data = data)
summary(fit1)
dwtest(fit1)
plot(resid(fit1),type = "l")
plot(rstandard(fit1), type = "p")#heteroscedasticity validation
plot(fitted.values(fit1), rstandard(fit1)) +abline(h = 0) # linearity validation
qqnorm(rstandard(fit1))# normality validation
unem_obs<-data[,8]
unem_est<-predict(fit1,type="response")
plot(unem_obs,unem_est)+abline(a=0,b=1)


logit_mod<- glm(unemployment.rate ~., family=binomial(link="logit"),data = data)
summary(logit_mod)
#library(arm)
#binnedplot(fitted(logit_mod),resid(logit_mod,type="response"))
#the observed data against the estimated data
unem_obs<-data[,8]
unem_est2<-predict(logit_mod,type="response")
plot(unem_obs,unem_est2)+abline(a=0,b=1)


#check the dispersion of the model
quasi_lm<-glm(unemployment.rate ~., family=quasibinomial(link="logit"),data = data)
summary(quasi_lm)
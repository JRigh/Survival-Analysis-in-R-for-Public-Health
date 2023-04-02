#-----------------------
# Survival analysis in R
#-----------------------

library(survival) # this is the cornerstone command for survival analysis in R
library(tidyverse)

# upload dataset
g <- read.csv(file = "C:/Users/julia/OneDrive/Desktop/Coursera/Survival Analysis R/simulated HF mort data for GMPH (1K) final.csv", header=TRUE, sep=',')
head(g)

gender <- as.factor(g[,"gender"]) # R calls categorical variables factors
fu_time <- g[,"fu_time"] # continuous variable (numeric) 
death <- g[,"death"] # binary variable (numeric) 

# overall Kaplan-Meier plot
km_fit <- survfit(Surv(fu_time, death) ~ 1)

plot(km_fit)


summary(km_fit, times = c(1:7,30,60,90*(1:10))) 
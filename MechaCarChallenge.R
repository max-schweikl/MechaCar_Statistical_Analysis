#Deliverable 1: Linear Regression to Predict MPG
#Load Packages
library(dplyr)
library(tidyverse)
#Import and Read CSV File as Dataframe
Car_Data <- read.csv('Resources/MechaCar_mpg.csv')
head(Car_Data)
#Generate Multiple Linear Regression Model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = Car_Data)
#Generate Summary Statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = Car_Data))

#Deliverable 2: Create Visualizations for the Trip Analysis
#Import and Read the CSV File as Dataframe
Coil_Data <- read.csv('Resources/Suspension_Coil.csv')
head(Coil_Data)
#Mean, Median, Variance, and SD of the Suspension Coil PSI Column
Mean = mean(Coil_Data$PSI)
Median = median(Coil_Data$PSI)
Variance = var(Coil_Data$PSI)
SD = sd(Coil_Data$PSI)
#Total Summary Dataframe
total_summary <- data.frame(Mean,Median,Variance,SD)
#Summary By Lot
lot_summary <- Coil_Data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI), .groups = 'keep')

#Deliverable 3: T-Tests on Suspension Coils
#T-Test for All Lots
t.test((Coil_Data$PSI),mu = 1500)
#T-Test for Each Lot
t.test(subset(Coil_Data,Manufacturing_Lot =="Lot1")$PSI,mu = 1500)
t.test(subset(Coil_Data,Manufacturing_Lot =="Lot2")$PSI,mu = 1500)
t.test(subset(Coil_Data,Manufacturing_Lot =="Lot3")$PSI,mu = 1500)
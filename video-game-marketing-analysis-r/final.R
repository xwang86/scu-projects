library(data.table)
library(stargazer)
library(lfe)
library(ggplot2)
library(ggeffects)
library(tidyverse) 
library(plyr)
library(dplyr)
library(lmtest) 
library(sandwich)
df = fread('~/Downloads/marketing analysis/final project/Video_Games_Sales_as_at_22_Dec_2016.csv',na.strings =c("","NA","N/A"))

# drop NA
df=na.omit(df)
summary(df) 
stargazer(df,type="text", median=TRUE, iqr=TRUE,digits=1, title="Descriptive Statistics")

#remove duplicate row
df[duplicated(df[,c("Name","Platform","Year_of_Release"),])]
dt <- data.frame(table(ga$Name, ga$Platform, ga$Year_of_Release))
dt[dt$Freq > 1,]
ga[ga$id %in% n_occur$Var1[n_occur$Freq > 1],]

df = df %>% distinct(Name,Platform,Year_of_Release, .keep_all = TRUE)

# find key
uniqueN( df[, .( df$Name, df$Platform, df$Year_of_Release)]) / df[,.N]

rm(list = ls())
library(data.table)
library(stargazer)
library(lfe)
library(ggplot2)
library(ggeffects)
library(tidyverse) 
library(plyr)
library(dplyr)
library(lmtest) 
library(sandwich)

df = fread("~/Downloads/Winter/R/Project/Video_Games_Sales_as_at_22_Dec_2016.csv",na.strings =c("","NA","N/A"))
#Remove all rows with NA values
df = df %>% na.omit()

#Change User_Score values in to numbers
df <- transform(df,User_Score = as.numeric(User_Score))
#Find the duplicated values
df[duplicated(df[,c("Name","Platform","Year_of_Release"),])]
#Remove duplicated rows
df = df %>% distinct(Name,Platform,Year_of_Release, .keep_all = TRUE)

#Change User_Score values in to numbers
df <- transform(df,User_Score = as.numeric(User_Score))

names(df)
head(df)
str(df)

uniqueN(df[, .(Name, Platform, Year_of_Release)] ) / df[,.N]

cor(df[,c("Year_of_Release","Critic_Score","Critic_Count","User_Score","User_Count")])

cor(df[,c("Global_Sales","NA_Sales","EU_Sales","JP_Sales","Year_of_Release","Critic_Score","Critic_Count","User_Score","User_Count")])


model_global = felm(log(Global_Sales+1) ~ Critic_Score*User_Score + Critic_Count + User_Count + factor(Platform) +factor(Genre) | Year_of_Release+ Publisher, data = df)

model_NA = felm(log(NA_Sales+1) ~ Critic_Score*User_Score + Critic_Count + User_Count + factor(Platform) +factor(Genre)| Year_of_Release + Publisher, data = df)

model_EU = felm(log(EU_Sales+1) ~ Critic_Score*User_Score + Critic_Count + User_Count + factor(Platform) +factor(Genre)| Year_of_Release + Publisher, data = df)

model_JP = felm(log(JP_Sales+1) ~ Critic_Score*User_Score + Critic_Count + User_Count + factor(Platform) +factor(Genre) | Year_of_Release + Publisher, data = df)

stargazer(model_global,model_NA,model_EU,model_JP, 
          title="Regression Results", type="text", 
          column.labels=c("Global","NA","EU","JP"),
          single.row = TRUE,
          df=FALSE, digits=3, star.cutoffs = c(0.05,0.01,0.001)) 

#Check heteroscedasticity
gqtest(model_global) # Significant then heteroscedasticity
bptest(model_global) # Insignificant

HWrobstder_gl <- sqrt(diag(vcovHC(model_global, type="HC1"))) # produces Huber-White robust standard errors 
HWrobstder_NA <- sqrt(diag(vcovHC(model_NA, type="HC1"))) # produces Huber-White robust standard errors 
HWrobstder_EU <- sqrt(diag(vcovHC(model_EU, type="HC1"))) # produces Huber-White robust standard errors 
HWrobstder_JP <- sqrt(diag(vcovHC(model_JP, type="HC1"))) # produces Huber-White robust standard errors 


stargazer(model_global, model_NA, model_EU, model_JP,  
          se= list(HWrobstder_gl, HWrobstder_NA, HWrobstder_EU, HWrobstder_JP),
          title="Regression Results- Robust", type="text",
          column.labels=c("Global","NA","EU","JP"),
          single.row = TRUE,
          df=FALSE, digits=3, star.cutoffs = c(0.05,0.01,0.001))  # displays normal/HW robust standard errors.

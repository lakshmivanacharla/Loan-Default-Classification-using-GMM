#importing the data
Data=read.csv("C:\\Users\\lakshmi prasanna\\OneDrive\\Documents\\DDA SEM 1\\credit_risk.csv")
summary(Data)
View(Data)
#making a dummy data set to test the code

#Removing the missing value rows
Data=na.omit(Data)
summary(Data)
table(Data$Default)
#Converting the target column default into binary
Data$Default=ifelse(Data$Default=="Y",1,0)

#removing the character columns
Data=subset(Data,select=-c(Home,Intent))


#Scaling the income and amount column
Vec1=((Data$Amount)-min(Data$Amount))/(max(Data$Amount)-min(Data$Amount))
Vec2=((Data$Income)-min(Data$Income))/(max(Data$Income)-min(Data$Income))
Data=cbind(Data,Vec1,Vec2)

#Changing the column names to scaled amount and scaled income
colnames(Data)[c(11,12)]=c("Scaled_Amount","Scaled_Income")

#Dropping the income and amount column
Data=subset(Data,select=-c(Income,Amount))
summary(Data)

#there is a problem with the age column we have to fix it
View(table(Data$Age))
which(Data$Age>100)
Data$Age[c(75,164,509,28389)]=c(44,44,23,44)

#our target column is default column and rest are features
#we have to see the ratio of default to non default
imbalanceRatio(Data,classAttr = "Default")

#splitting the dataset into train and test
x=sort(sample(nrow(Data),nrow(Data)*0.7))
Train_Data=Data[x,]
Test_Data=Data[-x,]

View(Train_Data)

#this means that we have to bring a balance ratio of 35-75 and therefore we have to oversample the data
Train_Data=oversample(Train_Data,ratio=0.4,method="SMOTE",classAttr = "Default")
imbalanceRatio(Train_Data,classAttr = "Default")
summary(Train_Data)


#Rounding the age column
Train_Data$Age=round(Train_Data$Age)
Train_Data$Rate=round(Train_Data$Rate,2)
tail(Data)

#making a unique observation number column and dropping the id column
#dropping the percent income column
Train_Data=subset(Train_Data,select = -c(Percent_income,Id))
View(Train_Data)
  

#dropping the percent income column from test Data
Test_Data=subset(Test_Data,select = -c(Percent_income,Id))
View(Test_Data)
#Exporting data to csv file
write.csv(Train_Data,file="C:\\Users\\lakshmi prasanna\\OneDrive\\Documents\\DDA SEM 1\\Train_Data")
write.csv(Test_Data,file="C:\\Users\\lakshmi prasanna\\OneDrive\\Documents\\DDA SEM 1\\Test_Data")

dummy_data=Train_Data

#GMM
install.packages("imbalance")
library(imbalance)
imbalanceRatio(Train_Data,classAttr = "Default")


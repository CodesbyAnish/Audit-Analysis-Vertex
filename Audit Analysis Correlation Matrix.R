getwd()
setwd("C:/Users/anish/Downloads/Experential project")
df <- read.csv("audit_model.csv")
View(df)
str(df)

#changing data types for correlation plot
df$Audit.Status <- as.numeric(df$Audit.Status)
df$USA.or.OUS <- as.numeric(df$USA.or.OUS)
df$Vendor.Risk.Rating <- as.numeric(df$Vendor.Risk.Rating)
df$Audit.Type <- as.numeric(df$Audit.Type)
df$Audit.Method <- as.numeric(df$Audit.Method)
df$Proposed.Quarter <- as.numeric(df$Proposed.Quarter)
df$Compass.Internal.Auditor <- as.numeric(df$Compass.Internal.Auditor)



#Correlation Plot
install.packages('corrplot')
install.packages('sqdlf')
library('corrplot')
library('sqldf')
names(df)
str(df)
df1<-sqldf("SELECT * FROM df")

corMatrix <- cor(df1)


corrplot(corMatrix)
par(mfrow=c(1,1))
corrplot(corMatrix, method="circle", type="lower", addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=90, #Text label color and rotation
         diag=TRUE, sig.level = 0.05, insig = "blank")

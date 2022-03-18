library(dplyr)

# Using while loop to calculate 2 means one for [sepal length] other for [petal length]

data(iris)
iris
x<-1;
sum_sepal <-0;

while(x!=150) {  
  
  sum_sepal<-sum_sepal +iris$Sepal.Length[x];
  x<-x+1;
  
}

sum_sepal
mean_sepal<- sum_sepal/150
mean_sepal

data(iris)
iris
y<-1
sumpetal<-0

while(y!=150){
  
  sumpetal<-sumpetal+iris$Petal.Length[y]
  y=y+1;
  
}

sumpetal
meanpetal<-sumpetal/150;
meanpetal

# plot [sepal length] of the dataset using dot plot where you must use the following:
# - group data on [species]
# - Change the symbol to make it '+ symbol'
# - Make title 'Iris Data'

data(iris)
dotchart(iris$Sepal.Length,groups=iris$Species,cex=0.9,main="iris Data",pch=3)

# plot [sepal Width] of the dataset using histogram and then using 
# density line in the same plot where you must use the following:
# - make the line of density smooth by 2.5
# - Make sure that histogram is for density not frequency

data(iris)
iris
hist(iris$Sepal.Width,prob = TRUE,col = "lightblue",xlab = "sepal_width",ylab = "count",main = "sepal width histogram")
lines(density(iris$Sepal.Width, adjust=2.5),col= "blue")

# Using Data wrangling pipe operator get the rows of the dataset where the [species] is 'setosa' or [sepal length] greater than 6.5 then sort by sepal length.

iris
iris %>% 
filter(Species == "setosa" | Sepal.Length > 6.5) %>%
arrange(Sepal.Length)

# Using Data wrangling pipe operator group the data on [species] then summarize [petal length] by the mean and sd.

data(iris)
iris
iris %>% 
group_by( Species) %>%
summarize(mean=mean(Petal.Length),std_dev=sd(Petal.Length))

# Build the linear regression model which will be used to get the dependent value [petal width], based on [petal length] that affect 
# Then find the correlation between them Finally make prediction using only the equation when petal length equal 6.

data("iris")
iris
fit<-lm(iris$Petal.Width~iris$Petal.Length)
fit
cor(iris$Petal.Length,iris$Petal.Width)
fit_6<-fit$coefficients[1]+fit$coefficients[2]*6
fit_6

# Bonus: chose a classifier of your choice and implement it on your data set

library(e1071)

m = naiveBayes(Species ~ ., data = iris)
v = predict(m,iris)
table(v)




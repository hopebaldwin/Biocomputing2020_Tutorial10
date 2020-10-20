# Tutorial 
# Hope Baldwin 
# Exercise 07 
# October 13, 2020

# CHALLENGE 1

# Set working directory to where I have the git branch 
setwd("~/biocomputing/Biocomputing2020_Tutorial10")

# variable with file data
data = read.table(file="UWvMSU_1-22-13.txt",header=TRUE) 

# make a data frame that will hold the scores
scores<-data.frame(matrix(nrow=nrow(data),ncol=3))
headers<-c("time","wisc","mich")
colnames(scores)<-headers

# initialize variables
michScore=0
wiscScore=0

# for loop to keep track of current scores and enter into the data frame
for(i in 1:nrow(data)){
  
  if(data$team[i] == "UW"){
    wiscScore=wiscScore+data$score[i]
  }else{
    michScore=michScore+data$score[i]
  }
  
  scores$time[i] = data$time[i]
  scores$wisc[i] = wiscScore
  scores$mich[i] = michScore
}

# make a line graph with both teams scores at each point someone scored
plot(scores$time, scores$wisc, type="l", col="red", main="UW (red) vs MSU (green)", xlab="Time", ylab="Score")
lines(scores$time, scores$mich, col="green")

# CHALLENGE 2

# create a vector with numbers 1-100
nums<-c(1:100)

# select a random number from the vector
number=sample(nums,1)

# print message to user
print("I'm thinking of a number 1-100...")

# declare variables
i = 1
guess = 0

# while the guess is not correct and the user has not guess 10 times, play the game
while ((guess != number)&&(i<10)){
  
  guess<-readline(prompt="Guess: ")
  
  if (guess < number){
    print("Higher")
  }else if (guess > number){
    print("Lower")
  }else{
    print("Correct!")
  }
  
  i=i+1;
  
}


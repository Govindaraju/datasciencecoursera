require(data.table)
require(plyr)
run_analysis <- function(){
  
  # read subject data indicating the person whose activities are recorded
  test.subject <- read.table("./test/subject_test.txt",header=F)
  train.subject <- read.table("./train/subject_train.txt",header=F)
  
  # read different activities performed by the participants namely
  # "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
  test.activity <- read.table("./test/y_test.txt",header=F)
  train.activity <- read.table("./train/y_train.txt",header=F)
  
  # read the measurements data, which has 561 columns representing various measurements
  test.main  <- read.table("./test/X_test.txt",header=F)
  train.main <- read.table("./train/X_train.txt",header=F)
  
  # read the 561 column names pertaining to various measurements
  cname <- read.table("features.txt",header=F,stringsAsFactors = FALSE)
  
  # set the column names to the test and training data.
  colnames(test.main)  <- cname$V2
  colnames(train.main) <- cname$V2
  
  # replace activity denoted by numbers 1 to 6 with their respective name
  test.activity$V1 <- mapvalues(test.activity$V1,c(1,2,3,4,5,6),c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
  train.activity$V1 <- mapvalues(train.activity$V1,c(1,2,3,4,5,6),c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
  
  # Convert test.main and train.main as data tables so that operations on them are easy and quick
  test.main  <- setDT(test.main)
  train.main <- setDT(train.main)
  
  #Make subject as one of the columns
  test.main[,subject := test.subject]
  train.main[,subject := train.subject]
  
  #Make activities as one of the columns
  test.main[,actvity := test.activity$V1]
  train.main[,actvity := train.activity$V1]
  
  #Merge train and test data tables
  total.main <- rbind(train.main,test.main)
  
  #Shortlist the required columns
  allcols <- colnames(total.main);
  index <- length(allcols)
  col.meanstd.slist <- grep("mean|std",allcols,value=T)
  col.short.list <- c(col.meanstd.slist,allcols[(index-2):index])
  
  #Extract all rows corresponding to the required columns 
  required.data <- total.main[,col.short.list,with=FALSE]
  
  #Compute the mean of all the columns grouped by activity and subject
  final.data <- required.data[,lapply(.SD,mean), by= list(actvity,subject)]
  
  final.data
}
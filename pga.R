#Prepare environment
#Load necessary libraries
library(data.table)
library(downloader)


#Set working directory
wd<-"C:/RCursus/ExploratoryDataAnalysis/week1/pga"
setwd(wd)

#File download:
path<-paste0(wd,"/data")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile<-"uciepc.zip"

if (!file.exists(path)) {
  dir.create(path)
}
download.file(url, file.path(path, destfile))

#File unzip: 
unzip(paste0("./data/",destfile),exdir="./data")

#Get file repository:
pathToDataSet <- file.path(path, "household_power_consumption.txt")
#list.files(pathToDataSet, recursive = TRUE)

hpc <- fread(pathToDataSet,colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
head(hpc)

# Draw plots
source('plot1.R')
source('plot2.R')
source('plot3.R')
source('plot4.R')


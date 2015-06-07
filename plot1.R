## Drawing first plot
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()  ## creating temporary file
zdata<-download.file(url,temp,method="curl")  
fileUrl<-unz(temp, "household_power_consumption.txt")  ## unzipping downloaded file

nrows<-24*60*2  ## number of rows to read
header <- read.table(fileUrl, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-read.table(fileUrl,sep=";",header = FALSE,na.strings = "?", skip=grep("1/2/2007", readLines(fileUrl)),nrows = nrows)
colnames( DT ) <- unlist(header)

png('plot1.png')
hist(DT$Global_active_power,col="red",main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
unlink(temp)
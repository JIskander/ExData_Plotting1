## Drawing first plot
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()  ## creating temporary file
zdata<-download.file(url,temp,method="curl")  
fname<-"household_power_consumption.txt"
unzip(temp, fname)  ## unzipping downloaded file

nrows<-24*60*2  ## number of rows to read
header <- fread(fname, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-fread(fname,sep=";",header = FALSE,na.strings = "?", skip="1/2/2007",nrows = nrows)
setnames(DT,colnames(DT), as.character(header))

png('plot1.png')
hist(DT$Global_active_power,col="red",main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
unlink(temp)
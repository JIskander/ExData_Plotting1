url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()  ## creating temporary file
zdata<-download.file(url,temp,method="curl")  
fname<-"household_power_consumption.txt"
unzip(temp, fname)  ## unzipping downloaded file

nrows<-24*60*2
header <- fread(fname, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-fread(fname,sep=";",header = FALSE,na.strings = "?",stringsAsFactors = FALSE, skip="1/2/2007",nrows = nrows)
setnames(DT,colnames(DT), as.character(header))
DT=DT[,FullDate:=as.character(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))]
png('plot2.png')
plot(as.POSIXct(DT$FullDate),DT$Global_active_power, type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()

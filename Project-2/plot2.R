#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

Bmore  <- NEI[NEI$fips=="24510", ]

E_Bmore <- aggregate(Emissions ~ year, Bmore, sum)

barplot(height=E_Bmore$Emissions, names.arg=E_Bmore$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Emissions in Baltimore City, MD by year'))

## Saving to file
dev.copy(png, file="plot2.png")

dev.off()


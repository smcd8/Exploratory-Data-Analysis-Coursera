#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

TEmi <- aggregate(Emissions ~ year, NEI, sum)
barplot(height=TEmi$Emissions, names.arg=TEmi$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Emissions by year'))

## Saving to file
dev.copy(png, file="plot1.png")

dev.off()

#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
Bmore  <- NEI[NEI$fips=="24510", ]

E_Bmore <- aggregate(Emissions ~ year + type, Bmore, sum)

g <- ggplot(E_Bmore, aes(year, Emissions, color = type))
g <- g + geom_line() +xlab('Year') + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)

## Saving to file
dev.copy(png, file="plot3.png", width=640, height=480)

dev.off()
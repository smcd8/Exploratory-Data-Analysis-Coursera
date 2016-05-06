#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# merge the two data sets 

NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI

E_change  <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

Y_Emissions <- aggregate(Emissions ~ year, E_change, sum)

g <- ggplot(Y_Emissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*"Emissions")) +
        ggtitle('Total Emissions from motor vehicles in Baltimore City, Maryland from 1999 to 2008')
print(g)

## Saving to file
dev.copy(png, file="plot5.png", width=640, height=480)
dev.off()
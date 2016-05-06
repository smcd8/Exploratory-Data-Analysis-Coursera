#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# merge the two data sets 

NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)

ssNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

T_year_fips <- aggregate(Emissions ~ year + fips, ssNEI, sum)
T_year_fips$fips[T_year_fips$fips=="24510"] <- "Baltimore, MD"
T_year_fips$fips[T_year_fips$fips=="06037"] <- "Los Angeles, CA"

g <- ggplot(T_year_fips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)

## Saving to file
dev.copy(png, file="plot6.png", width=1040, height=480)
dev.off()
#load files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# merge the two data sets 

        NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)
        
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEISCC records with Short.Name (SCC) Coal
        
coal_1  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
        subsetNEISCC <- NEISCC[coal_1, ]
        
        Y_Emissions <- aggregate(Emissions ~ year, subsetNEISCC, sum)
        
        g <- ggplot(Y_Emissions, aes(factor(year), Emissions))
        g <- g + geom_bar(stat="identity") +
                xlab("Year") +
                ylab(expression('Total PM'[2.5]* "Emissions")) +
                ggtitle('Total Emissions from Coal Sources from 1999 to 2008')
        print(g)
        
        ## Saving to file
        dev.copy(png, file="plot4.png", width=640, height=480)
        
        dev.off()      
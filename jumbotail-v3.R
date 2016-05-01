library(data.table)
require(dplyr)
setwd('/home/mani')

#hard coded value
lowerThreshold <- 0.8
upperThreshold <- 2.5


# read the supermarket transaction data 
# Data Resource  = https://www.waltoncollege.uark.edu/lab/JAloysius/Winston%20Albright%20Files%202011/Example%20Files%202011/Chapter%2002/Data%20Only/Supermarket%20Transactions.xlsx
DT <- read.table('jumbotail/supermarket.csv', sep = "," , header = TRUE)
DT <- as.data.table(DT)
colnames(DT) <- c("item", "date", "vendor_id")


#fixing the format of date 
DT$date <- as.Date(DT$date, format = "%d/%m/%Y")
dtWithDuration <- DT[order(rank(item), date)]
#trimws(dtWithDuration)

#storing all product by sequence one after another
write.table(dtWithDuration, file = "/home/mani/jumbotail/supermarket-ordered_09.csv", append = FALSE, row.names = FALSE)

#calculation difference between successive purchased date of particular item 
dtWithDuration <- dtWithDuration %>%
  group_by(item)%>%
  mutate(duration = as.numeric(date - lag(date, default = date[1])))%>%
  as.data.table()


# calculate last purchase date for item
recency <- aggregate(date ~ item, data = DT, max)
names(recency) <- c("item","recent_purchased_date")  

#calculating frequency of item bought 
#Example: Retailer will buy item-1 in 5 days average
# frequency for item-1 is 5 
frequency <- aggregate(duration ~ item, data = dtWithDuration, mean)
names(frequency) <- c("item", "freq")
frequency$freq <- round(frequency$freq, digit = 0)

#data having recent purchase date and frequency of each item
predicationData <- merge(recency, frequency, by = "item")
predicationData <- as.data.table(predicationData)
predicationData$item <- as.character(predicationData$item)


#Create Smart Shopping List for particular date
createShoppingList <- function(currentDate = "2016-01-10"){
  shoppingList <- c()
  for(i in 1:nrow(predicationData)){
    difference <- as.numeric(as.Date(currentDate) - as.Date(predicationData$recent_purchased_date[i])) 
    averageDuration <- predicationData$freq[i]
    variance <- as.numeric(difference/averageDuration)
    if(variance > 0 && variance > lowerThreshold  && variance < upperThreshold)
    {
      shoppingList <- c(shoppingList, predicationData$item[i])
    }
    
  }
  return(trimws(shoppingList))
}

smartShoppingList <- createShoppingList("2009-12-23")
smartShoppingList














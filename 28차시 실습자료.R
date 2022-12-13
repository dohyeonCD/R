
library(dplyr)

#Q1
data <- read.csv('TravelMode.csv')
head(data)
dim(data)   # (840 10)

#Q2
avg_table <- data %>% 
  group_by(mode) %>%
  summarize(gcostAgv=mean(gcost))

#Q3
avg_table <- avg_table %>% 
  as.data.frame()
label <- paste(avg_table$mode, "(", round(avg_table$gcostAgv / sum(avg_table$gcostAgv) *100,1), "% )" )
pie(avg_table$gcostAgv,labels = label)


                         
#set the working directory 
setwd("E:/GIT_Hub/BigMart-Sales-Analysis-R/")

#read the CSV file 
dset <- read.csv("input/dataset.csv",header = TRUE)
#rm(data_set)


#sales done per Outlet Irrespective of Outlet type

#importing dplyr package to make the changes in the data set
library(dplyr)
dset=tbl_df(dset)


#print 20 lines of the data set
print(dset,n=20)


plot_me <- dset %>%
  select(Outlet_Identifier,Item_MRP )%>%
  filter(!is.na(Item_MRP)) %>%
  group_by(Outlet_Identifier) %>%
  summarise(Sum_MRP= sum(Item_MRP))

print(plot_me)
library(ggplot2)
library(plotly)

plot_ly(plot_me, x = ~Outlet_Identifier, y = ~Sum_MRP, type = 'bar', 
        name = ~Outlet_Identifier, color = ~Outlet_Identifier,
        layout(yaxis = list(title = 'Total Sales')), barmode = 'stack')
  
   
  
    
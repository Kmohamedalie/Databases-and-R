#********************************************************
#                      Mysql and R                      #
# https://www.projectpro.io/recipes/connect-mysql-r     #
#********************************************************
#install.packages("RMySQL")

# connection settings
# Import required packages
library(RMySQL)

# create a connection
con = dbConnect(RMySQL::MySQL(),
                            dbname='northwind',
                            host='localhost',
                            port=3306,
                            user='root',
                            password='mysql')

# show tables
dbListTables(con)

# read from employees
result = dbSendQuery(con, "select * from customers") # write query to access the records from a particular table.

# take a glimpse
glimpse(result)

# read into a dataFrame
data.frame = fetch(result)

# type of data.frame
print(typeof(data.frame))

# print dataframe
print(data.frame)

# check dimension
print(dim(data.frame))

# head and tail
print(head(data.frame))
print(tail(data.frame))

# close connection 
dbDisconnect(con)
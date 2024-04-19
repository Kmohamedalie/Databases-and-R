#*****************************************************************  
#                         PostgreSQL and R                       #
# https://solutions.posit.co/connections/db/databases/postgresql/#
#*****************************************************************
#install.packages("RPostgreSQL")
#install.packages("odbc")
#install.packages("rstudioapi")
#install.packages("odbc","DBI","RODBC","dplyr","dbplyr")

# connection settings
# Import required packages
library(DBI)
library(RODBC)
library(odbc)
library(dplyr)
library(dbplyr)

# create a connection
con <- dbConnect(RPostgres::Postgres(), dbname="northwind", password="postgres",user="postgres")

# run connection 
cat <- dbSendQuery(con, "select * from categories")

# take a glimpse
glimpse(cat)

# read the result into a dataframe object
cat_df <- dbFetch(cat)

# clear result cat since we have save into cat_df
dbClearResult(cat)

# check dimension
print(dim(cat_df))

# head and tail
print(head(cat_df))
print(tail(cat_df))

# close connection 
dbDisconnect(con)
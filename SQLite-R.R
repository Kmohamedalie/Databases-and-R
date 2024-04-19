#*********************************************************** 
#                     SQLite and R                         #
# https://solutions.posit.co/connections/db/databases/sqlite/
#************************************************************
#install.packages("RSQLite")
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
con <- dbConnect(RSQLite::SQLite(), dbname="northwind.sqlite")

# show tables
dbListTables(con)

# write to database input mtcars if not exists
dbWriteTable(con, "mtcars_db", mtcars)
dbListTables(con)

# show fields
mtcars_df <- dbReadTable(con, "mtcars_db")

# take a glimpse
glimpse(mtcars_df)

# check dimension
print(dim(mtcars_df))

# head and tail
print(head(mtcars_df))
print(tail(mtcars_df))

# close connection 
dbDisconnect(con)
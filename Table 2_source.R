#====================

# Table Template: Percentage of ranges and mean (exclude 0) by respondent group
# Author: Sarah Medoff

#====================

library(tidyverse)
library(dplyr)
library(plyr)
library(utils)
library(readxl)

rm(list=ls())

source(file.path(".", "helper function", "hlprfnx_reading_and_cleaning_data.R"))
source(file.path(".", "helper function", "hlprfnx_creating_output_folder.R"))
source(file.path(".", "helper function", "hlprfnx_loading_input_variables.R"))


#-----------------
# Setting table number 
table_number <- 2

#----
# Sourcing the right helper functions based on table number
source(file.path(".", "helper function", "source_loading_table_hlprfnx.R"))

# Create the folder in which the final output will be saved
creating_output_folder.f(table_no = table_number)

#-----------------
# Read Source Data in 
HI_SMALL_BOAT.df <- reading_and_cleaning_data.f(df_type = "Small Boat Data")



#-----------------
# Set parameters for each table produced with this table template

# Read in the input variables
input_variable.l <- loading_input_variables.f(table_no = table_number)

# Most of the input data for this table are binned values 
# (e.g., 1 to 2... 3 to ... 4+)
# the final bin for the upper_bond column is left as an NA
# Fix the last upper bound value and put the data in a list form  
table_details_master.l <- lapply(1:length(input_variable.l), FUN = function(i){
  
  one_sheet.df <- input_variable.l[[i]]
  one_sheet_name.v <- names(input_variable.l)[i]
  
  # Make sure the binned values account for extreme outliers (the xxx+ values)
  cleaned_upper_bound <- ifelse(is.na(one_sheet.df$upper_bound), 
                                1000000, 
                                one_sheet.df$upper_bound)
  
  # Put them into a list to use later 
  one_sheet.l <- list(
    Banner = one_sheet_name.v,
    binned_values = c(-10, cleaned_upper_bound),
    label_values = one_sheet.df$description
  )
  
  return(one_sheet.l)
  
})

# Name the list 
names(table_details_master.l) <- names(input_variable.l)


#-------------
# Loop through tables 

table.l <- list()
for(i in 1:length(table_details_master.l)){
  
  print(i)
  
  #------------
  # Store all variable values 
  table_var.v <- table_details_master.l[[i]]
  
  banner_var <- table_var.v[["Banner"]]
  breaks.v <- table_var.v[["binned_values"]]  
  labels.v <- table_var.v[["label_values"]]
  
  #------------
  # Create file name 
  file_name <- paste0(banner_var, ".csv")
  
  # Compiling table
  TABLE02 <- compile_one_table2.f()
  
  # Saving table to appropriate folder
  saving_final_data.f(final_data = TABLE02)
  
  # Storing table to a list so we can inspect later
  table.l[[i]] <- TABLE02
  
}

names(table.l) <- names(input_variable.l)

View(table.l[["Q5xMEAN"]])
View(table.l[["Q14xMEAN"]])
View(table.l[["Q14axMEAN"]])


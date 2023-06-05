#====================

# Table Template: Percentage of responses by respondent group
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
table_number <- "3b"

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
  
  # Put them into a list to use later 
  one_sheet.l <- list(
    table_variable = one_sheet_name.v,
    binned_values = one_sheet.df$binned_values,
    label_values = one_sheet.df$label_values
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
  table_var.l <- table_details_master.l[[i]]
  
  table_var <- table_var.l[["table_variable"]]
  binned.v <- table_var.l[["binned_values"]]
  label.v <- table_var.l[["label_values"]]
  
  #------------
  # Create file name 
  file_name <- paste0(table_var, ".csv")
  
  # Compiling table
  TABLE03b <- compile_one_table3b.f()
  
  # Saving table to appropriate folder
  saving_final_data.f(final_data = TABLE03b)
  
  # Storing table to a list so we can inspect later
  table.l[[i]] <- TABLE03b
}

names(table.l) <- names(input_variable.l)

View(table.l[["Q7.1x"]])




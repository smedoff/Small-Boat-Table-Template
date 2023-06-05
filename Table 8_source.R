#====================

# Table Template: Percentage of amount in total by respondent group
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
  table_number <- 8
  
  #----
  # Sourcing the right helper functions based on table number
  source(file.path(".", "helper function", "source_loading_table_hlprfnx.R"))

# ----
# Create the folder in which the final output will be saved
  creating_output_folder.f(table_no = table_number)

#-----------------
# Read Source Data in 
  HI_SMALL_BOAT.df <- reading_and_cleaning_data.f(df_type = "Small Boat Data")
  
  

#-----------------
# Set parameters for each table produced with this table template

  # Read in the input variables
  input_variable.l <- loading_input_variables.f(table_no = table_number)
  
  # Put the input data in a format appropriate for the program
  table_details_master.l <- lapply(1:length(input_variable.l), FUN = function(i){
    
    one_sheet.df <- input_variable.l[[i]]
    
    one_sheet.v <- one_sheet.df$Variable
    
    names(one_sheet.v) <- one_sheet.df$Description
    
    return(one_sheet.v)
  })



#-------------
# Loop through tables 

table.l <- list()
for(i in 1:length(table_details_master.l)){
  
  print(i)
  
  #------------
  # Store all variable values 
  table_var.v <- table_details_master.l[[i]]
  
  # Create file name 
  file_name <- unname(table_var.v) %>% 
    paste(collapse = "_")
  
  # Compiling table
  TABLE08 <- compile_one_table08.f()
  
  # Saving table to appropriate folder
  saving_final_data.f(final_data = TABLE08)
  
  # Storing table to a list so we can inspect later
  table.l[[i]] <- TABLE08
  
  
}

View(table.l[[1]])
View(table.l[[2]])
View(table.l[[3]])





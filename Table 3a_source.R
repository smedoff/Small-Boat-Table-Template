#====================

# Table Template: Percentage of responses and mean by respondent group
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
table_number <- "3a"

#----
# Sourcing the right helper functions based on table number
source(file.path(".", "helper function", "source_loading_table_hlprfnx.R"))

# Create the folder in which the final output will be saved
creating_output_folder.f(table_no = table_number)

#-----------------
# Read Source Data in 
HI_SMALL_BOAT.df <- reading_and_cleaning_data.f(df_type = "Small Boat Data")



#-----------------
# Read in the input variables
table_details_master.v <- loading_input_variables.f(table_no = table_number) %>% 
  unlist() %>% 
  unname()


#-------------
# Loop through tables 

table.l <- list()
for(i in 1:length(table_details_master.v)){
  
  print(i)
  
  #------------
  # Store all variable values 
  table_var <- table_details_master.v[i]
  
  #------------
  # Create file name 
  file_name <- paste0(table_var, ".csv")
  
  # Compiling table
  TABLE03a <- compile_one_table3a.f()
  
  # Saving table to appropriate folder
  saving_final_data.f(final_data = TABLE03a)
  
  # Storing table to a list so we can inspect later
  table.l[[i]] <- TABLE03a
  
}

names(table.l) <- table_details_master.v

View(table.l[["Q3.1x"]])




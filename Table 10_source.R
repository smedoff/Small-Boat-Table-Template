#====================

# Table Template: Frequency for question series with multiple questions in banner
# Author: Sarah Medoff

#====================

# Notes::
# - Data/2 Input Variable Parameters/supplementary_code_table10_input_vars.R
#   to help with creating the input data sets
# - Pay special attention to the variable type.  This template is intended to handle
#   different types of variables 
#   1. Categorical 
#   2. Continous 
#   3. Variables without means 

library(tidyverse)
library(dplyr)
library(plyr)
library(utils)
library(readxl)

rm(list=ls())
options(scipen=999)

source(file.path(".", "helper function", "hlprfnx_reading_and_cleaning_data.R"))
source(file.path(".", "helper function", "hlprfnx_creating_output_folder.R"))
source(file.path(".", "helper function", "hlprfnx_loading_input_variables.R"))

#-----------------
# Setting table number 
table_number <- 10

#----
# Sourcing the right helper functions based on table number
source(file.path(".", "helper function", 
                 "Table Specific",
                 "Table 10_hlpfnx_compile one table block.R")) 

# ----
# Create the folder in which the final output will be saved
creating_output_folder.f(table_no = table_number)

#-----------------
# Read Source Data in 
HI_SMALL_BOAT.df <- reading_and_cleaning_data.f(df_type = "Small Boat Data")


#-----------------
# Set parameters for banner variables

# Read in the input variables
input_variable.l <- loading_input_variables.f(table_no = table_number,
                                              variable_type = "banner_vars")

# Put the input data in a format appropriate for the program
table_details_master.l <- lapply(1:length(input_variable.l), FUN = function(i){
  
  one_sheet.df <- input_variable.l[[i]]
  
  one_sheet.v <- one_sheet.df$Variable
  
  names(one_sheet.v) <- one_sheet.df$Description
  
  return(one_sheet.v)
})





#-----------------
# Set parameters for LHS variables 
# (Data/2 Input Variable parameters/supplementary_code_table10_input_vars.R)
# These LHS variables are formatted differently than previous templates.  
# For this table, each set of LHS variables will be stored in its own excel workbook 
# (contrary to previous templates where each set of LHS variables was stored as a sheet
# in one excel workbook)
# Instead, we need to pull all the LHS varaible work books into a list. 

# Lets get the number of left hand side workbooks we have in our input folder
NUMB_LHS_files.v <- grep("Table 10_lhs_category", 
                    list.files(file.path("Data", "2 Input Variable Parameters")),
                    value = TRUE) %>% length()
  
LHS_VARS.l <- lapply(1:length(NUMB_LHS_files.v), FUN = function(f){
  
  one_LHS.l <- c(loading_input_variables.f(table_no = table_number,
                                         variable_type = paste0("lhs_category", f)), 
                    loading_input_variables.f(table_no = table_number,
                                              variable_type = paste0("lhs_continuous", f)))
  return(one_LHS.l)
})


#-------------
# Loop through tables 

for(i in 1:length(table_details_master.l)){
  
  print(i)
  
  #------------
  # Store all variable values 
  table_var.v <- table_details_master.l[[i]]
  banner_var <- unname(table_var.v["Banner"])
  
  # Compiling table for each LHS data frame 
  for(j in 1:length(LHS_VARS.l)){
    
    VARS.l <- LHS_VARS.l[[j]]
    
    # Create file name 
    file_name <- paste0("LHS_", j, "_", banner_var)
    
    TABLE10.l <- lapply(1:length(VARS.l),
                        FUN = compute_one_block_table10.f,
                        data.df = HI_SMALL_BOAT.df, 
                        var.l = VARS.l)
    
    
    TABLE10 <- rbind(do.call(rbind, TABLE10.l))
    
    # Saving table to appropriate folder
    saving_final_data.f(final_data = TABLE10)
  }
  
}




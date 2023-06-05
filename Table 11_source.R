#====================

# Table Template: Trip cost by respondent group with mean, SE, median, and percentage of total cost in banner
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
  table_number <- 11

#----
# Sourcing the right helper functions based on table number
  source(file.path(".", "helper function", 
                   "Table Specific",
                   "Table 11_hlpfnx_compile one table block.R")) 

  # ----
  # Create the folder in which the final output will be saved
  creating_output_folder.f(table_no = table_number)


#-----------------
# Read Source Data in 
  EXPENDITURE.df <- reading_and_cleaning_data.f(df_type = "Trip Expenditure")


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
  LHS_VARS.l <- loading_input_variables.f(table_no = table_number,
                                          variable_type = "lhs_vars")
  

#-------------
# Loop through tables 
  
  for(i in 1:length(table_details_master.l)){
    
    print(i)
    
    #------------
    # Store all variable values 
    table_var.v <- table_details_master.l[[i]]
    banner_var <- unname(table_var.v["Banner"])
    banner_vals.v <- unname(table_var.v[setdiff(names(table_var.v), "Banner")])
    banner_labs.v <- names(table_var.v[setdiff(names(table_var.v), "Banner")])
    
    # Compiling table for each LHS data frame 
    for(j in 1:length(LHS_VARS.l)){
      
      VARS.df <- LHS_VARS.l[[j]]
      
      # Create file name 
      file_name <- paste0("LHS_", j, "_", banner_var)
      
      TABLE11.l <- lapply(1:nrow(VARS.df), 
                          FUN = compute_one_block_table11.f,
                          perc_denominator_var = "AVC1")
      
      
      TABLE11 <- rbind(do.call(rbind, TABLE11.l))
      
      # Saving table to appropriate folder
      saving_final_data.f(final_data = TABLE11)
    }
    
  }
    
    
    
    
    
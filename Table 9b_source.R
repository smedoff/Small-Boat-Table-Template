#====================

# Table Template: Mean SE and Median for question series with a question in banner
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
table_number <- "9b"
  
  #----
  # Sourcing the right helper functions based on table number
  source(file.path(".", "helper function", 
                   "Table Specific",
                   "Table 9ab_hlpfnx_compile one table block.R")) 

  # ----
  # Create the folder in which the final output will be saved
  creating_output_folder.f(table_no = table_number)

#-----------------
# Read Source Data in 
  HI_SMALL_BOAT.df <- reading_and_cleaning_data.f(df_type = "Small Boat Data")



#-----------------
# Set parameters for each table produced with this table template
  
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
    
    # Compiling table for each LHS data frame 
    for(j in 1:length(LHS_VARS.l)){
      
      VARS.df <- LHS_VARS.l[[j]]
      
      # Create file name 
      file_name <- unname(VARS.df$Variable) %>% 
        paste(collapse = "_") %>% 
        paste("_", banner_var)
      
      TABLE09b.l <- lapply(1:nrow(VARS.df), 
                           FUN = compute_one_block_table09ab.f,
                           data.df = HI_SMALL_BOAT.df, 
                           var.df = VARS.df)
      
      
      TABLE09b <- rbind(do.call(rbind, TABLE09b.l))
      
      # Saving table to appropriate folder
      saving_final_data.f(final_data = TABLE09b)
    }
    
  }
  


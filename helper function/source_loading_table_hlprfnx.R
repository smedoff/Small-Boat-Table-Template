

  # Soruce the function that creates one table 
  compiling_table_script <- file.path(".", "helper function", "Table Specific", 
                                paste0("Table ", table_number,
                                       "_hlpfnx2_compile one table.R"))
  
  # If the script exists, load it
  if(file.exists(compiling_table_script)){
    
    source(compiling_table_script)
  }

         
# --------------------
  # Source the function that creates one table block 
  compiling_table_block_script <- file.path(".", "helper function", "Table Specific", 
                                            paste0("Table ", table_number, 
                                                   "_hlpfnx1_compile one table block.R"))
  
  # If the script exists, load it
  if(file.exists(compiling_table_block_script)){
    
    source(compiling_table_block_script)
  }
  
  
# ------------------
  # Clean environmnet 
  rm(compiling_table_script, 
     compiling_table_block_script)

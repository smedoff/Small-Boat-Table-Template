

  loading_input_variables.f <- function(table_no, variable_type = NA){
    
    # Some tables require a banner variable data set and a left hand side
    # data set.  Other tables to not.  Account for the possibility of 
    # multiple data "types"
    if(is.na(variable_type)){
      file_name <- paste0("Table ", table_no)
      
    }else{
      file_name <- paste0("Table ", table_no, "_", variable_type)
    }
    
    #--------
    # Obtain a vector of xlsx sheet names
    sheet_names.v <- excel_sheets(file.path("Data", "2 Input Variable Parameters", 
                                            paste0(file_name, ".xlsx")))
    
    # Read in the sheets one at a time and format them appropriately 
    input_variables.l <- lapply(1:length(sheet_names.v), FUN = function(i){
      
      # Read in one variable-parameter at a time
      one_sheet.df <- read_xlsx(file.path("Data", "2 Input Variable Parameters", 
                                          paste0(file_name, ".xlsx")),
                                sheet = sheet_names.v[i])
      
      return(one_sheet.df)
    })
    
    names(input_variables.l) <- sheet_names.v
    
    return(input_variables.l)
  }


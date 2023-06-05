

#-----------------
# Clean column names of source data 

reading_and_cleaning_data.f <- function(df_type = c("Small Boat Data", "Trip Expenditure")){

  
  if(df_type == "Small Boat Data"){
    
    df <- read.csv(file.path(".",
                            "Data",
                            "1 Source",
                            "2021HawaiiSmallBoatData_Cleaned345_Short_110521.csv"))
    }
  
  if(df_type == "Trip Expenditure"){
    
    df = read.csv(file.path(".",
                            "Data",
                            "1 Source",
                            "2021StackedTripExpenditureAll022422.csv"))
  }
  
  # obtain a vector of col names
  data_names <- names(df)
  
  # isolate the first name (problem name)
  first_col <- data_names[1]
  
  # clean it, NOTE!! make sure the first character has a 
  # 'i...' at the begining
  clean_first_col <- str_sub(first_col, 4, nchar(first_col))
  
  # assign the clean col name to the first name of the name vector
  data_names[1] <- clean_first_col
  
  # assign df clean col names 
  names(df) <- data_names
  
  return(df)
  
}



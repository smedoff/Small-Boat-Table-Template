
# Creating a folder for the final data set
creating_output_folder.f <- function(table_no){
  
  folder_title <- paste0("Table ", table_no)
  
  table_wd <- file.path("Data", "3 Output Final Data", folder_title)
  
  dir.create(table_wd)
  
}


#---------------
# Saving the final data set in the output folder 

saving_final_data.f <- function(final_data, table_no = table_number){
  
  write_csv(final_data, file.path("Data",
                               "3 Output Final Data",
                               paste0("Table ", table_no),
                               paste0(file_name, ".csv")),
            na = "")
  
  
}
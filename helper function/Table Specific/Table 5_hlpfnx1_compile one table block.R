
# Calculating the variable columns of Table 15

# This function will calculate one row for Table 15.  You will have to run this code on the 
# following data frames 
#  - All Respondents 
#  - By County 
#    - Oahu 
#    - Hawaii 
#    - Maui 
#    - Kauai 
#  - By Primary Fishing Motivation 
#  ... ETC ...



#df <- HI_SMALL_BOAT.df
#type <- "All"

compute_one_block_table05.f <- function(df, type){
  
  # Find first column (# respondance)
  total_resp <- df  %>% 
    select(table_var.v) %>% 
    drop_na() %>% 
    nrow()
  
  # Find # of observations in each Gear-Group 
  variable.l <- lapply(1:length(table_var.v), FUN = function(v){
    
    one_var_val <- unname(table_var.v[v])
    one_var_lab <- names(table_var.v[v])
    
    var_mean <- df %>% 
      dplyr::rename(VAR = one_var_val) %>% 
      summarize(mean(VAR, na.rm = TRUE)) %>% 
      pull(.)
    
    one_var.df <- data.frame(VAR = var_mean) %>% 
      doBy::renameCol("VAR", one_var_lab)
    
    return(one_var.df)
    
  })
  
  variable.df <- do.call("cbind", variable.l)
  
  # Compile one obs
  one_table_block <- data.frame(
    TYPE = type, 
    NO_RESPONDENTS = total_resp) %>% 
    cbind(variable.df)
  
  return(one_table_block)
  
}

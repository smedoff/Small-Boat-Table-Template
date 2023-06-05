
# Calculating the variable columns of Table 18

# This function will calculate one row for Table 18.  You will have to run this code on the 
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

compute_one_block_table07.f <- function(df, type){
  
  # Getting variable details 
  var_values.v <- unname(table_var.v)
  var_names.v <- names(table_var.v)
  all_var <- var_values.v[1]
  
  # Find first column (# respondance)
  df_rename <- df %>% 
    dplyr::rename(ALL_VAR = all_var) 
  
  total_resp <- df_rename %>% 
    dplyr::filter(!is.na(ALL_VAR)) %>% 
    nrow()
  
  # Columns 2 & 3
  all.df <- data.frame(
    TYPE = type, 
    NO_RESPONDENTS = total_resp,
    ALL_MEAN = mean(df_rename$ALL_VAR, na.rm = TRUE),
    ALL_MEDIAN = median(df_rename$ALL_VAR, na.rm = TRUE))

  
  # Columns 4 - 7
  # Find # of observations in each Gear-Group 
  variable.l <- lapply(2:length(table_var.v), FUN = function(v){
    
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
  one_table_block <- all.df %>% 
    cbind(variable.df) %>% 
    select(Type = TYPE,
           "Number of Respondents" = NO_RESPONDENTS,
           "Annual Landings All Species, Mean" = ALL_MEAN,
           "Annual Landings All Species, Median" = ALL_MEDIAN,
           "Annual Landings, Pelagic" = Pelagic,
           "Annual Landings, Bottom" = Deep7,
           "Annual Landings, Shallow" = Shallow,
           "Annual Landings, Reef" = Reef)
  
  return(one_table_block)
  
}

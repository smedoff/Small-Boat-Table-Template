
# Calculating the variable columns of Table 12

# This function will calculate one row for Table 12.  You will have to run this code on the 
# following data frames 
#  - All Respondents 
#  - By County 
#    - Oahu 
#    - Hawaii 
#    - Maui 
#    - Kauai 
#  - By Primary Fishing Motivation 
#  ... ETC ...



# df <- HI_SMALL_BOAT.df
# type <- "ALL"
# variable <- "Q2xMEAN"

compute_one_block_table06.f <- function(df,
                                        type){
  
  #-----------------
  # Obtain Column Variables and names 
  var_vals.v <- unname(table_var.v)
  var_names.v <- names(table_var.v)
  
  COL.df <- data.frame(VARIABLE = var_vals.v,
                       NAMES = var_names.v)
  
  #-----------------
  # Clean column variable 
  # Exclude NA and exclude zeros 
  one_table_variable_col <- df %>% 
    select(var_vals.v) %>% 
    gather(VARIABLE, VALUE, var_vals.v) %>% 
    filter(VALUE != 0) %>% 
    dplyr::group_by(VARIABLE) %>% 
    dplyr::summarize(MEAN_VAL = mean(VALUE, na.rm = TRUE)) %>% 
    right_join(COL.df) %>% 
    select(NAMES, MEAN_VAL) %>% 
    spread(NAMES, MEAN_VAL)

    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(TYPE = type) %>% 
      cbind(one_table_variable_col) %>% 
      select(TYPE, var_names.v)
  
  return(one_table_block)
  
}

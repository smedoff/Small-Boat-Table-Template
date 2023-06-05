
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

compute_one_block_table03a.f <- function(df,
                                         type){
  
  #-----------------
  # Clean variable of interst 
  # Each table will be constructed with respect to a different variable 
  # Each variable will have different labels associated with their variable value 
  # Clean the variable values based on the labels 
  df_categories_defined <- df %>% 
    dplyr::select(BANNER_VAR) %>% 
    drop_na() 
  
  
  #-----------------
  # Create the columns for the data set 
  COL.df <- data.frame(BANNER_VAR = c(1, 2, 3, 4, 5, 6),
                       VARIABLE_GROUPS = c("None", "Very Little", "Some", "About Half",
                                   "Most", "Almost All"))
  
  #------------------
  # Some times the filtered df object does not have any rows
  # return a row of NAs for these cases  
  if(nrow(df_categories_defined) == 0){
    
    # Include the first column of Table 12 
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = c("Number of Respondents",
                                                          COL.df$VARIABLE_GROUPS),
                                      perc = NA)
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(TYPE = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, perc)) %>% 
      mutate(MEAN = NA) %>% 
      select(TYPE, "Number of Respondents", COL.df$VARIABLE_GROUPS, Mean = MEAN)
    
  }else{
    
    # Calc the % trips that belong to trip-groups (defined in df_trip_stats)
    df_group_stats <- df_categories_defined %>% 
      dplyr::group_by(BANNER_VAR) %>% 
      dplyr::summarize(count = n()) %>% 
      mutate(PERC = count/nrow(df_categories_defined)*100) %>% 
      right_join(COL.df) %>% 
      mutate(PERC = replace_na(PERC, 0)) %>% 
      select(VARIABLE_GROUPS, PERC)
    
    # -------
    # Check to make sure the % add up to 100 
    if(!(round(sum(df_group_stats$PERC)) == 100)){
      stop(print("STOP!!! % does not equal 100"))
    }
    
    # Include the first column of Table 12 
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = "Number of Respondents",
                                      PERC = nrow(df_categories_defined)) %>% 
      rbind(df_group_stats)
    
    # Calc mean value excluding zeros 
    mean_var <- paste0(table_var, "MEAN")
    
    data_mean <- df %>% 
      dplyr::rename(MEAN_VAR = mean_var) %>% 
      summarize(AVG = mean(MEAN_VAR, na.rm = TRUE)) %>% 
      pull(.)
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(TYPE = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, PERC)) %>% 
      mutate(MEAN = data_mean) %>% 
      select(TYPE, "Number of Respondents", COL.df$VARIABLE_GROUPS, Mean = MEAN)
    
  }
  
  return(one_table_block)
  
}

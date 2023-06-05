
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

compute_one_block_table02.f <- function(df,
                                        type){
  
  #-----------------
  # Clean variable of interst 
  # Each table will be constructed with respect to a different variable 
  # Each variable will have different labels associated with their variable value 
  # Clean the variable values based on the labels 
  df_categories_defined <- df %>% 
    dplyr::select(BANNER_VAR) %>% 
    drop_na() %>% 
    mutate(VARIABLE_GROUPS = cut(BANNER_VAR, 
                                 breaks = breaks.v,
                                 labels = labels.v)) 
  
  # Some times the filtered df object does not have any rows
  # return a row of NAs for these cases  
  if(nrow(df_categories_defined) == 0){
    
    # Include the first column of Table 12 
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = c("Number of Respondents",
                                                          labels.v),
                                      perc = NA)
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(TYPE = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, perc)) %>% 
      mutate(MEAN = NA)
    
  }else{
    
    # Calc the % trips that belong to trip-groups (defined in df_trip_stats)
    df_group_stats <- df_categories_defined %>% 
      mutate(TOTAL = nrow(df_categories_defined)) %>% 
      group_by(VARIABLE_GROUPS, TOTAL) %>% 
      dplyr::summarize(n = n()) %>% 
      mutate(perc = n/TOTAL*100) %>% 
      select(VARIABLE_GROUPS, perc) 
    
    # -------
    # Make sure we have a complete panel and all groups are present even if they did not have any 
    # data 
    
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = labels.v) %>% 
      left_join(df_group_stats) %>% 
      mutate(perc = replace_na(perc, 0)) 
    
    # Check to make sure the % add up to 100 
    if(!(round(sum(df_group_stats_FULL$perc)) == 100)){
      stop(print("STOP!!! % does not equal 100"))
    }
    
    # Include the first column of Table 12 
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = "Number of Respondents",
                                      perc = nrow(df_categories_defined)) %>% 
      rbind(df_group_stats_FULL)
    
    # Calc mean value excluding zeros 
    data_mean <- df_categories_defined %>% 
      filter(BANNER_VAR > 0) %>% 
      summarize(AVG = mean(BANNER_VAR, na.rm = TRUE)) %>% 
      pull(.)
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(TYPE = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, perc)) %>% 
      mutate(MEAN = data_mean) %>% 
      select(TYPE, "Number of Respondents", labels.v, "Mean (excluse 0)" = MEAN)
    
  }
  
  return(one_table_block)
  
}

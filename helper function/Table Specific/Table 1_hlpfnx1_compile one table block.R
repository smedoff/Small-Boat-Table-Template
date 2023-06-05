
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

compute_one_block_table01.f <- function(df,
                                        type){
  
  #-----------------
  # Clean variable of interst 
  # Each table will be constructed with respect to a different variable 
  # Each variable will have different labels associated with their variable value 
  # Clean the variable values based on the labels 
  df_categories_defined <- df %>% 
    dplyr::select(VARIABLE = table_var) %>% 
    drop_na() %>% 
    mutate(VARIABLE_GROUPS = cut(VARIABLE, 
                                 breaks = breaks.v,
                                 labels = labels.v,
                                 include.lowest = TRUE)) 
  
  # Some times the filtered df object does not have any rows
  # return a row of NAs for these cases  
  if(nrow(df_categories_defined) == 0){
    
    # Include the first column of Table 12 
    df_group_stats_FULL <- data.frame(VARIABLE_GROUPS = c("Number of Respondents",
                                                          labels.v),
                                      perc = NA)
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(Grouping = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, perc)) %>% 
      mutate(Mean = NA,
             Median = NA)
    
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
    
    # Reshape to long format for one observation in Table 12 
    one_table_block <- data.frame(Grouping = type) %>% 
      cbind(spread(df_group_stats_FULL, VARIABLE_GROUPS, perc)) %>% 
      mutate(Mean = mean(df_categories_defined$VARIABLE, na.rm = TRUE),
             Median = median(as.numeric(df_categories_defined$VARIABLE, na.rm = TRUE)))
    
  }
  
  # Re order columns so they match the template
  one_table_block <- one_table_block %>% 
    select("Grouping", "Number of Respondents", labels.v, "Mean", "Median")
  
  return(one_table_block)
  
}


# Calculating the variable columns of Table 32

# This function will calculate one row for Table 32.  

library(plotrix)
options(scipen=999)

#i_vars <- 10
#data.df <- HI_SMALL_BOAT.df
#var.df <- VARS.df

#-----------------------
# Nested function for the main function -- Creating one column of one block

# Example Synthax
# df <- one_var.df
# col_name <- "All Respondents"

creating_one_col.f <- function(df, col_name,
                               var_description.df){
  
  # Calc total respondents (n)
  tot_resp <- data.frame(VARIABLE = unique(var_description.df$DESCRIPTION),
                         VAL_MEANING = "Number of respondents (n)", 
                         PERC = nrow(df))
  
  
  
  #--------
  # All Respondents 
  statistic.df <- df %>% 
    
    # Creating the variable-value stats (this will be the rows in a 
    # specific block)
    dplyr::group_by(VAL_MEANING) %>% 
    dplyr::summarize(COUNT = n()) %>% 
    mutate(PERC = COUNT/tot_resp$PERC * 100) %>% 
    select(VAL_MEANING, PERC) %>% 
    mutate(VARIABLE = NA) 
  
  
  
  # --------
  # Rbind so we have the first column of one table-block
  one_col_full.df <- tot_resp %>% 
    rbind(statistic.df) %>% 
    rbind(data.frame(VARIABLE = NA,
                     VAL_MEANING = "Mean",
                     PERC = mean(df$MEAN_VALUE, na.rm = TRUE))) %>% 
    
    # Remove "Mean" value if its NaN
    filter(PERC != "NaN") %>% 
    doBy::renameCol("PERC", col_name) %>% 
    
    # Re-arrange so the rows in each block are in proper order
    mutate(VAL_MEANING = factor(VAL_MEANING, 
                       levels = c("Number of respondents (n)",
                                  levels(var_description.df$VAL_MEANING),
                                  "Mean"))) %>% 
    arrange(VAL_MEANING) 
  
  return(one_col_full.df)
  
}



#---------------------
# Creating one block 

compute_one_block_table10.f <- function(i_LHS, 
                                        data.df, 
                                        var.l){
  
  print(i_LHS)
  
  # Makre sure VAL_MEANING (row names in each block) is a factor variable 
  # so we can make sure the rows are listed in the right order 
  one_var_description.df <- var.l[[i_LHS]] %>% 
    mutate(VAL_MEANING = factor(VAL_MEANING, levels = unique(VAL_MEANING)))
  
  # Grab the variable name and variable used for averaging for each block
  one_variable <- unique(one_var_description.df$VARIABLE)
  one_average_variable <- unique(one_var_description.df$AVG_VAR)
  one_average_cut_labs <- unique(one_var_description.df$VAL_MEANING)
  
  # Averaging variables can come in three forms 
    # 1. NA - if averaging is not applicable (e.g. fishing motive, catch distribution, etc)
    # 2. VARIABLE != AVG_VAR for categorical variables
    # 3. VARIABLE == AVG_VAR for cont variables 
  if(is.na(one_average_variable)){
    
    # Dealing with 1.
    one_var.df <- data.df %>% 
      dplyr::rename(VALUE = unique(one_var_description.df$VARIABLE)) %>% 
      mutate(MEAN_VALUE = NA) %>% 
      dplyr::filter(!is.na(VALUE), 
                    VALUE >= 0)
  }else{
    
    # Dealing with 3., rename the block variable name and the block variable avg-variable 
    if(one_variable == one_average_variable){
      
      one_var.df <- data.df %>% 
        dplyr::rename(VALUE = unique(one_var_description.df$VARIABLE)) %>% 
        mutate(MEAN_VALUE = VALUE) %>% 
        dplyr::filter(!is.na(VALUE), 
                      VALUE >= 0)
      
    }else{
      # Dealing with 2.
      one_var.df <- data.df %>% 
        dplyr::rename(VALUE = unique(one_var_description.df$VARIABLE)) %>% 
        dplyr::rename(MEAN_VALUE = unique(one_var_description.df$AVG_VAR)) %>% 
        dplyr::filter(!is.na(VALUE), 
                      VALUE >= 0)
    }
    
  }
  
  
  #-----------
  # Attach the right labels to the one_var.df.  These will be the row 
  # names in each block of the final df 
  
  # The variable can either be categorical or continuous.  If its categorical, we 
  # just left_join the data wiht the one_var_description.df to get the 
  # VAL_MEANING (row labels).  If its continuous, use the cut functions to put the values
  # in the proper bins.  
  if("UPPER_BOUND" %in% names(one_var_description.df)){
    
  # Accounting for continuous variables (use cut() instead of left_join())
    # Accoutning for continuous variables that should have a '0' grop in their table block
    if(min(one_var_description.df$UPPER_BOUND) == 0){
      
      one_var_labeled.df <- one_var.df %>% 
        mutate(VAL_MEANING = cut(VALUE, 
                                 breaks = c(-1, one_var_description.df$UPPER_BOUND),
                                 include.lowest = FALSE, 
                                 dig.lab = 7, 
                                 labels = one_average_cut_labs)) %>% 
        # Change the VAL_MEANING == (-1,0] to "0" 
        mutate(VAL_MEANING = ifelse(as.character(VAL_MEANING) == "(-1,0]", 
                                    "0", 
                                    as.character(VAL_MEANING)))
      
      #-------
      one_var_description.df <- one_var_description.df %>% 
        mutate(VAL_MEANING = cut(UPPER_BOUND, 
                                 breaks = c(-1, one_var_description.df$UPPER_BOUND),
                                 include.lowest = FALSE, dig.lab = 7, 
                                 labels = one_average_cut_labs)) %>% 
        # Change the VAL_MEANING == (-1,0] to "0" 
        mutate(VAL_MEANING = ifelse(as.character(VAL_MEANING) == "(-1,0]", 
                                    "0", 
                                    as.character(VAL_MEANING))) %>% 
        mutate(VAL_MEANING = factor(VAL_MEANING, levels = unique(VAL_MEANING)))
      
    }else{
      one_var_labeled.df <- one_var.df %>% 
        mutate(VAL_MEANING = cut(VALUE, 
                                 breaks = c(0, one_var_description.df$UPPER_BOUND),
                                 include.lowest = FALSE, 
                                 dig.lab = 7, 
                                 labels = one_average_cut_labs))
      
      one_var_description.df <- one_var_description.df %>% 
        mutate(VAL_MEANING = cut(UPPER_BOUND, 
                                 breaks = c(0, one_var_description.df$UPPER_BOUND),
                                 include.lowest = FALSE, 
                                 dig.lab = 7, 
                                 labels = one_average_cut_labs))
    }
    
    
  }else{
  # Account for categorical variables   
    one_var_labeled.df <- one_var.df %>% 
      left_join(one_var_description.df)
  }


  
  #--------
  # Creating 'All Respondents' column 
  all_col.df <- creating_one_col.f(df = one_var_labeled.df, 
                                   col_name = "All Respondents",
                                   var_description.df = one_var_description.df) %>% 
    filter(!is.na(VAL_MEANING)) %>% 
    
    # Make sure the rows are in order
    arrange(factor(VAL_MEANING, 
                   levels = c("Number of respondents (n)",
                              levels(one_var_description.df$VAL_MEANING),
                              "Mean")))

  #--------
  # I had issues where not all VAL_MEANINGS had values.  So there were certain 
  # VAL_MEANINGS groups that were missing form the final df.  (E.g., i_LHS = 16)
  # Make sure all bins are present.  If there is no data for that bin, report an NA 
  if(n_distinct(one_var_description.df$VAL_MEANING)+2 != nrow(all_col.df)){
    
    all_col.df <- all_col.df %>% 
      full_join(one_var_description.df %>% 
                  select(VAL_MEANING) %>% 
                  unique()) %>%
      arrange(factor(VAL_MEANING, 
                     levels = c("Number of respondents (n)",
                                levels(one_var_description.df$VAL_MEANING),
                                "Mean")))
    
  }
  
  #--------
  # Creating values for each column of the banner variable 
  col_variables <- table_var.v[setdiff(names(table_var.v), "Banner")]
  
  banner_col.l <- lapply(1:length(col_variables), FUN = function(i_banner){
    
    one_banner <- col_variables[i_banner]
    banner_val <- unname(one_banner)
    banner_name <- names(one_banner)
    
    #-----------------
    # Only include expenses >= 0 
    col_total.df <- one_var_labeled.df %>% 
      dplyr::rename(BANNER_VAR = banner_name) %>% 
      filter(BANNER_VAR == banner_val) 
    
    one_col.df <- creating_one_col.f(df = col_total.df, 
                                     col_name = banner_name,
                                     var_description.df = one_var_description.df)
    
    return(one_col.df)
    })
  
  banner_col.df <- purrr::reduce(banner_col.l, left_join)
  
  
  #-------------
  # Piecing everything together to make one block of the table 
  one_block.df <- all_col.df %>% 
    left_join(banner_col.df)
    
  #-------------
  # Clean up the column names 
  col_names.v <- names(one_block.df)
  final_col_names.v <- c(NA, NA, col_names.v[-(1:2)])
  
  names(one_block.df) <- final_col_names.v
  
  
  return(one_block.df)
  
}



compute_one_block_table11.f <- function(i_LHS, 
                                                                                                       perc_denominator_var){

  #---------
  # Grab one table-block variable
  oneLHS <- VARS.df[i_LHS, ]
  
  
  # Rename all variables used for the table 
  EXP_RENAME.df <- EXPENDITURE.df %>% 
    dplyr::select(category_var = oneLHS$Variable,
                  banner_var = banner_var,
                  total_cost = perc_denominator_var) %>% 
    filter(banner_var %in% banner_vals.v) 
  
  
  # Calc table
  one_BLOCK <- EXP_RENAME.df %>% 
    group_by(banner_var) %>% 
    dplyr::summarize(COUNT = n(),
                     MEAN = mean(category_var),
                     SE = std.error(category_var),
                     MEDIAN = median(category_var),
                     PERC = MEAN/mean(total_cost)*100) %>% 
    left_join(data.frame(banner_var = as.integer(banner_vals.v),
                         Description = banner_labs.v)) %>% 
    cbind(CATEGORY = c(oneLHS$Description, 
                       rep(NA, length(banner_labs.v)-1)))  %>% 
    select(CATEGORY, Description, COUNT,MEAN, SE, MEDIAN, PERC)
  
  names(one_BLOCK) <- c("Category", "Description", "Number of respondents",
                        "Mean", "Standard error", "Median", "Percentage of total cost")
  
  return(one_BLOCK)
  
}

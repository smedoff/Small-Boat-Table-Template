
# This function is used for all 09 tables

library(plotrix)

#i_vars <- 10
#data.df <- HI_SMALL_BOAT.df
#var.df <- VARS.df

compute_one_block_table09ab.f <- function(i_vars, 
                                       data.df, 
                                       var.df){
  
  print(i_vars)
  
  one_var <- var.df[i_vars, ]$Variable
  one_descrip <- var.df[i_vars, ]$Description
  
  #--------
  one_var.df <- data.df %>% 
    dplyr::rename(BANNER_VAR = banner_var,
                  ONE_VAR = one_var) %>% 
    filter(!is.na(ONE_VAR))
  
  #-----------------
  if(table_number == "9b"){
    
    # Only include expenses >= 0 
    one_var.df <- one_var.df %>% 
      filter(#BANNER_VAR > 0,
             ONE_VAR > 0)
    
  }

  #--------
  # All Respondents - we just want the number of people that responded
  # NOT the number of people that had expenditures >= or > than 0
  all.df <- one_var.df %>% 
    dplyr::summarise(COUNT = n(),
                     MEAN = mean(ONE_VAR, na.rm = TRUE),
                     SE = plotrix::std.error(ONE_VAR),
                     MEDIAN = median(ONE_VAR, na.rm = TRUE)) %>% 
    mutate(DESCRIPTION = "All Respondents") %>% 
    gather(STATISTIC, VALUE, COUNT, MEAN, SE, MEDIAN) %>% 
    spread(DESCRIPTION, VALUE) %>% 
    arrange(factor(STATISTIC, levels = c("COUNT", "MEAN", "SE", "MEDIAN")))
  
  
  #--------
  # Creating values for each column of the banner variable 
  
  # Define banner values
  banner.df <- data.frame(BANNER_VAR = as.integer(unname(table_var.v[-1])) ,
                          DESCRIPTION = names(table_var.v[-1]))
  
  #-----------------
  # Only include expenses >= 0 
  banner_col.df <- one_var.df %>%
    group_by(BANNER_VAR) %>% 
    dplyr::summarise(COUNT = n(),
                     MEAN = mean(ONE_VAR, na.rm = TRUE),
                     SE = plotrix::std.error(ONE_VAR),
                     MEDIAN = median(ONE_VAR, na.rm = TRUE)) %>% 
    right_join(banner.df) %>% 
    select(-BANNER_VAR) %>% 
    gather(STATISTIC, VALUE, COUNT, MEAN, SE, MEDIAN) %>% 
    spread(DESCRIPTION, VALUE)
  
  one_block.df <- data.frame(VARIABLE = c(one_descrip, NA, NA, NA)) %>% 
    cbind(all.df %>% 
            left_join(banner_col.df) %>% 
            mutate(STATISTIC = ifelse(STATISTIC == "COUNT", "Number of Respondents",
                                      ifelse(STATISTIC == "MEAN", "Mean",
                                             ifelse(STATISTIC == "MEDIAN", "Median",
                                                    "Standard Error"))))) %>% 
    select(Variable = VARIABLE, 
           Statistic = STATISTIC, 
           "All Respondents", 
           names(table_var.v)[-1])
  
  
  
  return(one_block.df)
  
}

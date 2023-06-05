
# This function is used for all 09 tables

library(plotrix)

#i_vars <- 10
#data.df <- HI_SMALL_BOAT.df
#var.df <- VARS.df

compute_one_block_table09c.f <- function(i_vars, 
                                       data.df, 
                                       var.df){
  
  print(i_vars)
  
  one_var <- var.df[i_vars, ]$Variable
  one_descrip <- var.df[i_vars, ]$Description
  
  col_vars.v <- table_var.v[-1]
  
  one_var.df <- data.df %>% 
    select(names(col_vars.v), 
           ONE_VAR = one_var) %>% 
    filter(ONE_VAR >= 0,
           !is.na(ONE_VAR))
  
  
  #--------
  # All Respondents 
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
  banner_col.l <- lapply(1:length(col_vars.v), FUN = function(b){
    
    one_banner_name <- names(col_vars.v)[b]
    one_banner_value <- unname(col_vars.v)[b]
    
    one_col.df <- one_var.df %>% 
      select(ONE_BANNER = one_banner_name, 
             ONE_VAR) %>% 
      filter(ONE_BANNER == one_banner_value) %>% 
      group_by(ONE_BANNER) %>% 
      dplyr::summarise(COUNT = n(),
                       MEAN = mean(ONE_VAR, na.rm = TRUE),
                       SE = plotrix::std.error(ONE_VAR),
                       MEDIAN = median(ONE_VAR, na.rm = TRUE)) %>% 
      mutate(DESCRIPTION = one_banner_name) %>%
      gather(STATISTIC, VALUE, COUNT, MEAN, SE, MEDIAN) %>% 
      spread(DESCRIPTION, VALUE) %>% 
      select(-ONE_BANNER)
    
    return(one_col.df)
  })
  
  banner_col.df <- purrr::reduce(banner_col.l, left_join)
  
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

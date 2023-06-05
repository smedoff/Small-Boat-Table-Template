

# Did not finish!! Revise so its in the same formate as the workbook


rm(list=ls())

table_details_master.l <- list(
  
  list(table_variable = "Q2xMEAN",
       binned_values = c(-1, 11, 24, 49, 99, 500),
       label_values = c("C2:fewer than 12", "C3:12-24", "C4:25-49", "C5:50-99", "C6:100+")),
  
  list(table_variable = "TOTALCaught",
       binned_values = c(-1, 50, 100, 500, 1000, 5000, 100000),
       label_values = c("C2:1-50 (lbs)", "C3:51-100 (lbs)", "C4:101-500 (lbs)", "C5:501-1000 (lbs)", 
                        "C6:1000-5000 (lbs)", "C7:5000+ (lbs)")),
  
  list(table_variable = "Q10xMEAN",
       binned_values = c(-1, 50, 100, 500, 1000, 5000, 100000),
       label_values = c("C2:1-50 (lbs)", "C3:51-100 (lbs)", "C4:101-500 (lbs)", "C5:501-1000 (lbs)", 
                        "C6:1000-5000 (lbs)", "C7:5000+ (lbs)")),
  
  list(table_variable = "Q11xMEAN",
       binned_values = c(-1, 50, 100, 500, 1000, 5000, 100000),
       label_values = c("C2:1-50 (lbs)", "C3:51-100 (lbs)", "C4:101-500 (lbs)", "C5:501-1000 (lbs)", 
                        "C6:1000-5000 (lbs)", "C7:5000+ (lbs)")),
  
  list(table_variable = "Q12xMEAN",
       binned_values = c(-1, 50, 100, 500, 1000, 5000, 100000),
       label_values = c("C2:1-50 (lbs)", "C3:51-100 (lbs)", "C4:101-500 (lbs)", "C5:501-1000 (lbs)", 
                        "C6:1000-5000 (lbs)", "C7:5000+ (lbs)")),
  
  list(table_variable = "Q13xMEAN",
       binned_values = c(-1, 50, 100, 500, 1000, 5000, 100000),
       label_values = c("C2:1-50 (lbs)", "C3:51-100 (lbs)", "C4:101-500 (lbs)", "C5:501-1000 (lbs)", 
                        "C6:1000-5000 (lbs)", "C7:5000+ (lbs)")),
  
  list(table_variable = "Q20xMEAN",
       binned_values = c(-1, 100, 500, 1000, 2000, 5000, 10000, 20000, 50000, 500000),
       label_values = c("C2:1-100 ($)", "C3:101-500 ($)", "C4:501-1000 ($)", "C5:1001-2000 ($)",
                        "C6:2001-5000 ($)", "C7:5001-10,000 ($)", "C8:10,001-20,000 ($)",
                        "C9:20,001-50,000 ($)", "C10:50,000+ ($)")),
  
  list(table_variable = "Q21.1xVALUE",
       binned_values = c(-1, 100, 500, 1000, 2000, 5000, 10000, 20000, 50000, 500000),
       label_values = c("C2:1-100 ($)", "C3:101-500 ($)", "C4:501-1000 ($)", "C5:1001-2000 ($)",
                        "C6:2001-5000 ($)", "C7:5001-10,000 ($)", "C8:10,001-20,000 ($)",
                        "C9:20,001-50,000 ($)", "C10:50,000+ ($)")), 
  
  list(table_variable = "Q21.2xVALUE",
       binned_values = c(-1, 100, 500, 1000, 2000, 5000, 10000, 20000, 50000, 500000),
       label_values = c("C2:1-100 ($)", "C3:101-500 ($)", "C4:501-1000 ($)", "C5:1001-2000 ($)",
                        "C6:2001-5000 ($)", "C7:5001-10,000 ($)", "C8:10,001-20,000 ($)",
                        "C9:20,001-50,000 ($)", "C10:50,000+ ($)")),
  
  list(table_variable = "Q21.3xVALUE",
       binned_values = c(-1, 100, 500, 1000, 2000, 5000, 10000, 20000, 50000, 500000),
       label_values = c("C2:1-100 ($)", "C3:101-500 ($)", "C4:501-1000 ($)", "C5:1001-2000 ($)",
                        "C6:2001-5000 ($)", "C7:5001-10,000 ($)", "C8:10,001-20,000 ($)",
                        "C9:20,001-50,000 ($)", "C10:50,000+ ($)")),
  
  list(table_variable = "Q21.4xVALUE",
       binned_values = c(-1, 100, 500, 1000, 2000, 5000, 10000, 20000, 50000, 500000),
       label_values = c("C2:1-100 ($)", "C3:101-500 ($)", "C4:501-1000 ($)", "C5:1001-2000 ($)",
                        "C6:2001-5000 ($)", "C7:5001-10,000 ($)", "C8:10,001-20,000 ($)",
                        "C9:20,001-50,000 ($)", "C10:50,000+ ($)")),
  
  list(table_variable = "Q9x",
       binned_values = c(-1, 1, 2, 3, 10),
       label_values = c("C2:1 (person)", "C3:2 (person)", "C4:3 (person)", "C5:4+ (person)")),
  
  list(table_variable = "q16.1x",
       binned_values = c(-1, 49, 59, 69, 79, 89, 100),
       label_values = c("C2:1-49 (%)", "C3:50-59 (%)", "C4:60-69 (%)", 
                        "C5:70-79 (%)", "C6:80-89 (%)", "C7:90-100 (%)")),
  
  list(table_variable = "q16.2x",
       binned_values = c(-1, 50, 100),
       label_values = c("C2:1-50 (%)", "C3:51-100 (%)")), 
  
  list(table_variable = "CatchPerTrip",
       binned_values = c(-1, 20.4, 50.4, 100.4, 1000),
       label_values = c("C2:0-20.4", "C3:20.5-50.4", "C4:50.5-100.4", "C5:100.5+")),
  
  list(table_variable = "ValuePerTrip",
       binned_values = c(-1, 20.4, 50.4, 100.4, 10000),
       label_values = c("C2:0-20.4", "C3:20.5-50.4", "C4:50.5-100.4", "C5:100.5+"))  
)


#--------------------------------------
# Write the xlsx workbook 
library(openxlsx)

wb <- createWorkbook()


for(i in 1:length(table_details_master.l)){
  
  one_sheet <- table_details_master.l[[i]]
  sheet_name <- unique(one_sheet$table_variable)
  
  addWorksheet(wb = wb, sheetName = sheet_name, gridLines = FALSE)
  writeDataTable(wb = wb, sheet = i, x = one_sheet)
  
}


saveWorkbook(wb, file.path(".", "Data", "2 Input Variable Parameters", "Table 10_lhs_block1.xlsx"), 
             overwrite = TRUE)


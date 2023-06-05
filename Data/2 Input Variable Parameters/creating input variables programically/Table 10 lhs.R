
# The purpose of this code is to help make the LHS input variables for table 10 


# 1.
boat_trips.df <- data.frame(VARIABLE = "Q2xRANGE",
                            VALUE = c(1, 2, 3, 4, 5),
                            VAL_MEANING = paste(c("< 11", "12-24", "25-49", "50-99", "100+"),
                                                " trips"),
                            AVG_VAR = "Q2xMEAN",
                            DESCRIPTION = "Number of BOAT fishing trips (%)")

# 2.
numb_gear.df <- data.frame(VARIABLE = "CountQ3",
                           VALUE = c(1, 2, 3, 4, 5, 6),
                           VAL_MEANING = c("One", "Two", "Three", "Four", "Five+", "Five+"),
                           AVG_VAR = "CountQ3",
                           DESCRIPTION = "Number of gears used")

# 3.
numb_ppl.df <- data.frame(VARIABLE = "Q9x",
                          VALUE = 1:10,
                          VAL_MEANING = c("One", "Two", "Three", "Four", "Five+", "Five+", "Five+", "Five+", "Five+", "Five+"),
                          AVG_VAR = "Q9x",
                          DESCRIPTION = "Number of people (including yourself) on board for an average trip")

# 4.
other_use.df <- data.frame(VARIABLE = "Q24x",
                           VALUE = 1:6,
                           VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                           "60%-89%+", "90%-100%+"),
                           AVG_VAR = "Q24xMEAN",
                           DESCRIPTION = "Others use boat without you")

# 5.
agg_devices_trips.df <- data.frame(VARIABLE = "Q14x",
                                   VALUE = 1:6,
                                   VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                   "60%-89%+", "90%-100%+"),
                                   AVG_VAR = "Q14xMEAN",
                                   DESCRIPTION = "Percent of fishing trips fished at Fishing Aggregating Devices")

# 6.
agg_devices_time.df <- data.frame(VARIABLE = "Q14ax",
                                  VALUE = 1:6,
                                  VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                  "60%-89%+", "90%-100%+"),
                                  AVG_VAR = "Q14axMEAN",
                                  DESCRIPTION = "Percent of fishing time fished at Fish Aggregating Devices")

# 7.
pelagic_percent_sold.df <- data.frame(VARIABLE = "Q21.1x",
                                      VALUE = 1:6,
                                      VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                      "60%-89%+", "90%-100%"),
                                      AVG_VAR = "Q21.1xMEAN",
                                      DESCRIPTION = "Percent of value of fish sold from pelagic fish")

# 8.
bottom_percent_sold.df <- data.frame(VARIABLE = "Q21.2x",
                                     VALUE = 1:6,
                                     VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                     "60%-89%+", "90%-100%"),
                                     AVG_VAR = "Q21.2xMEAN",
                                     DESCRIPTION = "Percent of value of fish sold from deep 7 fish")

# 9.
shallow_percent_sold.df <- data.frame(VARIABLE = "Q21.3x",
                                      VALUE = 1:6,
                                      VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                      "60%-89%+", "90%-100%"),
                                      AVG_VAR = "Q21.3xMEAN",
                                      DESCRIPTION = "Percent of value of fish sold from shallow bottomfish")

# 10.
reef_percent_sold.df <- data.frame(VARIABLE = "Q21.4x",
                                   VALUE = 1:6,
                                   VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                   "60%-89%+", "90%-100%"),
                                   AVG_VAR = "Q21.4xMEAN",
                                   DESCRIPTION = "Percent of value of fish sold from nearshore and reef fish")

# 11.
income_percent_sold_fish.df <- data.frame(VARIABLE = "Q22x",
                                          VALUE = 1:6,
                                          VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                          "60%-89%+", "90%-100%"),
                                          AVG_VAR = "Q22xMEAN",
                                          DESCRIPTION = "Percent of income from the sale of fish")

# 12.
state_water_trips.df <- data.frame(VARIABLE = "Q8.1x",
                                   VALUE = 1:6,
                                   VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                   "60%-89%+", "90%-100%"),
                                   AVG_VAR = "Q8.1xMEAN",
                                   DESCRIPTION = "Percent of your fishing trips occurred in state waters")

# 13.
federal_water_trips.df <- data.frame(VARIABLE = "Q8.2x",
                                     VALUE = 1:6,
                                     VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                     "60%-89%+", "90%-100%"),
                                     AVG_VAR = "Q8.2xMEAN",
                                     DESCRIPTION = "Percent of your fishing trips occured in federal waters")

# 14.
home_consumption.df <- data.frame(VARIABLE = "Q17.1x",
                                  VALUE = 1:6,
                                  VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                  "60%-89%+", "90%-100%"),
                                  AVG_VAR = "Q17.1xMEAN",
                                  DESCRIPTION = "Catch disposition, consumed at home")

# 15.
given_away_consumption.df <- data.frame(VARIABLE = "Q17.2x",
                                        VALUE = 1:6,
                                        VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                        "60%-89%+", "90%-100%"),
                                        AVG_VAR = "Q17.2xMEAN",
                                        DESCRIPTION = "Catch disposition, consumed at home")

# 16.
released_not_consumed.df <- data.frame(VARIABLE = "Q17.3x",
                                       VALUE = 1:6,
                                       VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                       "60%-89%+", "90%-100%"),
                                       AVG_VAR = "Q17.3xMEAN",
                                       DESCRIPTION = "Catch disposition, caught and released")

# 17.
sold.df <- data.frame(VARIABLE = "Q17.4x",
                      VALUE = 1:6,
                      VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                      "60%-89%+", "90%-100%"),
                      AVG_VAR = "Q17.4xMEAN",
                      DESCRIPTION = "Catch disposition, sold")

# 18.
wholesaler.df <- data.frame(VARIABLE = "Q19.1x",
                            VALUE = 1:6,
                            VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                            "60%-89%+", "90%-100%"),
                            AVG_VAR = "Q19.1xMEAN",
                            DESCRIPTION = "Market outlet: seafood dealer/wholesaler")

# 19.
auction.df <- data.frame(VARIABLE = "Q19.2x",
                         VALUE = 1:6,
                         VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                         "60%-89%+", "90%-100%"),
                         AVG_VAR = "Q19.2xMEAN",
                         DESCRIPTION = "market outlet: Auction")

# 20.
restaurants.df <- data.frame(VARIABLE = "Q19.3x",
                             VALUE = 1:6,
                             VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                             "60%-89%+", "90%-100%"),
                             AVG_VAR = "Q19.3xMEAN",
                             DESCRIPTION = "market outlet: Restaurants/stores")

# 21.
farmers_market.df <- data.frame(VARIABLE = "Q19.4x",
                                VALUE = 1:6,
                                VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                                "60%-89%+", "90%-100%"),
                                AVG_VAR = "Q19.4xMEAN",
                                DESCRIPTION = "Marte outlet: Roadside/farmers' market")

# 22.
friends.df <- data.frame(VARIABLE = "Q19.5x",
                         VALUE = 1:6,
                         VAL_MEANING = c("0%", "1%-9%", "10%-39%", "40%-59%", 
                                         "60%-89%+", "90%-100%"),
                         AVG_VAR = "Q19.5xMEAN",
                         DESCRIPTION = "Market outlet: Friends/neighbors/coworkers")

#----------
# Variables without means

# 23.
catch_distribution.df <- data.frame(VARIABLE = "Q16x",
                                    VALUE = 1:5,
                                    VAL_MEANING = c("I kept all the fish",
                                                    "I kept/received some % of total fish caught",
                                                    "I kept/received some % of trip revenue",
                                                    "Don't know",
                                                    "Other"),
                                    AVG_VAR = NA,
                                    DESCRIPTION = "Catch distribution")

# 24.
sold_fish.df <- data.frame(VARIABLE = "Q18x",
                           VALUE = c(0, 1),
                           VAL_MEANING = c("No",
                                           "Yes"),
                           AVG_VAR = NA,
                           DESCRIPTION = "Sold fish")

# 25.
boat_ownership.df <- data.frame(VARIABLE = "Q23x",
                                VALUE = c(0, 1),
                                VAL_MEANING = c("No",
                                                "Yes"),
                                AVG_VAR = NA,
                                DESCRIPTION = "Own boat that fish on")

# 26.
race.df <- data.frame(VARIABLE = "Ethnic",
                      VALUE = c(2, 4, 5, 6, 7),
                      VAL_MEANING = c("Asian",
                                      "Native Hawaiian",
                                      "Other Pacific Islander",
                                      "White",
                                      "Mixed"),
                      AVG_VAR = NA,
                      DESCRIPTION = "Race")

# 27.
age.df <- data.frame(VARIABLE = "Q36x",
                     VALUE = c(1, 2, 3, 4, 5, 6),
                     VAL_MEANING = c("< 25 years",
                                     "25-34 years",
                                     "35-44 years",
                                     "45-54 years",
                                     "55-64 years",
                                     "65+ years"),
                     AVG_VAR = NA,
                     DESCRIPTION = "Age")

# 28.
education.df <- data.frame(VARIABLE = "Q40x",
                           VALUE = c(1, 2, 3, 4, 5, 6, 7),
                           VAL_MEANING = c("< High School Grad",
                                           "< High School Grad",
                                           "High School Grad",
                                           "Some Collage/Associates Degree",
                                           "Some Collage/Associates Degree",
                                           "BA and Higher",
                                           "BA and Higher"),
                           AVG_VAR = NA,
                           DESCRIPTION = "Education")


# 29.
fishing_motivation.df <- data.frame(VARIABLE = "Q15_Primary_Report",
                                    VALUE = c(1, 2, 3, 4, 5, 6),
                                    VAL_MEANING = c("Recreational Expense",
                                                    "Part-Time Commercial",
                                                    "Subsistence",
                                                    "Full-Time Commercial",
                                                    "Purely Recreational",
                                                    "Cultural"),
                                    AVG_VAR = NA,
                                    DESCRIPTION = "Primary fishing motivation")

# 30.
income.df <- data.frame(VARIABLE = "Q41x",
                        VALUE = c(1, 2, 3, 4, 5, 6),
                        VAL_MEANING = c("<$10k", 
                                        "$10k-$24999", 
                                        "$25k-$49999", 
                                        "$50k-$99999",
                                        "$100k-$249999", 
                                        "$250k+"),
                        AVG_VAR = NA,
                        DESCRIPTION = "Income")

# ----------------------
# Continuous variables

# 31.
landings_fish.df <- data.frame(VARIABLE = "TOTALCaught",
                               UPPER_BOUND = c(50, 100, 500, 1000, 5000, 1000000),
                               VAL_MEANING = c("1 to 50", "51 to 100", "101 to 500", "501 to 1000", 
                                               "1001 to 5000", "5000+"),
                               AVG_VAR = "TOTALCaught",
                               DESCRIPTION = "Annual landings of fish")

# 32.
landings_pelagic.df <- data.frame(VARIABLE = "Q10xMEAN",
                                  UPPER_BOUND = c(0, 50, 100, 500, 1000, 5000, 1000000),
                                  VAL_MEANING = c("0", "1 to 50", "51 to 100", "101 to 500", "501 to 1000", 
                                                  "1001 to 5000", "5000+"),
                                  AVG_VAR = "Q10xMEAN",
                                  DESCRIPTION = "Annual landings of pelagic fish")

# 33.
landings_bottom.df <- data.frame(VARIABLE = "Q11xMEAN",
                                 UPPER_BOUND = c(0, 50, 100, 500, 1000, 5000, 50000),
                                 VAL_MEANING = c("0", "1 to 50", "51 to 100", "101 to 500", "501 to 1000", 
                                                 "1001 to 5000", "5000+"),
                                 AVG_VAR = "Q11xMEAN",
                                 DESCRIPTION = "Annual landings of deep 7 bottomfish")

# 34.
landings_shallow.df <- data.frame(VARIABLE = "Q12xMEAN",
                                  UPPER_BOUND = c(0, 50, 100, 500, 1000, 5000, 50000),
                                  VAL_MEANING = c("0", "1 to 50", "51 to 100", "101 to 500", "501 to 1000", 
                                                  "1001 to 5000", "5000+"),
                                  AVG_VAR = "Q12xMEAN",
                                  DESCRIPTION = "Annual landings of shallow bottomfish")

# 35.
landings_reef.df <- data.frame(VARIABLE = "Q13xMEAN",
                               UPPER_BOUND = c(0, 50, 100, 500, 1000, 5000, 50000),
                               VAL_MEANING = c("0", "1 to 50", "51 to 100", "101 to 500", "501 to 1000", 
                                               "1001 to 5000", "5000+"),
                               AVG_VAR = "Q13xMEAN",
                               DESCRIPTION = "Annual landings of near shore & reef fish")

# 36.
fish_sold_total.df <- data.frame(VARIABLE = "Q20xMEAN",
                                 UPPER_BOUND = c(100, 500, 1000, 2000, 
                                                 5000, 10000, 20000, 50000, 500000),
                                 VAL_MEANING = c("1 to 100 ($)", "101 to 500 ($)", "501 to 1000 ($)", 
                                                 "1001 to 2000 ($)", "2001 to 5000 ($)", "5001 to 10000 ($)", 
                                                 "10001 to 20000 ($)", "20001 to 50000 ($)", "50000+ ($)"),
                                 AVG_VAR = "Q20xMEAN",
                                 DESCRIPTION = "Total value of fish sold")

# 37.
pelagic_sold_total.df <- data.frame(VARIABLE = "Q21.1xVALUE",
                                    UPPER_BOUND = c(0, 100, 500, 1000, 2000, 
                                                    5000, 10000, 20000, 50000, 500000),
                                    VAL_MEANING = c("0 ($)", "1 to 100 ($)", "101 to 500 ($)", "501 to 1000 ($)", 
                                                    "1001 to 2000 ($)", "2001 to 5000 ($)", "5001 to 10000 ($)", 
                                                    "10001 to 20000 ($)", "20001 to 50000 ($)", "50000+ ($)"),
                                    AVG_VAR = "Q21.1xVALUE",
                                    DESCRIPTION = "Total value of fish sold from Pelagic fish")

# 38.
bottom_sold_total.df <- data.frame(VARIABLE = "Q21.2xVALUE",
                                   UPPER_BOUND = c(0, 100, 500, 1000, 2000, 
                                                   5000, 10000, 20000, 50000, 500000),
                                   VAL_MEANING = c("0 ($)", "1 to 100 ($)", "101 to 500 ($)", "501 to 1000 ($)", 
                                                   "1001 to 2000 ($)", "2001 to 5000 ($)", "5001 to 10000 ($)", 
                                                   "10001 to 20000 ($)", "20001 to 50000 ($)", "50000+ ($)"),
                                   AVG_VAR = "Q21.2xVALUE",
                                   DESCRIPTION = "Total vlaue of fish sold from deep 7 bottomfish")

# 39.
shallow_sold_total.df <- data.frame(VARIABLE = "Q21.3xVALUE",
                                    UPPER_BOUND = c(0, 100, 500, 1000, 2000, 
                                                    5000, 10000, 20000, 50000, 500000),
                                    VAL_MEANING = c("0 ($)", "1 to 100 ($)", "101 to 500 ($)", "501 to 1000 ($)", 
                                                    "1001 to 2000 ($)", "2001 to 5000 ($)", "5001 to 10000 ($)", 
                                                    "10001 to 20000 ($)", "20001 to 50000 ($)", "50000+ ($)"),
                                    AVG_VAR = "Q21.3xVALUE",
                                    DESCRIPTION = "Total value of fish sold from shallow bottomfish")

# 40.
reef_sold_total.df <- data.frame(VARIABLE = "Q21.4xVALUE",
                                 UPPER_BOUND = c(0, 100, 500, 1000, 2000, 
                                                 5000, 10000, 20000, 50000, 500000),
                                 VAL_MEANING = c("0 ($)", "1 to 100 ($)", "101 to 500 ($)", "501 to 1000 ($)", 
                                                 "1001 to 2000 ($)", "2001 to 5000 ($)", "5001 to 10000 ($)", 
                                                 "10001 to 20000 ($)", "20001 to 50000 ($)", "50000+ ($)"),
                                 AVG_VAR = "Q21.4xVALUE",
                                 DESCRIPTION = "Total value of fish sold from Nearshore and reef fish")




#-----------------
LHS_CATEGORY.l <- list(boat_trips.df,
                   numb_gear.df,
                   numb_ppl.df,
                   other_use.df,
                   agg_devices_trips.df,
                   agg_devices_time.df,
                   pelagic_percent_sold.df,
                   bottom_percent_sold.df,
                   shallow_percent_sold.df,
                   reef_percent_sold.df,
                   income_percent_sold_fish.df,
                   state_water_trips.df,
                   federal_water_trips.df,
                   home_consumption.df,
                   given_away_consumption.df,
                   released_not_consumed.df,
                   sold.df,
                   wholesaler.df,
                   auction.df,
                   restaurants.df,
                   farmers_market.df,
                   friends.df,
                   catch_distribution.df,
                   sold_fish.df,
                   boat_ownership.df,
                   race.df,
                   age.df,
                   education.df,
                   fishing_motivation.df,
                   income.df)

LHS_CONTINUOUS.l <- list(landings_fish.df,
                       landings_pelagic.df,
                       landings_bottom.df,
                       landings_shallow.df,
                       landings_reef.df,
                       fish_sold_total.df,
                       pelagic_sold_total.df,
                       bottom_sold_total.df,
                       shallow_sold_total.df,
                       reef_sold_total.df)




rm(boat_trips.df, numb_gear.df, numb_ppl.df, other_use.df, agg_devices_trips.df, 
   agg_devices_time.df, landings_fish.df, landings_pelagic.df, landings_bottom.df,
   landings_shallow.df, landings_reef.df, fish_sold_total.df, pelagic_percent_sold.df,
   bottom_percent_sold.df, shallow_percent_sold.df, reef_percent_sold.df,
   pelagic_sold_total.df, bottom_sold_total.df, shallow_sold_total.df,
   reef_sold_total.df, income_percent_sold_fish.df, state_water_trips.df,
   federal_water_trips.df, home_consumption.df, given_away_consumption.df,
   released_not_consumed.df, sold.df, wholesaler.df, auction.df, restaurants.df,
   farmers_market.df, friends.df, catch_distribution.df, sold_fish.df,
   boat_ownership.df, race.df, age.df, income.df, education.df, fishing_motivation.df)


#--------------------------------------
# Write the xlsx workbook 
library(openxlsx)

wb <- createWorkbook()

# Creating workbook for categorical variables
for(i in 1:length(LHS_CATEGORY.l)){
  
  one_sheet <- LHS_CATEGORY.l[[i]]
  sheet_name <- unique(one_sheet$VARIABLE)
  
  addWorksheet(wb = wb, sheetName = sheet_name, gridLines = FALSE)
  writeDataTable(wb = wb, sheet = i, x = one_sheet)
  
}


saveWorkbook(wb, file.path(".", "Data", "2 Input Variable Parameters", "Table 10_lhs_category1.xlsx"), 
             overwrite = TRUE)

#---------
# Creating workbook for continuous variables 
wb <- createWorkbook()

# Creating workbook for categorical variables
for(i in 1:length(LHS_CONTINUOUS.l)){
  
  one_sheet <- LHS_CONTINUOUS.l[[i]]
  sheet_name <- unique(one_sheet$VARIABLE)
  
  addWorksheet(wb = wb, sheetName = sheet_name, gridLines = FALSE)
  writeDataTable(wb = wb, sheet = i, x = one_sheet)
  
}


saveWorkbook(wb, file.path(".", "Data", "2 Input Variable Parameters", "Table 10_lhs_continuous1.xlsx"), 
             overwrite = TRUE)


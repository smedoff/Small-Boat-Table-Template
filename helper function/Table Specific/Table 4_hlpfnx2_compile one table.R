


# Replicating Table 14

library(tidyverse)
library(dplyr)
library(plyr)
library(utils)



compile_one_table04.f <- function(){
  
  
  
  #-----------------
  # All Respondents
  #-----------------
  
  ALL.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df, 
                                        type = "ALL")
  
  TABLE <- ALL.df %>% 
    rbind.fill(data.frame(TYPE = "By County"))
  
  rm(ALL.df)
  
  #-----------------
  # By County 
  #-----------------
  
  # Oahu 
  OAHU.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                           filter(county == 1), 
                                         type = "Oahu")
  
  # Hawaii 
  HAWAII.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                             filter(county == 2), 
                                           type = "Hawaii")
  
  # Maui 
  MAUI.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                           filter(county == 3), 
                                         type = "Maui")
  
  # Kauai 
  KAUAI.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                            filter(county == 4), 
                                          type = "Kauai")
  
  TABLE <- TABLE %>% 
    rbind(OAHU.df) %>% 
    rbind(HAWAII.df) %>% 
    rbind(MAUI.df) %>% 
    rbind(KAUAI.df) %>% 
    rbind.fill(data.frame(TYPE = "By Primary Fishing Motivation"))
  
  rm(OAHU.df, HAWAII.df, MAUI.df, KAUAI.df)
  
  #-----------------
  # By Primary Fishing Motivation
  #-----------------
  
  # Recreational Expenses  
  REC_EXP.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                              filter(Q15_Primary == 2), 
                                            type = "Recreational Expense")
  
  # Part-time Commercial 
  PT_COM.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                             filter(Q15_Primary == 5), 
                                           type = "Part-Time Commercial")
  
  # Subsistence  
  SUBS.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                           filter(Q15_Primary == 3), 
                                         type = "Subsistence")
  
  # Full-Time Commercial 
  FT_COM.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                             filter(Q15_Primary == 6), 
                                           type = "Full-Time Commercial")
  
  # Purely Recreational
  REC.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                          filter(Q15_Primary == 1), 
                                        type = "Purely Recreational")
  
  # Cultural 
  CULT.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                           filter(Q15_Primary == 4), 
                                         type = "Cultural")
  
  TABLE <- TABLE %>% 
    rbind(REC_EXP.df) %>% 
    rbind(PT_COM.df) %>% 
    rbind(SUBS.df) %>% 
    rbind(FT_COM.df) %>% 
    rbind(REC.df) %>% 
    rbind(CULT.df) %>% 
    rbind.fill(data.frame(TYPE = "By Most Common Gear"))
  
  rm(REC_EXP.df, PT_COM.df, SUBS.df, FT_COM.df, REC.df, CULT.df)
  
  
  
  #-----------------
  # By Most Common Gear 
  #-----------------
  
  # Troll
  TROLL.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                            filter(CommonGear == 1), 
                                          type = "Troll")
  
  # Bait for Pelagic 
  BAIT.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                           filter(CommonGear == 2), 
                                         type = "Bait for Pelagic")
  
  # Handline for deep 7 Bottom Fish 
  HL_DEEP.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                              filter(CommonGear == 3), 
                                            type = "HL for Deep7 deep")
  
  # Handline/Rod and Reel for shallow bottomfish 
  HL_SHALLOW.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                                 filter(CommonGear == 4), 
                                               type = "HL for Deep7 shallow")
  
  # Spear  
  SPEAR.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                            filter(CommonGear == 5), 
                                          type = "Spear")
  
  TABLE <- TABLE %>% 
    rbind(TROLL.df) %>% 
    rbind(BAIT.df) %>% 
    rbind(HL_DEEP.df) %>% 
    rbind(HL_SHALLOW.df) %>% 
    rbind(SPEAR.df) %>% 
    rbind.fill(data.frame(TYPE = "By Sub-fishery"))
  
  rm(TROLL.df, BAIT.df, HL_DEEP.df, HL_SHALLOW.df, SPEAR.df)
  
  #-----------------
  # By Sub-Fishery 
  #-----------------
  
  # Pelagic
  PELAGIC.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                              filter(Pelagic == 1), 
                                            type = "Pelagic")
  
  # Deep 7 Bottomfish
  DEEP7.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                            filter(Deep7Bottomfish == 1), 
                                          type = "Deep7 Bottom")
  
  # Non-Deep 7 Bottomfish 
  NON_DEEP7.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                                filter(ShallowBottomfish == 1), 
                                              type = "Non-Deep7 Bottom")
  
  # Coral Reef 
  CORAL.df <- compute_one_block_table04.f(df = HI_SMALL_BOAT.df %>% 
                                            filter(Reef == 1), 
                                          type = "Coral Reef")
  
  
  
  #-----------------
  # Completting Table 14 
  #-----------------
  
  TABLE <- TABLE %>% 
    rbind(PELAGIC.df) %>% 
    rbind(DEEP7.df) %>% 
    rbind(NON_DEEP7.df) %>% 
    rbind(CORAL.df) 
  
  
  return(TABLE)
}


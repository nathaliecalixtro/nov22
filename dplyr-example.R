#In the example below we have a data frame with head counts for grain feeding producers 
#and another data frome with head counts from grass feeding producers, there is potentially 
#overlap between the producers that have both grain and grass fed animals and we want to merge 
#them into one data frame. Note that producer number is not unique, but it is unique within state, 
#so we need to merge on both state and producer number together.

library("dplyr")

grass = data_frame(
  producer = c(1,2,3,1),
  state = c("NSW","NSW","QLD","QLD"),
  head = c(59,82,37,28)
  )

grain = data_frame(
  producer = c(1,1,2,4),
  state = c("NSW","QLD","NSW","QLD"),
  head = c(192,21,37,81),
  pcode = c("2680","4700","2650","4715")
  )
  
  
#There are a few different ways to merge. The following functions can all be found in the dplyr package.

#left_join keeps only all the observations that are present in the first (left) data frame (grass below)

lj = left_join(grass, grain, by = c("producer","state"), suffix = c("_grass","_grain"))


#full_join keeps any observations that occur in either of the two data frames (grass and grain below)

fj = full_join(grass, grain, by = c("producer","state"), suffix = c("_grass","_grain"))

#inner_join keeps only observations that are present in both data frames

ij = inner_join(grass, grain, by = c("producer","state"), suffix = c("_grass","_grain"))


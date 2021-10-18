## -----------------------------
##
## Script Name : Merge_Outputs
##
## Purpose : Function
##      Merge samsara outputs produced from different commandFiles into a single one
##      for outputStand and outputTree files
##
## Author : BEAUCHAMP Natheo
##
## Date created : 18/10/2021
##
## Samsara version : 
##
## -----------------------------


# Imports
library(data.table)


# Function
Merge_outputs <- function(
  filePath_to_outputs,
  filePath_to_save_merged_outputs
)
{
  ## ------------ 
  ##  INPUTS :
  ##    * filePath_to_outputs (string) : absolute path of the folder where the outputs folders are stored
  ##    * filePath_to_save_merged_outputs (string) : absolute path where to save the merged outputs
  ##
  ##  OUTPUTS :
  ##
  ##  CHANGES :
  ##    * Write two .txt files in the filePath_to_save_merged_outputs folder
  ## ------------
  
  
  # Get the vector of all file names in the "filePath_to_outputs" folder
  outputs.files <- list.files(path = filePath_to_outputs)
  print("Outputs file names :")
  print(outputs.files)
  
  ### outputStand
  print("Merging outputStand files...")
  # Import all the outputs in a list of dataframe
  outputs.stand <- lapply(outputs.files, function(x) {
    fread(paste(filePath_to_outputs,x,"outputStand.txt", sep="/"))
  })
  
  # Merge all the dataframes
  outputs.stand <- do.call(rbind, outputs.stand)
  
  
  ### outputTree
  print("Merging outputTree files...")
  # Import all the outputs in a list of dataframe
  outputs.tree <- lapply(outputs.files, function(x) {
    fread(paste(filePath_to_outputs,x,"outputTree.txt", sep="/"))
  })
  
  # Merge all the dataframes
  outputs.tree <- do.call(rbind, outputs.tree)
  
  
  # Save the merged outputs in "filePath_to_save_merged_outputs"
  print("Saving outputs...")
  write.table(x = outputs.stand, file = paste(filePath_to_save_merged_outputs,"outputStand.txt", sep="/"),
              sep = "\t", row.names = F)
  write.table(x = outputs.tree, file = paste(filePath_to_save_merged_outputs,"outputTree.txt", sep="/"),
              sep = "\t", row.names = F)
}
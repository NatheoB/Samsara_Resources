## -----------------------------
##
## Script Name : Check_IFN_Samsara_Species_Corresp
##
## Purpose : Function
##      Return the missing species in the correspondence file that are present in the given IFN trees dataset
##
## Author : BEAUCHAMP Natheo
##
## Date created : 15/10/2021
##
## Samsara version : 
##
## -----------------------------


### Imports


### Function
Check_IFN_Samsara_Species_Corresp <- function(
  IFN_trees_dataset,
  IFN_Samsara_Species_Corresp_table
)
{
  ## ------------ 
  ##  INPUTS :
  ##    * IFN_trees_dataset (data frame) : IFN dataset at the tree scale
  ##    * IFN_Samsara_Species_Corresp_table (data frame) : table with correspondence between IFN and Samsara species codes and names
  ##
  ##  OUTPUTS :
  ##    * IFN_species_codes (strings vector) : vector with missing species codes
  ##
  ##  CHANGES :
  ## ------------
  
  
  # Get all species in the IFN trees dataset
  IFN_species_codes <- unique(IFN_trees_dataset$species_code)
  
  # Get all species in the previous species correspondence file
  corresp_species_codes <- unique(IFN_Samsara_Species_Corresp_table$IFN_code)
  
  # Remove the species already in the correspondence table
  IFN_species_codes <- IFN_species_codes[-which(IFN_species_codes %in% corresp_species_codes)]
  
  # Print species to add in the correspondence table
  if (length(IFN_species_codes) == 0) {
    print("No species to add in the correspondance file")
    IFN_species_codes <- c()
  } else {
    print(paste("There is", length(IFN_species_codes), "species to add in the correspondence table"))
  }
  
  return(IFN_species_codes)
}




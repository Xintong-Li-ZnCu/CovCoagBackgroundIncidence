

#install.packages("renv") # if not already installed, install renv from CRAN
renv::restore() # this should prompt you to install the various packages required for the study

# packages
library(SqlRender)
library(DatabaseConnector)
library(FeatureExtraction)
library(here)
library(lubridate)
library(stringr)
library(ggplot2)
library(DBI)
library(dbplyr)
library(dplyr)
library(tidyr)
library(kableExtra)
library(RSQLite)
library(rmarkdown)
library(tableone)
library(scales)
library(forcats)
library(epiR)
library(RPostgreSQL)
# please load the above packages 
# you should have them all available, with the required version, after
# having run renv::restore above

output.folder<-"...."
# the path to a folder (that exists) where the results from this analysis will be saved

oracleTempSchema<-NULL
connectionDetails <- "...."
# The OHDSI DatabaseConnector connection details

targetDialect <-"...." 
# This is your sql dialect used with the OHDSI SqlRender package

cdm_database_schema<-"...." 
# This is the name of the schema that contains the OMOP CDM with patient-level data

results_database_schema<-"...."
# This is the name of the schema where a results table will be created 

cohortTableExposures<-"diagCovCoagIncExposures"
cohortTableOutcomes <-"diagCovCoagIncOutcomes"
cohortTableProfiles<-"diagCovCoagIncProfiles"
# These are the tables to be created in your results schema for this analysis
# You can keep the above names or change them
# Note, any existing tables in your results schema with the same name will be overwritten

db <- dbConnect("....") 
# This is a connection to your database with the DBI package
# https://rdrr.io/cran/DBI/man/dbConnect.html

db.name<-"...."
# This is the name/ acronym for your database (to be used in the titles of reports, etc) 

test.run<-FALSE
# if you want to to quckly (well, relatively) check that the package works
# set test.run to TRUE
# this will run for one exposure population, one baseline commorbidity, 
# one baseline medication, and one outcome of interest
# if that works, then change back to TRUE and re-run for the full analysis

# run the analysis
source(here("RunAnalysis.R"))







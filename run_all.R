# Run all
source("functions/make_reports.R")
default_open_file <- TRUE

report("01-Download_raw_data.Rmd")
report("02-Import.Rmd")
report("03-Explore_bdpm.Rmd")

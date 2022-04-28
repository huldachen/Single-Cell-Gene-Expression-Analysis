# R version 4.0.3

#Install the Bioconducor as following commands
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.14")

#Install the Tidyverse package
install.packages("tidyverse")

#This project will access public data form the Gene Expression Omnibus: GEOquery Package.

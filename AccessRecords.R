Library(GEOquer) #Loda package, will give info about package
list.files("GEO") #Check the GEO files
#Create GEO subdirectory relative to working directory (if non-existent)
if (idir.exists("GEO")){
    dir.Create("GEO")
}

#Main GEOquery functaion to access GEO records, file name txt.gz
gse <- getGEO(geo = "gse103512", destdir = "GEO") #destdir will look in GEO first before downloading
class(gse) #gse is a ExpressionSet object: a list, length 1 
 
#Class Corecion: SummarizedExperiment: objects are idenl for retangular matrices and metadata
library(SummarizedExperiment) #Load packages with calss definition
gse103512 <- as(gse[[1]],"SummarizedExperiment")
class(gse103512) 

#Summarized Experiment class is a definition of an S4 class, have specific accessor functions 
lsS4(gse103512)
typeof(gse103512)
attributes(gse103512)[["class"]]
is(gse103512, "SummarizedExperiment") #test class with is()
getClass("SummarizedExperiment")

#Accessing S4 Slots
slotNames(gse103512) #Return slot names from an S4 object
class(metadata(gse103512))
names(metadata(gse103512)) #Return"experimentData", "annotation", "protocolData"
#Add design matrix formula for differential expression analysis
metadata(gse103512)$formula <- exprs ~ cancer.type.ch1 + normal.ch1

#Look in Experimental Data: Minimum Information About a Miceroarray Experiment
class(metatdata(gse103512)[["experimentData"]]) #Return "MIAME"
miame <- metadata(gse103512)[["experimentData"]] #Reassign for posterity
expinfo(miame)[c("title", "url")] #Return lab contact, title and URL
abstract(miame)
pubMedIds(miame)

#Assay Data:Arrays, column dimension corresponds to samples
assays(gse103512) #Assay from ExpressionSet class coercion (exprs)
class(assay(gse103512, "expers")) #Return "matrix" "array"
dim(assay(gse103512,"expers"))
tibble::as_tibble(assay(gse103512, "exprs"))

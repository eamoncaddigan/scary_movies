# Run a hierarchical linear regression on the movie data using STAN.

source("read_data.R")
source("Stan-Ymet-XmetSsubj-MrobustHierWt.R")

fileNameRoot <- "regress_boxoffice"
graphFileType <- "png"

# Basically Kruschke's code
mcmcCoda <- genMCMC(data=budgetData, 
                    xName="budget", yName="total_boxoffice", sName="genre", wName=NULL,
                    numSavedSteps=12000, thinSteps=5, saveName=fileNameRoot)

for (parName in c("beta0mu", "beta1mu", "nu", "sigma", "beta0[1]", "beta1[1]")) {
  diagMCMC(codaObject=mcmcCoda, parName=parName, 
           saveName=fileNameRoot, saveType=graphFileType)
}

summaryInfo <- smryMCMC(mcmcCoda, saveName=fileNameRoot)
show(summaryInfo)

# Display posterior information:
plotMCMC(mcmcCoda, data=budgetData, 
         xName="budget", yName="total_boxoffice", sName="genre", wName=NULL,
         pairsPlot=TRUE, showCurve=FALSE,
         saveName=fileNameRoot, saveType=graphFileType)

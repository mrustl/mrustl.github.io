###############################################################################
### Create .bibtex file with ORCID publications
###############################################################################

# Install dependencies

## Check installed pkgs
installed_pkgs <- rownames(installed.packages())

## Install missing CRAN pkgs
cran_pkgs <- c("remotes", "dplyr", "knitcitations", "reticulate", "data.table")

sapply(cran_pkgs, function(pkg) {
        if(!pkg %in% installed_pkgs) {
          install.packages(pkg, repos = "https://cloud.r-project.org")
        }})

## Install latest version of KWB-R GitHub "kwb.orcid" package
remotes::install_github("kwb-r/kwb.orcid")
  
library(magrittr)

secret <- read.csv("secret.csv")
Sys.setenv("ORCID_TOKEN" =  secret$orcid_token)

## Get all of Michael Rustler`s publications from ORCID
orcid <- kwb.orcid::get_kwb_orcids()[4]
publications <- kwb.orcid::create_publications_df_for_orcids(orcids = orcid)

## Put all with DOI in a data.frame 
publications_with_dois <- data.table::rbindlist(publications$`external-ids.external-id`) %>%  
    dplyr::filter(`external-id-type` == "doi")
  

## Call knitcitations::citep for automatically citing all
sapply(publications_with_dois$`external-id-value`, 
       function(x) {
         print(sprintf("Citing: %s", x))
         try(knitcitations::citep(x))})


## Export all cited publications to "knitcitations.bib"
knitcitations::write.bibtex(file = "knitcitations.bib")

###############################################################################
### Step 2: Import .bibtex file to publications with Python 
###############################################################################

## Download Anaconda with Python 3.7 from website (if not installed)
#browseURL("https://www.anaconda.com/download/")

python_path <- "C:/Users/mrustl.KWB/AppData/Local/Continuum/anaconda3"

Sys.setenv(RETICULATE_PYTHON = python_path)

reticulate::use_python(python_path)

### Define conda environment name with "env"
env <- "academic"

reticulate::conda_create(envname = env)
reticulate::use_condaenv(env)

### Install required Python library "academic" 
### for details see:
# browseURL("https://github.com/sourcethemes/academic-admin")

reticulate::py_install(packages = "academic", 
           envname = env, 
           pip = TRUE, pip_ignore_installed = TRUE) 


### Create and run "import_bibtex.bat" batch file
cmds <- sprintf('call "%s" activate "%s"\ncd "%s"\nacademic import --bibtex "%s"', 
               normalizePath(file.path(python_path, "Scripts/activate.bat")), 
               env,
               normalizePath(getwd()),
               "knitcitations.bib")

writeLines(cmds,con = "import_bibtex.bat")

shell("import_bibtex.bat")

### Now check the folder "content/publication". Your publications should be added
### now!


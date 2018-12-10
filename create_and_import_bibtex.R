library(dplyr)
library(knitcitations)
library(reticulate)

secret <- read.csv("secret.csv")
Sys.setenv("ORCID_TOKEN" =  secret$orcid_token)
orcid <- kwb.orcid::get_kwb_orcids()[4]
work <- kwb.orcid::create_publications_df_for_orcids(orcids = orcid)

work_with_dois <- data.table::rbindlist(work$`external-ids.external-id`) %>%  
    dplyr::filter(`external-id-type` == "doi")
         
sapply(work_with_dois$`external-id-value`, 
       function(x) {
         print(sprintf("Citing: %s", x))
         try(knitcitations::citep(x))})
knitcitations::write.bibtex()


python_path <- "C:/Users/mrustl.KWB/AppData/Local/Continuum/anaconda3"

Sys.setenv(RETICULATE_PYTHON = python_path)

use_python(python_path)
env <- "academic"
conda_create(envname = env)
use_condaenv(env)


py_install(packages = "academic", 
           envname = env, 
           pip = TRUE, pip_ignore_installed = TRUE) 

cmds <- sprintf('call "%s" activate "%s"\ncd "%s"\nacademic import --bibtex "%s"', 
               normalizePath(file.path(python_path, "Scripts/activate.bat")), 
               env,
               normalizePath(getwd()),
               "knitcitations.bib")

writeLines(cmds,con = "import_bibtex.bat")

shell("import_bibtex.bat")
reticulate::import(module = "academic")


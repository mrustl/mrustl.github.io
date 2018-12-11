Sys.setlocale(category = "LC_ALL", locale = "German")

library(dplyr)


### Code copied from:
### http://kevinushey.github.io/blog/2018/02/21/string-encoding-and-r/

write_utf8 <- function(text, f = tempfile()) {
  
  # step 1: ensure our text is utf8 encoded
  utf8 <- enc2utf8(text)
  
  # step 2: create a connection with 'native' encoding
  # this signals to R that translation before writing
  # to the connection should be skipped
  con <- file(f, open = "w+", encoding = "native.enc")
  
  # step 3: write to the connection with 'useBytes = TRUE',
  # telling R to skip translation to the native encoding
  writeLines(utf8, con = con, useBytes = TRUE)
  
  # close our connection
  close(con)
  
  # read back from the file just to confirm
  # everything looks as expected
  readLines(f, encoding = "UTF-8")
  
}


bib_txt <- "GWDepartment_bibtex_2018-12-10.txt"
encoding <- "UTF-8"
org <- readLines(bib_txt, encoding = "UTF-8")

# write_utf8(org, "GWDepartment_bibtex_utf8_2018-12-10.txt")


### Saved original "GWDepartment_bibtex_2018-12-10.txt" in Rstudio with
### "Save with Encoding "Windows-1252" and define encoding "latin1" for import
### now works
bib_txt <- "GWDepartment_bibtex_windows-1252_2018-12-10.txt"
encoding <- "latin1"

# raw_text <- readLines("GWDepartment_bibtex_windows-1252_2018-12-10.txt", 
#                       encoding = "latin1")

# ### Re-encode to UTF-8 (as dplyr is not able to deal with multibyte encodings!)
# raw_text_utf8 <- iconv(raw_text, from = "latin1", to = "UTF-8", sub = "byte") 
# 
# write_utf8(raw_text_utf8, f = "GWDepartment_bibtex_utf8_2018-12-10.txt")
# 
# 
# bib_txt <- "GWDepartment_bibtex_utf8_2018-12-10.txt"
# encoding <- "UTF-8"

### Import all (same cannot due to parsing errors:
### "The name list field author cannot be parsed"
grw_bib_all <- RefManageR::ReadBib(bib_txt, 
                                   .Encoding = encoding,
                                   check = FALSE)

## Not working as not all required data are provided for the references
# RefManageR::WriteBib(grw_bib_all, file = "temp.bib", biblatex = TRUE)

grw_bib_all_df <- as.data.frame(grw_bib_all)

nrow(grw_bib_all_df)

### Import all (same cannot due to parsing errors:
### "The name list field author cannot be parsed"
grw_bib_valid <- RefManageR::ReadBib(bib_txt,
                                     .Encoding = encoding)
grw_bib_valid_df <- as.data.frame(grw_bib_valid)

nrow(grw_bib_valid_df)

nrow(grw_bib_valid_df)/nrow(grw_bib_all_df)

publications_kwb_valid <- grw_bib_valid_df %>% 
  dplyr::filter(author %in% stringr::str_subset(string = .data$author, 
                                                pattern = "Rustler"))

## in case dplyr does not work
condition <- grep("Rustler", x = grw_bib_all_df$author)
publications_kwb_all <- grw_bib_all_df[condition, ]


check_technical_report <- function(bib_df,
                                   default_institution = "Kompetenzzentrum Wasser Berlin gGmbH") { 
  

  idx_TechReport <- which(bib_df$bibtype == "TechReport")
  
  if(length(idx_TechReport)>0) {
      print(sprintf("Replacing  missing 'institution' %d entries for 'TechnicalReport'
with %s", length(idx_TechReport), default_institution))
      no_institution_idx <- is.na(bib_df$institution[idx_TechReport]) 
      bib_df$institution[idx_TechReport] <- default_institution 
    
  } else {
   "No missing entries for 'institution' for 'TechnicalReport'"  
  }
  
  bib_df
}

RefManageR::as.BibEntry(check_technical_report(bib_df = publications_kwb_all))

publications_kwb_all <- grw_bib_all_df %>% 
dplyr::filter(author %in% stringr::str_subset(string = .data$author, 
                                              pattern = "Rustler"))
                                
is_me <- stringr::str_detect(string = grw_bib_all_df$author, pattern = "Rustler") 

bib_entry_sel <- RefManageR::as.BibEntry(publications_kwb_all)

RefManageR::WriteBib(bib_entry_sel,file = "publications_kwb_grw.bib")

Sys.setlocale(locale = "German")
#install.packages("RefManageR", repos = "https://cloud.r-project.org")
dummy <- RefManageR::ReadBib("kwb_dummy.txt", .Encoding = "UTF-8")
dummy_df <- as.data.frame(dummy)
print(dummy_df)



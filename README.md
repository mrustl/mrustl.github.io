# mrustl.github.io
My personal website

## How to update the website

### 1. Step) Install blogdown package

```r

if (!require("devtools")) {
  install.packages("devtools", repos = "https://cloud.r-project.org")
}

devtools::install_github("rstudio/blogdown")
```

### 2. Step) Create/Add new contentpost

Change file(s) in subdirectory ***content***.

### 3. Step) Update the website

To do so run the following R code: 
```r

blogdown::build_site(local = FALSE)

### Copies files from public folder (please do not COMMIT!!) into docs 
### folder which is required to work for GITHUB (all changed content of 
### the docs folder needs to be committed to Github for the blog to be
### updated)
file.copy(from = "_backend/public/.",to = "/",overwrite = TRUE,recursive = TRUE)
```

If completed finally commit (vit GIT/Subversion) the changed files in the following two directories:

- content

- docs


and you are done. 


### 4. Step) Visit the updated website

The content of the updated blog is available at [https://mrustl.github.io](https://mrustl.github.io).
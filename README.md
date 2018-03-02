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

Change file(s) in subdirectory ***_backend/content***.

### 3. Step) Update the website

To do so run the following open the R Project file `website.Rproj` located in 
the `_backend` folder and run the following command 


```r
### Rebuild website with blogdown and export from /_backend to ../ 
blogdown::build_site(local = FALSE)

```

If completed finally commit (vit GIT/Subversion) the changed files in the 
following two directories:

- _backend/content

- the repo`s root directory (containing the updated website files after running 
  `blogdown::build_site(local = FALSE)`)


and you are done. 


### 4. Step) Visit the updated website

The content of the updated blog is available at [https://mrustl.github.io](https://mrustl.github.io).
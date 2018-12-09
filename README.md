# mrustl.github.io
My personal website

## How to update the website

### Step 1: Install blogdown package

```r

if (!require("devtools")) {
  install.packages("devtools", repos = "https://cloud.r-project.org")
}

devtools::install_github("rstudio/blogdown")
```

### Step 2: Create/Add new contentpost

Change file(s) in subdirectory ***content***.

### Step 3: Update the website

To do: add automatic step that: 

1. Runs travis 

2. Calls blogdown::build_site(local = FALSE)

```r
### Rebuild website with blogdown and export from "dev" branch 
### to "master" branch

blogdown::build_site(local = FALSE)
```

3. Pushes changes to "master" branch 

### Step 4: Visit the updated website

The content of the updated blog is available at [https://mrustl.github.io](https://mrustl.github.io).

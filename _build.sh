#!/bin/sh

Rscript -e "blogdown::install_hugo()"
Rscript -e "blogdown::build_site()"
Rscript -e "file.copy(from = '.gitlab-ci.yml', to = 'public/.gitlab-ci.yml', overwrite = TRUE)"

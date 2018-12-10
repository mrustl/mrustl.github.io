#!/bin/sh

Rscript -e "blogdown::install_hugo(version = '0.52', force = TRUE)"
Rscript -e "blogdown::build_site()"
Rscript -e "file.copy(from = '.gitlab-ci.yml', to = 'public/.gitlab-ci.yml', overwrite = TRUE)"

+++
title = "Wrap Your Model In An R Package"
date = 2016-06-28T00:00:00  # Schedule page publish date.
draft = false

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
time_start = 2016-06-28T13:00:00
time_end = 2016-06-25T13:20:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Michael Rustler", "Hauke Sonnenberg"]

# Abstract and optional shortened version.
abstract = 'The groundwater drawdown model [WTAQ-2](https://water.usgs.gov/ogw/wtaq/), provided by the United States Geological Survey for free, has been “wrapped" into an [R package](http://kwb-r.github.io/kwb.wtaq/), which contains functions for writing input files, executing the model engine and reading output files. By calling the functions from the R package a sensitivity analysis, calibration or validation requiring multiple model runs can be performed in an automated way. Automation by means of programming improves and simplifies the modelling process by ensuring that the [WTAQ-2](https://water.usgs.gov/ogw/wtaq/) wrapper generates consistent model input files, runs the model engine and reads the output files without requiring the user to cope with the technical details of the communication with the model engine. In addition the [WTAQ-2](https://water.usgs.gov/ogw/wtaq/) wrapper automatically adapts cross-dependent input parameters correctly in case one is changed by the user. This assures the formal correctness of the input file and minimises the effort for the user, who normally has to consider all cross-dependencies for each input file modification manually by consulting the model documentation. Consequently the focus can be shifted on retrieving and preparing the data needed by the model. Modelling is described in the form of version controlled R scripts so that its methodology becomes transparent and modifications (e.g. error fixing) trackable. The code can be run repeatedly and will always produce the same results given the same inputs. The implementation in the form of program code further yields the advantage of inherently documenting the methodology. This leads to reproducible results which should be the basis for smart decision making.'
abstract_short = "The USGS groundwater drawdown model WTAQ-2 was wrapped into an R package for increasing the reproducibility of the modelling workflow."

# Name of event and optional event URL.
event = "useR!2016"
event_url = "http://user2016.r-project.org"

# Location of event.
location = "Stanford University, California, USA"

# Is this a selected talk? (true/false)
selected = true

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects = ["optiwells-2"]

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["R package", "groundwater modelling", "reproducibility"]

# Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references 
#   `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides = ""

# Links (optional).
url_pdf = ""
url_slides = "https://github.com/mrustl/useR-2016/raw/master/WrapYourModel.pdf"
url_video = "https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Wrap-your-model-in-an-R-package/player"
url_code = "https://kwb-r.github.io/kwb.wtaq"

# Does the content use math formatting?
math = true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
[image]
  # Caption (optional)
  caption = "Image credit: [**Channel 9, Microsoft**](https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Wrap-your-model-in-an-R-package)"

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Right"
+++

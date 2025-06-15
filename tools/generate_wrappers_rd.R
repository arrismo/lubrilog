# tools/generate_wrappers_rd.R

library(glue)
library(stringr)
# tools/generate_wrappers_rd.R

library(glue)
library(stringr)

# Read exported functions from NAMESPACE
namespace_lines <- readLines("NAMESPACE")
exported <- namespace_lines[grepl("^export\\(", namespace_lines)]
functions <- sub("export\\((.*)\\)", "\\1", exported)

# Template for Rd documentation for lubridate wrappers
template <- "\\name{<f>}\n\\alias{<f>}\n\\title{Wrapper function around lubridate::<f> that gives feedback about parsed variable}\n\\usage{\n<f>(.data, ...)\n}\n\\arguments{\n\\item{.data}{see \\link[lubridate:<f>]{<f>}}\n\n\\item{...}{see \\link[lubridate:<f>]{<f>}}\n}\n\\value{\nsee \\link[lubridate:<f>]{<f>}\n}\n\\description{\nWrapper function around lubridate::<f> that gives feedback about parsed variable\n}\n"

dir.create("man", showWarnings = FALSE)
for (f in functions) {
  doc <- glue(template, .open = "<", .close = ">")
  writeLines(doc, glue("man/{f}.Rd"))
}

library(glue)
library(lubridate)
library(stringr)
library(utils)

conn <- file("NAMESPACE")
namespace <- readLines(conn)
close(conn)
functions <- namespace[grepl("export", namespace)]
functions <- sub("export\\(", "", functions)
functions <- sub("\\)", "", functions)

template <- "\\name{<f>}
\\alias{<f>}
\\title{Wrapper function around <package>::<f> that gives feedback about parsed variable}
\\usage{
<usage>
}
\\arguments{
<args>
}
\\value{
see \\link[<package><topic>]{<f>}
}
\\description{
Wrapper function around <package>::<f> that gives feedback about parsed variable
}"

package <- "lubridate"
html_links <- tools::findHTMLlinks(level = 0:5)
for(f in functions){
  topic <- html_links[str_detect(html_links, package) & names(html_links) == f]
  topic <- str_match(topic, "/([^/]*)\\.html")[, 2]
  topic <- paste0(":", topic)



  # Get the actual function object
  func <- get(f, envir = asNamespace(package))

  # Extract function arguments
  args_list <- c(".data","...")

  # Create usage string
  usage <- glue("{f}({paste(args_list, collapse = ', ')})")

  # Create arguments string
  args <- sapply(args_list, function(arg) {
    glue("\\item{<arg>}{see \\link[<package><topic>]{<f>}}",
         .open = "<", .close = ">",
         arg = arg,
         package = package,
         topic = topic,
         f = f)
  })
  args <- paste0(args, collapse = "\n\n")

  # Create documentation
  doc <- glue(template,
              .open = "<", .close = ">",
              f = f,
              package = package,
              topic = topic,
              usage = usage,
              args = args)

  # Write documentation to file
  conn <- file(glue("man/{f}.Rd"))
  writeLines(doc, conn)
  close(conn)
}


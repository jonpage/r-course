rm(list = ls(all = TRUE))
if("package:broom" %in% search()) detach("package:broom", unload=TRUE)
if("package:dplyr" %in% search()) detach("package:dplyr", unload=TRUE)
knitr::opts_chunk$set(message = FALSE, warning = FALSE, error = FALSE, cache = TRUE)

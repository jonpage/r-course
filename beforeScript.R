rm(list = ls(all = TRUE))
pacman::p_unload(pacman::p_loaded(), character.only = TRUE)
knitr::opts_chunk$set(message = FALSE, warning = FALSE, error = FALSE, cache = TRUE)

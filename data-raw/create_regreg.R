regreg <- read.csv("./data-raw/register.csv", check.names = TRUE)

usethis::use_data(regreg)

rm(regreg)

# some code to go from raw data csv to a nice RDA object

# create_regreg

regreg <- read.csv("./data-raw/register.csv", check.names = TRUE)

regreg$phase <- as.factor(regreg$phase)

usethis::use_data(regreg, overwrite = TRUE)

rm(regreg)


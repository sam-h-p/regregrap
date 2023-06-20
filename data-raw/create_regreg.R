# some code to go from raw data csv to a nice RDA object

# create_regreg

regreg <- read.csv("./data-raw/register.csv", check.names = TRUE)

# as factor
regreg$phase <- as.factor(regreg$phase)

# give nice name
regreg <- dplyr::rename(regreg, date = 'entry.timestamp')

# copyright looks empty
regreg <- dplyr::select(regreg, -copyright)

# overwrite old data
usethis::use_data(regreg, overwrite = TRUE)

rm(regreg)


#' @title The five most recent published registers.
#'
#' @description The \code{fivereg_recent} function expects the
#'  \code{year_phase_data} and outputs a character string.
#'
#'
#' @details The registers are sorted by publication date and name by
#'  alphabetical order. The top five registers are output as a character string
#'  including commas and an and, for inclusion in the report.
#'
#' @param x Input object of \code{year_phase_data} class.
#' @param n The \code{n} passed to \code{head}.
#'
#' @return Returns a character string of the five most recent registers.
#'
#' @examples
#'
#' library(regregrap)
#' report_data <- phase_date_data(regreg)
#' fivereg_recent(report_data)
#'
#' @importFrom magrittr "%>%"
#'
#' @export


fivereg_recent <- function(x, n = 5){

  out <- tryCatch(
    expr = {

  #####

  # take the df slot and sort by desc published date
  # sort by register name (alphabetical)

  df <- x$df

  # be suspicious - check by creating errors

  stopifnot(is.character(df$register))
 # stopifnot(lubridate::is.POSIXct(df$date))

  # arrange using dyplr
  # descending order for dates, ascending reg name
  dplyr::arrange(df, desc(date), register) %>%

    dplyr::select(-phase) %>%

    tibble::as_tibble() -> sorted_list

  # Take top n names
  df_n <- head(sorted_list, n)

  df_n

  # Need to convert to human readable list
  output <- paste(df_n, collapse = ", ")

  return(output)

  #####
    },
 warning = function() {

   w <- warnings()
   warning('Warning produced running fivereg_recent():', w)

 },
 error = function(e)  {

   stop('Error produced running fivereg_recent():', e)

 },
 finally = {}
  )

}

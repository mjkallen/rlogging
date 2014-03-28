PrintLogMessage <- function(..., domain=NULL, level) {

    timestamp <- format(Sys.time(), format=GetTimeStampFormat())
    base::message(timestamp, ..., domain=domain)
    #cat(timestamp, ..., "\n", sep="")

    # print log message to file if this one is not set to NULL
    if (missing(level)) {
        logfile <- GetLogFile()
    } else {
        logfile <- GetLogFile(level=level)
    }

    if (!is.null(logfile)) {
        cat(timestamp, " ", ..., "\n", file=logfile, sep="", append=TRUE)
    }

}

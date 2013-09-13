PrintLogMessage <- function(..., domain=NULL) {

    timestamp <- paste("[", Sys.time(), "] ", sep="")
    base::message(timestamp, ..., domain=domain)
    #cat(timestamp, ..., "\n", sep="")

    # print log message to file if this one is not set to NULL
    logfile <- GetLogFile()
    if (!is.null(logfile)) {
        cat(timestamp, ..., "\n", file=logfile, sep="", append=TRUE)
    }

}

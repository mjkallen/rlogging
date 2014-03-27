message <- function(..., domain=NULL, appendLF=TRUE) {

    args <- list(...)
    is.condition <- length(args) == 1L && inherits(args[[1L]], "condition")
    if (is.condition) {
        # bypass the logger if a condition is supplied or if loglevel is set to "NONE"
        base::message(..., domain=domain, appendLF=appendLF)
    } else {
        # if loglevel is set to INFO, then print log message, else do nothing
        loglevel <- GetLogLevel()
        split.files <- get("split.files", envir=.rloggingOptions)
        if (loglevel == "INFO") {
            if (split.files) {
                PrintLogMessage(..., level="INFO")
            } else {
                PrintLogMessage("[INFO] ", ...)
            }
        }
    }
    invisible()

}

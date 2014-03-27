warning <- function(..., call.=TRUE, immediate.=FALSE, domain=NULL) {

    args <- list(...)
    is.condition <- length(args) == 1L && inherits(args[[1L]], "condition")
    if (!is.condition) {
        # if loglevel is set to INFO or WARN, then print log message
        loglevel <- GetLogLevel()
        split.files <- get("split.files", envir=.rloggingOptions)
        if (loglevel %in% c("INFO", "WARN")) {
            if (split.files) {
                PrintLogMessage(..., level="WARN")
            } else {
                PrintLogMessage("[WARN] ", ...)
            }
        }
        # always collect warnings when printing log messages
        immediate. <- FALSE
    }
    # always call the base warning function to collect warnings
    base::warning(..., call.=call., immediate.=immediate., domain=domain)
    invisible()

}

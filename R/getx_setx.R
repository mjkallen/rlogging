SetLogLevel <- function(level="INFO") {
    stopifnot(level %in% c("INFO", "WARN", "STOP"))
    assign("loglevel", level, envir=.rloggingOptions)
}

GetLogLevel <-function () {
    get("loglevel", envir=.rloggingOptions)
}

SetLogFile <- function(file="rlogging.log", folder=getwd()) {
    if (is.null(file)) {
        assign("logfile", NULL, envir=.rloggingOptions)
    } else {
        assign("logfile", file.path(folder, file), envir=.rloggingOptions)
    }
}

GetLogFile <- function() {
    get("logfile", envir=.rloggingOptions)
}

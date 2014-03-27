SetLogLevel <- function(level="INFO") {
    stopifnot(level %in% c("INFO", "WARN", "STOP"))
    assign("loglevel", level, envir=.rloggingOptions)
}

GetLogLevel <-function() {
    get("loglevel", envir=.rloggingOptions)
}

SetTimeStampFormat <- function(ts.format="[%Y-%m-%d %H:%M:%S]") {
  assign("ts.format", ts.format, envir=.rloggingOptions)
}

GetTimeStampFormat <- function() {
  get("ts.format", envir=.rloggingOptions)
}

SetFilenameSuffixes <- function(file.name.suffixes = c("message", "warning",
                                                       "stop")) {
    file.name.suffixes <- as.list(file.name.suffixes)
    names(file.name.suffixes) <- c("INFO", "WARN", "STOP")
    assign("file.name.suffixes", file.name.suffixes, envir=.rloggingOptions)
}

GetFilenameSuffixes <- function() {
    get("file.name.suffixes", envir=.rloggingOptions)
}

SetLogFile <- function(base.file="rlogging.log", folder=getwd(),
                       split.files=F) {
    assign("split.files", split.files, envir=.rloggingOptions)


    if (is.null(file)) {
        assign("logfile.base", NULL, envir=.rloggingOptions)
    } else {
        assign("logfile.base", file.path(folder, base.file), envir=.rloggingOptions)
    }
}

GetLogFile <- function(level) {
    # TODO (feju): allow for more flexible file names that can have a log
    #       extension or not and may contain special chars.
    base.file <- get("logfile.base", envir=.rloggingOptions)

    if (!missing(level)) {
        file.name.suffix <- get(level, GetFilenameSuffixes())
        replacement <- paste("\\1", file.name.suffix, "\\2")
        sub("(.+?)(\\.[^.]*$|$)", replacement, base.file)
    } else {
        base.file
    }
}

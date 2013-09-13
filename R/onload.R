.rloggingOptions <- new.env()

.onLoad <- function(libname, pkgname) {
    SetLogFile()
    SetLogLevel()
    lockEnvironment(.rloggingOptions)
}

.onAttach <- function(libname, pkgname) {
    pkgversion <- read.dcf(system.file("DESCRIPTION", package=pkgname), 
                           fields="Version")
    msg <- paste("Package", pkgname, "version", pkgversion, 
                 "\nNOTE: - Logging level is set to", GetLogLevel(), 
                 "\n      - Output file is", GetLogFile(), 
                 "\n      - See 'package?rlogging' for help.")
    packageStartupMessage(msg)
}

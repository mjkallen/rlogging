\name{rlogging}
\alias{rlogging-package}
\alias{SetLogFile}
\alias{GetLogFile}
\alias{SetLogLevel}
\alias{GetLogLevel}
\alias{message}
\alias{warning}
\alias{stop}
\title{Simple logging in R}
\description{
Provides a wrapper around R's base functions \command{message},
\command{warning}, and \command{stop} to provide a simple, but effective,
logging facility: output log messages with timestamps, direct output to the
console and/or to a text file of your choosing, and control the level of
logging.
}
\usage{
    SetLogFile(file="rlogging.log", folder=getwd())
    GetLogFile()

    SetLogLevel(level="INFO")
    GetLogLevel()

    message(\dots, domain=NULL, appendLF=TRUE)
    warning(\dots, call.=TRUE, immediate.=FALSE, domain=NULL)
    stop(\dots, call.=TRUE, domain=NULL)
}
\arguments{
    \item{file}{Name of the log file as a string (default is
\file{rlogging.log}). Set to \code{NULL} if no file output is desired.}
    \item{folder}{Root folder where the log file should be written to (default
is the current working directory).}
    \item{level}{Logging level (default is \sQuote{INFO}, others are
\sQuote{WARN} and \sQuote{STOP}).}
    \item{\dots}{R objects to be converted into a log message. Passed on to
\command{base::message()}, \command{base::warning()}, and \command{base::stop()}.}
    \item{domain}{Passed on to \command{base::message()}, \command{base::warning()}, and
\command{base::stop()}.}
    \item{appendLF}{Passed on to \command{base::message()}.}
    \item{call.}{Passed on to \command{base::warning()} and \command{base::stop()}.}
    \item{immediate.}{Passed on to \command{base::warning()}.}
}
\details{
This package provides simple logging functionality on top of R's
\command{message()}, \command{warning()}, and \command{stop()} functions. These functions
are matched to the three logging levels \sQuote{INFO}, \sQuote{WARN}, and
\sQuote{STOP} respectively.
When loading the package, the level is set to \sQuote{INFO} and messages will be
printed to the console as well as a text file \file{rlogging.log} in the working
directory. The name and location of the log file can be changed with
\command{SetLogFile}. If you do not want to write to a file, do
\command{SetLogFile(NULL)}. If the file already exists, then new messages will
be appended to the existing messages.

Log messages start with a timestamp (i.e. the result of
\command{format(Sys.time())}) surrounded by square brackets, followed by the
logging level, also surrounded in square brackets, and finally the message
itself. For example, \command{message("Hello world!")} will print 
\preformatted{[2013-09-12 17:14:46] [INFO] Hello world!} 
to the console and append the same message to the log file if this one is not
set to \code{NULL}.

If the log level is set to \sQuote{INFO}, then all three functions will print a
message. If set to \sQuote{WARN} then only \command{warning()} and
\command{stop()} will print log messages. Finally, if set to \sQuote{STOP}, then
a log message is only printed in case of an error. Note that in case of
\command{warning()} and \command{stop()} the message is always forwarded to the
base function to retain their usual behaviour (i.e. saving warning messages
until later and stopping the execution of a program after an error has
occurred).
}
\note{
The behaviour of the \command{stopifnot()} command in R's base package is not
changed, therefore no log messages will be printed or written to the log file.
}
\seealso{
    See the functions \link[base]{message}, \link[base]{warning}, and 
    \link[base]{stop} in R's base package for their usage.
}
\author{Maarten-Jan Kallen \email{sayhi@maartenjan.org}}
\value{
    \command{GetLogFile} returns a string with the full path to the log file.

    \command{GetLogLevel} returns a string with the current log level.
}

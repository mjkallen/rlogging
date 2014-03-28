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
    SetLogFile(base.file="rlogging.log", folder=getwd(), split.files=F)
    GetLogFile(level)

    SetLogLevel(level="INFO")
    GetLogLevel()

    SetTimeStampFormat(ts.format="[\%Y-\%m-\%d \%H:\%M:\%S]")
    GetTimeStampFormat()

    SetFilenameSuffixes(file.name.suffixes=list(INFO="message",
                                                WARN="warning",
                                                STOP="stop"))
    GetFilenameSuffixes()

    message(\dots, domain=NULL, appendLF=TRUE)
    warning(\dots, call.=TRUE, immediate.=FALSE, domain=NULL)
    stop(\dots, call.=TRUE, domain=NULL)
}
\arguments{
    \item{base.file}{Base name of the log file(s) as a string (default is
\file{rlogging.log}). Set to \code{NULL} if no file output is desired.}
    \item{folder}{Root folder where the log file should be written to (default
is the current working directory).}
    \item{split.files}{Boolean indicating whether messages, warnings, and
      errors should be split into several files. If set to \code{FALSE}, all
      logging output will be written into the file provided by the
      \code{base.file} parameter. The prefixes \sQuote{INFO}, \sQuote{WARN},
      and \sQuote{STOP} will be used to differentiate the different logging
      levels in the log. If set to \code{TRUE}, each level will be logged into
      its own log file using respective suffixes for the log filenames. The
      suffixes are settable through the \command{SetFilenameSuffixes} function.}
    \item{level}{Logging level (default is \sQuote{INFO}, others are
\sQuote{WARN} and \sQuote{STOP}).}
    \item{ts.format}{A string providing the format used for timestamps in log
      files. See \command{base::strptime} for a documentation of formatting
      options.}
    \item{file.name.suffixes}{Named \code{list} of filename suffixes to be
      used when \code{split.files} is set to \code{TRUE}. The list must contain
    the three elements \sQuote{INFO}, \sQuote{WARN},
      and \sQuote{STOP}.}
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
be appended to the existing messages. If you wish to split messages, warnings,
and errors accross multiple files, you can do so by setting the
\code{split.files} parameter to the \command{SetLogFile} function to
\code{TRUE}.

Log messages start with a timestamp (i.e. the result of
\command{format(Sys.time())}) surrounded by square brackets, followed by the
logging level, also surrounded in square brackets, and finally the message
itself. For example, \command{message("Hello world!")} will print 
\preformatted{[2013-09-12 17:14:46] [INFO] Hello world!} 
to the console and append the same message to the log file if this one is not
set to \code{NULL}. If \code{split.files} is set to \code{TRUE}, the logging
level is not printed to file, but is still printed to console. The format of
the timestamp can be changed through the function \command{SetTimeStampFormat}.

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
\author{Maarten-Jan Kallen \email{sayhi@maartenjan.org}

        Felix Jung \email{felix@jung.fm}
}
\value{
    \command{GetLogFile} returns a string with the full path to the log
    file, possibly specified through the \code{level} parameter.

    \command{GetLogLevel} returns a string with the current log level.

    \command{GetTimeStampFormat} returns a \code{string} containing the
    timestamp format.

    \command{GetFilenameSuffixes}{Returns the named \code{list} of filename
      suffixes.}
}

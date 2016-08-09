A simple logging facility for R
===============================

This package takes a different approach compared to other R packages like the
[log4r](http://cran.r-project.org/package=log4r), 
[futile.logger](http://cran.r-project.org/package=futile.logger) and 
[logging](http://cran.r-project.org/package=logging) packages. Whereas these are
inspired by Java's [log4j](http://logging.apache.org/log4j/) or Python's 
[logging module](http://docs.python.org/2/library/logging.html), *rlogging* masks
R's `message()`, `warning()` and `stop()` functions to provide the option to
write uniform log messages to the console and/or a text file.

Benefits
--------

This simple approach provides a number of benefits:

  * it's simple
  * no changes to existing code required
  * no dependencies on other R packages except R's base package

Functionality
-------------

In essence, logging is the act of displaying diagnostic and informative messages
during the execution of a software program. Log messages can be used to debug
software, to inform the user of the progress of long calculations, to document
scripts, or to support the auditing of software and the results of complicated
calculations.

R has a number of functions which can be used for logging purposes. Most people
will be familiar with the `cat()` command, which concatenates its arguments and
prints the result to the console or to a text file. In practice, you will want
a little more control over the level of detail of logging messages. Also, you
will need to put a `cat()` statement before each `warning()` and `stop()`
command to ensure that these events will show up in the logs. Because these two
commands and the `message()` command write to 
[stderr](http://en.wikipedia.org/wiki/Standard_streams), 
the messages may get lost when running R scripts in batch mode.

To provide a slightly more advanced logging facility compared to using only the
`cat()` command, I have created the *rlogging* package. The idea is to use three
existing commands in R's base package, namely `message()`, `warning()`, and
`stop()` to provide three logging levels: 'INFO', 'WARN', and 'STOP'
respectively. The package provides a wrapper around these commands (i.e. it
'masks' them) to output time-stamped log messages to the console and a text
file. For example, the `message()` command prints a log message if the logging
level is set to 'INFO':

    > message("Hello world!")
    [2013-09-20 07:56:07] [INFO] Hello world!
    >

Each message starts with the timestamp and the logging level so it's easy to
find (e.g. using *grep*) different types of log messages in the log file.

### Warnings and errors

So you can use the `message()` command to output informative or debugging
messages. The `warning()` command also (immediately) writes a time-stamped
message to the console and log file, but it also retains its original
behaviour. This means that, by default, warning messages are collected and
shown only after the program is finished. These can be recalled with the
`warnings()` function and suppressed by setting `options(warn=-1)`. Note that
the latter does not suppress the log messages. See the next section on logging
levels which allow you to control this behaviour. Here's a session which
demonstrates the use of `warning()`:

    > GetLogLevel()
    [1] "INFO"
    > warning("Be careful!")
    [2013-09-20 08:56:32] [WARN] Be careful!
    Warning message:
    In warning("Be careful!") : Be careful!
    > warnings()
    Warning message:
    In warning("Be careful!") : Be careful!
    > options(warn=-1)
    > warning("Be careful!")
    [2013-09-20 08:56:56] [WARN] Be careful!
    > 

As you can see, the first `warning()` prints the same message twice: the first
one is the time-stamped log message (which is also written to the log file) and
the second one is the message written to `stderr` by the `warning()` command in
R's base package. The second `warning()` only prints the time-stamped log
message because the printing of warnings has been suppressed.

Like the `warning()` function, the `stop()` function also retains its original
behaviour, i.e. it prints the error message and stops the execution of the
program. The difference is that a log message is also created so there is no
need to add an extra `cat()` statement right before the call to `stop()`. This
is especially useful when running R scripts in batch mode and messages to
`stderr` may be lost. Here again, the same message is printed to the console
twice, but this can not be suppressed. Note that the behaviour of the
`stopifnot()` command is not changed by the package, therefore this command
does not write a log message.

### Logging levels

Each of the three functions is linked to one of three logging levels: 'INFO',
'WARN', and 'STOP'. The following table summarizes when messages are printed:

    Level   message()   warning()   stop()
    INFO    yes         yes         yes
    WARN    no          yes         yes
    STOP    no          no          yes

Error messages are always printed, but information messages and warnings can be
suppressed.

### Log file

By default, log messages are appended to a file *rlogging.log* in the current
working directory. You can change the name and location of this file with the
`SetLogFile(file, folder)` command provided by the package:

    SetLogFile("mylogfile.txt") # use 'mylogfile.txt' in the current working directory
    SetLogFile(folder="~") # save 'mylogfile.txt' in my home directory
    SetLogFile(file="mylogfile.txt", folder="~") # same as both commands above

If you do not want to write to a file, then you set the file to `NULL` as in
the following example:

    SetLogFile(NULL)

Installation
------------

  1. Use the `install_github()` command from the [devtools](https://github.com/hadley/devtools) package.
  2. Download and install manually:

        git clone https://github.com/mjkallen/rlogging.git
        R CMD INSTALL rlogging

License
-------

MIT license. See the LICENSE file for details.

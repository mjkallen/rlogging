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

  * write log messages to a text file, the name and location of which can be set
    by the user
  * choose one of three logging levels (INFO, WARN, and STOP) to control which
    messages are suppressed

See [this blog post](http://www.maartenjan.org/artikelen/2013-09-20-introducing-the-rlogging-package-for-simple-logging-in-r.html) 
for instructions on how to use the package.

Installation
------------

  1. Use the `install_github()` command from the [devtools](https://github.com/hadley/devtools) package.
  2. Download and install manually:

        git clone https://github.com/mjkallen/rlogging.git
        R CMD INSTALL rlogging

License
-------

MIT license. See the LICENSE file for details.

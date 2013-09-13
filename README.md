A simple logging facility for R
===============================

This package takes a different approach compared to other R packages like the
[log4r](), [futile.logger]() and [logging]() packages. Whereas these are
inspired by Java's [log4j]() or Python's [logging module](), *rlogging* masks
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
  * choose one of three logging levels (INFO, WARN, and FATAL) to control which
    messages are suppressed

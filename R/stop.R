stop <- function(..., call.=TRUE, domain=NULL) {

    args <- list(...)
    is.condition <- length(args) == 1L && inherits(args[[1L]], "condition")
    if (!is.condition) {
        # error messages are always printed (i.e. for levels INFO, WARN and STOP)
        PrintLogMessage("[STOP] ", ...)
    }
    base::stop(..., call.=call., domain=domain)
    invisible()

}

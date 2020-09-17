##' A function used for its side effect. It creates the directory and files for
##' the shell lesson.
##'
##' @title Prepare Shell data
##'
##' @param shell_dir `character(1)` with the name of the shell data directory. Default
##'     is `"shell_data"`.
##'
##' @param rm_dir `logical(1)` that defines whether `shell_dir` is going to be
##'     recursively removed. Default is `FALSE`.
##'
##' @return Invisibly returns `TRUE`.
##'
##' @export
##' @author Laurent Gatto
prepare_shell <- function(shell_dir = "shell_data", rm_dir = FALSE) {
    shell_dir <- shell_dir[1]
    message("Preparing shell data in '", shell_dir, "'.")
    if (dir.exists(shell_dir)) {
        if (rm_dir) unlink(shell_dir, recursive = TRUE, force = TRUE)
        else stop(shell_dir, " exists. Either delete it manuall, set `rm_dir = TRUE`, or use a different name.")
    }
    dir.create(shell_dir)
    message(shell_dir, " is ready.")
    invisible(TRUE)
}
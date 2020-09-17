make_sim <- function(n = 250) {
    c("id, x, y",
      replicate(n, paste(sample(letters, 1), rnorm(1), rnorm(1), sep = ",")))
}

make_dna <- function(n = 50, k = 50)
    replicate(n, paste(sample(c("A", "C", "G", "T"), n, replace = TRUE), collapse = ""))


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
    data_dir <- paste0(shell_dir, "/data")
    dir.create(data_dir)
    ## add  fasta files
    for (i in 1:100) {
        f <- paste0(data_dir, "/seq_", i, ".fas")
        s <-
        h <- paste0("> SEQUENCE ", i, " (", date(), ")")
        writeLines(c(h, make_dna()), con = f)
    }
    ## add sim files
    for (i in 1:100) {
        f <- paste0(data_dir, "/sim_", i, ".csv")
        writeLines(make_sim(), con = f)
    }
    ## add inst/extdata
    deseq2_dir <- dir(system.file("extdata", package = "rWSBIM2122"),
                      full.names = TRUE, pattern = "deseq2")
    rnaseq_dir <- dir(system.file("extdata", package = "rWSBIM2122"),
                      full.names = TRUE, pattern = "RNAseq_pipeline")
    stopifnot(file.copy(deseq2_dir, shell_dir, recursive = TRUE))
    stopifnot(file.copy(rnaseq_dir, shell_dir, recursive = TRUE))
    message(shell_dir, " is ready.")
    invisible(TRUE)
}
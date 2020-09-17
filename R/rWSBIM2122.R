#' @import SummarizedExperiment
#' @import DESeq2
#' @import tidyverse

#' @title Package version
#'
#' @importFrom utils packageVersion
#' @export
#' @examples
#' ## check the package version that is currently installed
#' rWSBIM2122version()
rWSBIM2122version <- function()
    utils::packageVersion("rWSBIM2122")

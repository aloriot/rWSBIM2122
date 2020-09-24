set.seed(123)
lmdata <- matrix(
    c(rnorm(12, 5, 1), ## not sign
      c(rnorm(6, 6, 0.4), rnorm(6, 4, 1)), ## sign condition
      c(rnorm(1, 3, 0.5), rnorm(1, 5, 1),  ## sign cell_type
        rnorm(1, 3, 0.5), rnorm(1, 5, 1),
        rnorm(1, 3, 0.5), rnorm(1, 5, 1),
        rnorm(1, 3, 0.5), rnorm(1, 5, 1),
        rnorm(1, 3, 0.5), rnorm(1, 5, 1),
        rnorm(1, 3, 0.5), rnorm(1, 5, 1)),
      rnorm(12, 6, 2), ## not sign
      c(6.56233, 4.8324,
        5.51878, 4.1367,
        5.74783, 5.1782,
        4.08734, 6.2132,
        4.64667, 5.4315,
        4.86734, 5.5354)
      ),
    ncol = 12,
    nrow = 5,
    byrow = TRUE,
    dimnames = list(
        paste0("gene_", 1:5),
        paste0("sample_", 1:12)
    ))

lmdata <- round(lmdata, 5)

lmannot <- data.frame(
    sample = paste0("sample_", 1:12),
    condition = rep(c("ctrl", "cond"), each = 6),
    cell_type = rep(c("A", "B"), 6))

save(lmdata, lmannot, file = "../../data/lmdata.rda")
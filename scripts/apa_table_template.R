# APA 7th edition table template — flextable + officer
# Verify all values, labels, and notes before running.
# install.packages(c("flextable", "officer"))

library(flextable)
library(officer)

# ── Helpers ───────────────────────────────────────────────────────────────────

fmt2  <- function(x) formatC(x, digits = 2, format = "f")
fmt3  <- function(x) formatC(x, digits = 3, format = "f")
fmt_p <- function(p) ifelse(p < .001, "< .001", fmt3(p))

stars <- function(p) {
  ifelse(p < .001, "***", ifelse(p < .01, "**", ifelse(p < .05, "*", "")))
}

save_apa_table <- function(ft, table_number, table_title, note_text = NULL,
                           filename = "apa_table.docx") {
  doc <- read_docx() |>
    body_add_fpar(fpar(ftext(table_number, prop = fp_text(bold = TRUE)))) |>
    body_add_fpar(fpar(ftext(table_title,  prop = fp_text(italic = TRUE)))) |>
    body_add_flextable(ft)

  if (!is.null(note_text)) {
    doc <- body_add_fpar(doc,
      fpar(
        ftext("Note. ", prop = fp_text(italic = TRUE)),
        ftext(note_text)
      )
    )
  }

  print(doc, target = filename)
  message("Saved: ", filename)
}

apply_apa <- function(ft, stub_col = 1) {
  nc <- ncol(ft$body$dataset)
  ft |>
    theme_apa() |>
    align(j = stub_col, align = "left",   part = "all") |>
    align(j = seq_len(nc)[-stub_col], align = "center", part = "all") |>
    align(part = "header", align = "center") |>
    autofit()
}

# ══ TABLE TYPE 1: Descriptive Statistics ══════════════════════════════════════
# Uncomment and fill values from your output.

# df1 <- data.frame(
#   Variable = c("Age", "Score A", "Score B"),
#   n        = c(120, 120, 118),
#   M        = c(32.4, 3.45, 2.89),
#   SD       = c(8.1,  0.78, 0.65),
#   Min      = c(18,   1.00, 1.00),
#   Max      = c(65,   5.00, 5.00)
# )
#
# ft1 <- flextable(df1) |>
#   set_header_labels(Variable = "Variable", n = "n", M = "M",
#                     SD = "SD", Min = "Min", Max = "Max") |>
#   apply_apa()
#
# save_apa_table(ft1,
#   table_number = "Table 1",
#   table_title  = "Descriptive Statistics for Study Variables",
#   note_text    = "M = mean; SD = standard deviation.",
#   filename     = "Table1_descriptive.docx")

# ══ TABLE TYPE 2: Independent Samples t-Test ══════════════════════════════════

# df2 <- data.frame(
#   Variable  = c("Outcome 1", "Outcome 2"),
#   G1_M_SD   = c("3.45 (0.78)", "2.10 (0.55)"),
#   G2_M_SD   = c("2.89 (0.65)", "1.95 (0.61)"),
#   t         = c( 2.34,  1.12),
#   df        = c(118.0, 116.0),
#   p         = c(0.021,  0.265),
#   d         = c( 0.43,   0.21)
# )
# df2$p_fmt <- fmt_p(df2$p)
# df2$d_fmt <- fmt2(df2$d)
#
# ft2 <- flextable(df2[, c("Variable","G1_M_SD","G2_M_SD","t","df","p_fmt","d_fmt")]) |>
#   set_header_labels(
#     Variable = "Variable", G1_M_SD = "Group A\nM (SD)", G2_M_SD = "Group B\nM (SD)",
#     t = "t", df = "df", p_fmt = "p", d_fmt = "d"
#   ) |>
#   apply_apa()
#
# save_apa_table(ft2,
#   table_number = "Table 2",
#   table_title  = "Comparison of Outcome Scores Between Groups",
#   note_text    = "M = mean; SD = standard deviation; d = Cohen's d.",
#   filename     = "Table2_ttest.docx")

# ══ TABLE TYPE 3: One-Way ANOVA ════════════════════════════════════════════════

# df3 <- data.frame(
#   Source = c("Between Groups", "Within Groups", "Total"),
#   SS     = c(12.34, 45.67, 58.01),
#   df     = c(2,    117,   119),
#   MS     = c(6.17,  0.39,   NA),
#   F      = c(15.82,   NA,   NA),
#   p      = c(0.001,   NA,   NA),
#   eta2   = c(0.21,    NA,   NA)
# )
# df3 <- df3 |>
#   dplyr::mutate(across(c(SS, MS), fmt2),
#                 F    = ifelse(is.na(F),    "", fmt2(F)),
#                 p    = ifelse(is.na(p),    "", fmt_p(p)),
#                 eta2 = ifelse(is.na(eta2), "", fmt2(eta2)))
#
# ft3 <- flextable(df3) |>
#   set_header_labels(Source = "Source", SS = "SS", df = "df",
#                     MS = "MS", F = "F", p = "p", eta2 = "η²") |>
#   apply_apa()
#
# save_apa_table(ft3,
#   table_number = "Table 3",
#   table_title  = "One-Way ANOVA Results",
#   note_text    = "η² = eta-squared (effect size).",
#   filename     = "Table3_anova.docx")

# ══ TABLE TYPE 4: Correlation Matrix ═════════════════════════════════════════

# variables <- c("Variable 1", "Variable 2", "Variable 3")
# M_vec  <- c(3.45, 2.89, 4.12)
# SD_vec <- c(0.78, 0.65, 0.91)
#
# r_mat <- matrix(c(
#    1.00,  0.45,  0.32,
#    0.45,  1.00,  0.61,
#    0.32,  0.61,  1.00
# ), nrow = 3, byrow = TRUE)
#
# p_mat <- matrix(c(
#   NA,   .001,  .012,
#   .001, NA,    .001,
#   .012, .001,  NA
# ), nrow = 3, byrow = TRUE)
#
# r_fmt <- matrix(
#   ifelse(is.na(p_mat), "—",
#          paste0(fmt2(r_mat), sapply(p_mat, function(p) if (is.na(p)) "" else stars(p)))),
#   nrow = 3
# )
# diag(r_fmt) <- "—"
#
# df4 <- data.frame(
#   Variable = variables,
#   M        = fmt2(M_vec),
#   SD       = fmt2(SD_vec),
#   r_fmt,
#   check.names = FALSE
# )
# colnames(df4)[4:ncol(df4)] <- as.character(seq_along(variables))
#
# ft4 <- flextable(df4) |>
#   set_header_labels(Variable = "Variable", M = "M", SD = "SD") |>
#   apply_apa()
#
# save_apa_table(ft4,
#   table_number = "Table 4",
#   table_title  = "Descriptive Statistics and Intercorrelations",
#   note_text    = paste0("N = XX. Values on the diagonal are omitted. ",
#                         "*p < .05. **p < .01. ***p < .001."),
#   filename     = "Table4_correlation.docx")

# ══ TABLE TYPE 5: Regression ══════════════════════════════════════════════════

# df5 <- data.frame(
#   Variable = c("(Constant)", "Predictor 1", "Predictor 2"),
#   B        = c(1.23,  0.45, -0.18),
#   SE       = c(0.31,  0.12,  0.09),
#   beta     = c(NA,    0.38, -0.21),
#   t        = c(3.97,  3.75, -2.00),
#   p        = c(0.001, 0.001, 0.048),
#   CI_LL    = c(0.62,  0.22, -0.36),
#   CI_UL    = c(1.84,  0.68, -0.00)
# )
# df5$beta_fmt <- ifelse(is.na(df5$beta), "", fmt2(df5$beta))
# df5$CI_fmt   <- paste0("[", fmt2(df5$CI_LL), ", ", fmt2(df5$CI_UL), "]")
# df5$p_fmt    <- fmt_p(df5$p)
#
# ft5 <- flextable(df5[, c("Variable","B","SE","beta_fmt","t","p_fmt","CI_fmt")]) |>
#   set_header_labels(
#     Variable = "Variable", B = "B", SE = "SE",
#     beta_fmt = "β", t = "t", p_fmt = "p", CI_fmt = "95% CI"
#   ) |>
#   apply_apa()
#
# save_apa_table(ft5,
#   table_number = "Table 5",
#   table_title  = "Multiple Regression Results Predicting [Outcome]",
#   note_text    = "R² = .XX, F(df1, df2) = XX.XX, p = .XXX. CI = confidence interval.",
#   filename     = "Table5_regression.docx")

# ══ TABLE TYPE 6: Mediation / PROCESS ════════════════════════════════════════

# df6 <- data.frame(
#   Path   = c("X → M (a)", "M → Y (b)", "X → Y (c')", "Indirect (a×b)"),
#   B      = c( 0.45, 0.38,  0.12, 0.17),
#   SE     = c( 0.11, 0.09,  0.10, 0.06),
#   t_z    = c( 4.09, 4.22,  1.20,   NA),
#   p      = c( 0.001, 0.001, 0.232,  NA),
#   CI_LL  = c( 0.23, 0.21, -0.08,  0.06),
#   CI_UL  = c( 0.67, 0.55,  0.32,  0.30)
# )
# df6$t_z_fmt <- ifelse(is.na(df6$t_z), "—", fmt2(df6$t_z))
# df6$p_fmt   <- ifelse(is.na(df6$p),   "—", fmt_p(df6$p))
# df6$CI_fmt  <- paste0("[", fmt2(df6$CI_LL), ", ", fmt2(df6$CI_UL), "]")
#
# ft6 <- flextable(df6[, c("Path","B","SE","t_z_fmt","p_fmt","CI_fmt")]) |>
#   set_header_labels(
#     Path = "Path", B = "B", SE = "SE", t_z_fmt = "t / z", p_fmt = "p",
#     CI_fmt = "95% CI"
#   ) |>
#   apply_apa()
#
# save_apa_table(ft6,
#   table_number = "Table 6",
#   table_title  = "Mediation Analysis Results",
#   note_text    = paste0("Indirect effect CI based on 5,000 bootstrap samples. ",
#                         "X = [predictor]; M = [mediator]; Y = [outcome]."),
#   filename     = "Table6_mediation.docx")

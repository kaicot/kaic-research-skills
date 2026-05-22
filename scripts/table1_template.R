# Editable Table 1 template.
# Install gtsummary once if needed:
# install.packages("gtsummary")

library(gtsummary)

df <- read.csv("PATH/TO/analysis_data.csv", check.names = FALSE)

table_vars <- c(
  "age",
  "sex",
  "education",
  "self_rated_health",
  "outcome_continuous"
)

table_1 <- df |>
  dplyr::select(dplyr::all_of(c("group_variable", table_vars))) |>
  tbl_summary(
    by = group_variable,
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "ifany"
  ) |>
  add_overall() |>
  add_p()

table_1

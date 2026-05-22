# Editable first-pass CSV inspection template.
# Change `data_path` and documented missing codes before running.

data_path <- "PATH/TO/data.csv"
na_codes <- c("", "NA")

df <- read.csv(
  data_path,
  na.strings = na_codes,
  check.names = FALSE,
  fileEncoding = "UTF-8-BOM"
)

cat("Rows:", nrow(df), "\n")
cat("Columns:", ncol(df), "\n\n")

profile <- data.frame(
  variable = names(df),
  class = vapply(df, function(x) paste(class(x), collapse = "/"), character(1)),
  missing_n = vapply(df, function(x) sum(is.na(x)), integer(1)),
  unique_n = vapply(df, function(x) length(unique(x[!is.na(x)])), integer(1)),
  stringsAsFactors = FALSE
)

print(profile, row.names = FALSE)

cat("\nSmall-value previews for candidate categorical variables:\n")
for (name in names(df)) {
  values <- unique(df[[name]][!is.na(df[[name]])])
  if (length(values) <= 12) {
    cat("\n", name, "\n", sep = "")
    print(table(df[[name]], useNA = "ifany"))
  }
}

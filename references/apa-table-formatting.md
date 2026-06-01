# APA Table Formatting

## Table of Contents

1. Trigger and scope
2. APA 7th edition table structure
3. Parse procedure
4. Table type patterns
5. R code generation
6. Note formatting
7. Output contract

## Trigger and Scope

Use this reference when the user pastes statistical output (SPSS, R, PROCESS, or
manual values) and requests an APA-formatted table, or asks for a .docx table.

Table mode is distinct from Manuscript mode: the deliverable is a standalone
.docx file containing an APA-formatted table, not prose. It can be combined with
Interpret mode when the user also needs a written interpretation.

## APA 7th Edition Table Structure

Every APA table requires these elements in this order:

1. **Table number** — bold, above the title (e.g., `Table 1`)
2. **Table title** — italic, title case, one double-spaced line below the number
3. **Column headings** — centered, sentence case; stub heading for leftmost column
4. **Table body** — stub column left-aligned; other columns centered
5. **Notes** (if needed) — below the table, word "Note" in italic, period after

**Borders:** horizontal only — top of table, bottom of table, below column
headings. No vertical borders. No cell borders. No borders between data rows.

**Spanner headings:** when columns share a superordinate category, use a spanner
with a partial border beneath it spanning only those columns.

**Significance stars:** use `*p < .05. **p < .01. ***p < .001.` in a probability
note. Do not use dagger symbols unless journal requires it.

## Parse Procedure

### Step 1 — Identify table type

Examine the pasted output and match to a pattern in the Table Type Patterns
section. State the identified type before generating code.

### Step 2 — Extract values

Pull exact numeric values from the output. Do not round differently from the
output unless the user specifies a rounding rule. APA standard is two decimal
places for most statistics; p-values reported as exact to two or three decimals
(use `< .001` when p < .001, never `p = .000`).

Common SPSS output patterns:
- **Descriptives block:** Mean, Std. Deviation, N in rows per variable
- **Independent samples t-test:** `t`, `df`, `Sig. (2-tailed)`, `Mean Difference`,
  `Std. Error Difference`, `95% CI` (Lower/Upper)
- **One-way ANOVA:** Between/Within Groups rows with `Sum of Squares`, `df`,
  `Mean Square`, `F`, `Sig.`
- **Correlations block:** matrix with `Pearson Correlation`, `Sig. (2-tailed)`, `N`
- **Coefficients block (regression):** `B`, `Std. Error`, `Beta`, `t`, `Sig.`,
  sometimes `95.0% Confidence Interval`
- **PROCESS output:** path-by-path blocks with `coeff`, `se`, `t`/`z`, `p`,
  `LLCI`, `ULCI`

Common R output patterns:
- `t.test()`: `t`, `df`, `p-value`, `conf.int`, `mean in group`
- `aov()` + `summary()`: `Df`, `Sum Sq`, `Mean Sq`, `F value`, `Pr(>F)`
- `cor()` / `Hmisc::rcorr()`: correlation matrix, p-value matrix
- `lm()` + `summary()`: `Estimate`, `Std. Error`, `t value`, `Pr(>|t|)`,
  `Multiple R-squared`, `F-statistic`
- `mediation` / PROCESS-equivalent: indirect effect with CI

### Step 3 — Map to column layout

Use the appropriate column layout from the Table Type Patterns section.
Adapt column headers to match the actual variables in the output.

### Step 4 — Generate complete R script

Produce a complete, paste-ready R script. See R Code Generation section.

## Table Type Patterns

### Descriptive Statistics (Table 1 / demographic table)

Minimum columns: `Variable`, `n`, `%` or `M`, `SD`, `Range`
For group comparisons add one column set per group.

```
Variable          n      %      M     SD
Gender
  Male           45   37.5
  Female         75   62.5
Age                              32.4   8.1   18–65
```

### Independent Samples t-Test

Columns: `Variable`, `Group1 M (SD)`, `Group2 M (SD)`, `t`, `df`, `p`, `d`

Report Levene's test result in a general note if significant.
Cohen's d = mean difference / pooled SD.

### Paired Samples t-Test

Columns: `Variable`, `Pre M (SD)`, `Post M (SD)`, `t`, `df`, `p`, `d`

### One-Way ANOVA

Columns: `Source`, `SS`, `df`, `MS`, `F`, `p`, `η²`
Sources: Between Groups, Within Groups, Total.

### Descriptive Statistics + Correlation Matrix

Rows = variables. Columns: `M`, `SD`, `1`, `2`, `3`, …
Diagonal is empty (or 1.00). Lower triangle contains r values.
Significance indicated with superscript stars linked to a probability note.

### Hierarchical / Multiple Regression

One block per model step if hierarchical. Columns:
`Variable`, `B`, `SE`, `β`, `t`, `p`, `95% CI [LL, UL]`
Footer block: `R² = .xx`, `ΔR² = .xx`, `F(df1, df2) = xx.xx, p = .xxx`

### Mediation (PROCESS Model 4)

Sections: Direct effects, Indirect effect(s).
Columns: `Path`, `B`, `SE`, `t`/`z`, `p`, `95% CI [LL, UL]`
Indirect effect uses bootstrap CI; note bootstrap iterations in a general note.

### Moderation (PROCESS Model 1)

Columns: `Variable`, `B`, `SE`, `t`, `p`, `95% CI [LL, UL]`
Include interaction term row. Report conditional effects at ±1 SD in a note or
separate panel.

### Factor Analysis

Rows = items. Columns = factor labels. Values = loadings.
Suppress (or italicize) loadings < .30. Note extraction method and rotation in a
general note.

## R Code Generation

Always generate a complete script. Do not generate partial snippets.

Required packages: `flextable`, `officer`. Include installation comment at top.

Script structure:
1. Package loading
2. Data — one data frame per table section, values filled from parsed output
3. flextable construction
4. APA formatting (theme, borders, alignment)
5. Notes
6. Word document assembly
7. Save

### Core pattern

```r
# install.packages(c("flextable", "officer"))
library(flextable)
library(officer)

# ── 1. Data ──────────────────────────────────────────────────────────────────
df <- data.frame(
  Variable = c("..."),   # fill from output
  M        = c(...),
  SD       = c(...)
)

# ── 2. Build flextable ────────────────────────────────────────────────────────
ft <- flextable(df) |>
  set_header_labels(Variable = "Variable", M = "M", SD = "SD") |>
  theme_apa() |>
  align(j = 1, align = "left",   part = "all") |>
  align(j = seq(2, ncol(df)), align = "center", part = "all") |>
  align(part = "header", align = "center") |>
  autofit()

# ── 3. Notes ─────────────────────────────────────────────────────────────────
ft <- add_footer_lines(ft, values = "Note. M = mean; SD = standard deviation.") |>
  align(align = "left", part = "footer") |>
  italic(part = "footer", j = 1)  # italicizes "Note"

# ── 4. Word document ──────────────────────────────────────────────────────────
table_number <- "Table 1"
table_title  <- "Descriptive Statistics for Study Variables"

doc <- read_docx() |>
  body_add_fpar(fpar(ftext(table_number, prop = fp_text(bold = TRUE)))) |>
  body_add_fpar(fpar(ftext(table_title,  prop = fp_text(italic = TRUE)))) |>
  body_add_flextable(ft)

print(doc, target = "Table1_descriptive.docx")
message("Saved: Table1_descriptive.docx")
```

### APA border corrections

`theme_apa()` handles most borders. If manual adjustment is needed:

```r
ft <- ft |>
  border_remove() |>
  hline_top(border = fp_border(width = 1.5), part = "header") |>
  hline_bottom(border = fp_border(width = 1),   part = "header") |>
  hline_bottom(border = fp_border(width = 1.5), part = "body")
```

### Spanner headings (column groups)

```r
ft <- add_header_row(ft,
  values = c("", "Group A", "Group B"),
  colwidths = c(1, 2, 2)
) |>
  hline(i = 1, j = 2:3, border = fp_border(width = 0.5), part = "header") |>
  hline(i = 1, j = 4:5, border = fp_border(width = 0.5), part = "header")
```

### Significance stars in cells

```r
# Add stars to p-value column
ft <- ft |>
  compose(
    j = "p",
    value = as_paragraph(as_chunk(ifelse(df$p < .001, "< .001***",
                                  ifelse(df$p < .01,  paste0(formatC(df$p, 2, format = "f"), "**"),
                                  ifelse(df$p < .05,  paste0(formatC(df$p, 2, format = "f"), "*"),
                                                      formatC(df$p, 2, format = "f"))))))
  )
```

### Note italicizing

`add_footer_lines()` does not auto-italicize "Note." Use this workaround:

```r
ft <- add_footer_lines(ft, "") |>
  compose(
    i = 1, j = 1, part = "footer",
    value = as_paragraph(
      as_chunk("Note. ", props = fp_text(italic = TRUE)),
      as_chunk("M = mean; SD = standard deviation.")
    )
  )
```

## Note Formatting

Three note types appear in this order when present:

1. **General note** — `Note.` (italic) followed by explanation of abbreviations,
   sample size, data source, or other table-wide information. End with period.
2. **Specific note** — superscript lowercase letters (`a`, `b`, …) linked to
   specific cells. Start: `a ` (superscript a, then space, then text).
3. **Probability note** — `*p < .05. **p < .01. ***p < .001.` Always italic `p`.

## Output Contract

Always produce:

1. One complete, runnable R script — values filled from the pasted output, not
   placeholders.
2. Filename suggestion matching the table type (e.g., `Table1_descriptive.docx`,
   `Table2_ttest.docx`).
3. Brief list of values the user should verify before running (e.g., variable
   labels, rounding, note text, table number).
4. Statement of what was assumed when a value was ambiguous.

Do not produce partial code or pseudocode. Do not ask clarifying questions unless
a value is genuinely missing and would change table structure (e.g., number of
groups unknown).

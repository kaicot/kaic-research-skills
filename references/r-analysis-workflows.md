# R Analysis Workflows

## Table of Contents

1. Code delivery rule
2. Preparation conventions
3. Analysis conventions
4. Template selection

## Code Delivery Rule

When the user asks for R code, provide code that can be pasted into RStudio in
execution order. Put package installation in a clearly optional block and mark
variables or paths the user must change.

## Preparation Conventions

- Prefer explicit import and recode steps.
- Rename awkward raw names to analysis aliases when the workflow will continue
  beyond a short one-off check.
- Show checks after important derived variables.
- Keep the analytic sample definition near the code that creates it.

## Analysis Conventions

- Use functions and packages suited to the method rather than hand-written
  formulas when reliability matters.
- Include diagnostics or balance checks that change interpretation.
- Avoid hiding default reference categories, missing-data behavior, weighting,
  or factor-level choices.

## Template Selection

- Use `../scripts/inspect_csv.R` for first-pass CSV profiling.
- Use `../scripts/basic_analysis_template.R` for chi-square, t-test, and ANOVA
  skeletons.
- Use `../scripts/regression_template.R` for linear, logistic, and hierarchical
  regression skeletons.
- Use `../scripts/table1_template.R` for a general-characteristics table.
- Use `../scripts/psm_template.R` with `propensity-score-matching.md`.
- Use `../scripts/survey_template.R` with `complex-survey-analysis.md`.

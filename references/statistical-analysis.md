# Statistical Analysis

## Table of Contents

1. Direct-analysis workflow
2. Basic analyses
3. Regression analyses
4. Mediation and moderation
5. Table 1
6. Output structure

## Direct-Analysis Workflow

1. Verify prepared variables and the analytic sample.
2. Choose the simplest analysis that answers the question.
3. Execute with R when direct computation is requested and available.
4. Report the model, sample size, missing-data handling, core statistics, and
   coding assumptions.
5. Separate statistical interpretation from manuscript reporting.

## Basic Analyses

For adequate inputs, run basic analyses without excessive questioning:

| Situation | Candidate analysis |
| --- | --- |
| Categorical by categorical | Cross-tabulation and chi-square test; consider Fisher-type alternatives when cells are sparse. |
| Two groups and continuous outcome | t-test or a justified alternative. |
| Three or more groups and continuous outcome | ANOVA and post hoc follow-up when needed. |
| Descriptive study profile | Frequencies, percentages, mean and SD, or median and IQR as justified. |

Include group summaries, test statistics, p-values, effect-size notes when
useful, and assumption cautions that materially affect interpretation.

## Regression Analyses

- Linear regression: report outcome direction, coefficients, uncertainty,
  model fit, major assumptions, and multicollinearity checks when relevant.
- Logistic regression: verify event coding and reference groups before
  interpreting odds ratios. Report ORs and confidence intervals for paper-facing
  output when appropriate.
- Hierarchical regression: state why blocks enter in that order and report
  model-change evidence rather than narrating only the final block.

## Mediation and Moderation

- Define X, Y, mediator M, moderator W, covariates, and data design explicitly.
- For mediation, distinguish indirect-effect evidence from a causal mechanism.
  Prefer bootstrap interval interpretation when that is the chosen workflow.
- For moderation, focus on the interaction term, scale/coding direction,
  centering decisions when relevant, simple slopes or marginal effects, and
  plot needs.
- For SPSS PROCESS requests, read `spss-syntax-and-process.md`.

## Table 1

Treat general-characteristics tables as a first-class deliverable:

- show overall characteristics or group-comparison characteristics as requested;
- use `n (%)` for categorical variables;
- use mean and SD or median and IQR for continuous variables according to the
  distribution and reporting context;
- state the comparison test or note when p-values are omitted by design;
- distinguish ordinary Table 1 from survey-weighted population summaries.

## Output Structure

For direct analysis, prefer:

### Statistical interpretation

- analytic sample and model;
- key statistics and direction;
- assumptions or diagnostics affecting the conclusion;
- limitations tied to design or coding.

### Manuscript reporting

- a concise Korean Results draft;
- the table columns and footnotes needed;
- what Discussion may say and what it should not claim.

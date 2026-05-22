# SPSS Syntax and PROCESS

## Table of Contents

1. Code delivery rule
2. SPSS syntax scope
3. PROCESS scope
4. Output interpretation checks

## Code Delivery Rule

When the user asks for SPSS Syntax, provide paste-ready Syntax first. Add
focused notes afterward for variable coding, missing-value handling, reference
groups, and values the user must verify.

## SPSS Syntax Scope

Support syntax for:

- variable recoding, reverse coding, missing values, and derived variables;
- frequencies, descriptives, cross-tabs, chi-square tests, t-tests, and ANOVA;
- linear regression, logistic regression, and hierarchical regression;
- variable labels or value labels when they reduce interpretation risk.

If a long workflow uses Korean or awkward raw variable names, prefer a clear
rename or derived-analysis-variable step and provide a raw-to-analysis map.

## PROCESS Scope

Support PROCESS macro syntax for mediation and moderation when the user supplies
or can verify:

- model type and model number when needed;
- X, Y, M, and W roles;
- covariates;
- bootstrap setting;
- binary or multicategorical coding;
- centering or probing preferences when relevant.

Do not promise direct SPSS execution. For direct local analysis, prefer an R
workflow that matches the research question and explain any non-identical
defaults.

## Output Interpretation Checks

When interpreting SPSS or PROCESS output, verify:

- outcome/event direction;
- reference categories;
- covariate set;
- total, direct, indirect, or interaction effect being discussed;
- bootstrap confidence interval for indirect effects when applicable;
- simple-slopes or conditional-effect evidence for moderation claims.

# Complex Survey Analysis

## Table of Contents

1. Required design information
2. KCHS routing
3. Workflow
4. Reporting

## Required Design Information

Use the source guide to identify:

- weight variable and any analysis-specific weight rule;
- strata variable;
- cluster, PSU, or sampling-unit variable;
- survey population and subpopulation rules;
- variance-estimation cautions from the source.

Do not treat an ordinary convenience weight as a complete survey design.

## KCHS Routing

For Korea Community Health Survey (KCHS, 지역사회건강조사) raw data, use
`kaic-chs-analysis` as the source of truth for survey design and SPSS syntax.
KCHS uses `kstrata`, `SPOT_NO`, and `wt_p`; never drop cases before
design-based subgroup analysis. Keep this document for general survey
reasoning and reporting structure.

## Workflow

1. Prepare variables and eligibility flags before defining the analysis target.
2. Define the survey design in R from documented fields.
3. Use survey-aware descriptive and regression functions for population-facing
   estimates.
4. Distinguish unweighted sample counts from weighted estimates and proportions.
5. Record the design fields and source rule used.

## Reporting

State:

- source and design fields used;
- whether estimates are weighted;
- whether counts, percentages, standard errors, confidence intervals, and
  regression estimates are survey-aware;
- how subpopulation or exclusion rules were handled;
- any guide limitation that affects variance estimation.

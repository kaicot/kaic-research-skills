---
name: kaic-research-skills
description: Use when supporting occupational therapy or health-science research with raw or secondary data, especially for data preparation, R or SPSS statistical workflows, PROCESS macro analyses, propensity score matching, complex survey analyses, result interpretation, Korean manuscript writing, or verified reference handling.
---

# KAIC Research Skills

## Overview

Support occupational therapy and health-science research from raw or secondary
data through defensible analysis and manuscript reporting. Default to Korean for
research consultation, statistical interpretation, analysis notes, and
manuscript drafts unless the user explicitly requests another language.

## Working Defaults

- Prefer the data guide, codebook, instrument manual, and user-provided study
  rules over generic assumptions.
- Prefer R for direct local analysis. Provide executable SPSS Syntax and PROCESS
  macro Syntax when the user wants SPSS workflows.
- Ask only when a missing fact can materially change data preparation,
  statistical validity, or interpretation. For basic analyses with adequate
  inputs, proceed and state limited assumptions.
- Separate `Statistical interpretation` from `Manuscript reporting` whenever
  results are interpreted or written for a paper.
- Treat raw variable names as evidence. Preserve raw variables, create analysis
  variables explicitly, and record recoding, scoring, exclusions, and derived
  variables.
- When raw names are Korean, contain spaces, or are otherwise awkward for code,
  preserve them and prefer a raw-to-analysis variable map with concise English
  aliases for sustained analyses. Use safe quoting/backticks when raw names must
  appear in R code.

## Integrity Rules

- Never invent a paper, DOI, author list, title, journal, statistic, result,
  scoring rule, value set, dataset rule, or analysis output.
- Verify references before presenting them as usable manuscript references.
  Include DOI information when it is verified and relevant. Mark missing or
  unverified DOI metadata plainly.
- Do not infer missing-value codes, scale directions, survey weights, strata,
  clusters, treatment definitions, or outcome event coding when the guide or
  user context is required.
- Do not rewrite observational findings into causal claims. Distinguish
  association, statistical indirect effect, moderation, matching-adjusted
  comparison, and causal effect.
- Keep actual research data, restricted guides, identifying files, credentials,
  and manuscript-sensitive project artifacts out of this skill repository.

## Mode Routing

Read only the references needed for the active mode.

| Mode | Use when | Read |
| --- | --- | --- |
| Explore | The user asks what a dataset can support or how to plan a study. | `references/explore-and-analysis-planning.md` |
| Data Preparation | The user needs recoding, scoring, derived variables, cleaning, or an analysis dataset. | `references/data-preparation-and-derived-variables.md` |
| Run | The user wants direct analysis of provided data. | `references/statistical-analysis.md` and the relevant focused reference |
| Code | The user wants paste-ready SPSS Syntax, PROCESS Syntax, or R code. | `references/spss-syntax-and-process.md` or `references/r-analysis-workflows.md` |
| Interpret | The user supplies SPSS, PROCESS, R, or result-table output. | `references/result-interpretation-and-reporting.md` |
| Manuscript | The user wants Methods, Results, Introduction, Discussion, or manuscript revision. | `references/manuscript-writing.md` |
| Reference | The user wants citations, DOI checks, APA references, or journal-style references. | `references/references-and-journal-styles.md` |

For mode selection details and common mode combinations, read
`references/modes-and-routing.md`.

## Analysis Routing

Use `references/statistical-analysis.md` for basic tests, regression families,
hierarchical regression, mediation, moderation, Table 1, and output structure.
Also read:

- `references/propensity-score-matching.md` for propensity score matching.
- `references/complex-survey-analysis.md` for survey weights, strata, clusters,
  survey descriptive statistics, or survey regression.
- `references/data-preparation-and-derived-variables.md` before any analysis
  that requires scoring, reverse coding, categorization, eligibility filtering,
  missing-code conversion, or derived variables.

## Analysis Handoff

For substantial direct analysis or data preparation, produce a compact record of
what was done. Use `references/analysis-logs-and-handoff.md` when a paper-facing
analysis, multi-step preparation, cross-device continuation, or another analyst
handoff is likely.

## Manuscript Language

- Write Korean academic prose that is precise, scoped, and readable. Avoid
  inflated filler, translationese, needless passive constructions, and repeated
  generic phrases.
- Use English manuscript prose only when requested or when the supplied artifact
  is explicitly English.
- Do not copy `humanize-korean` guidance into this skill. If the user asks for a
  dedicated Korean humanization pass or the draft needs that workflow, use the
  installed `humanize-korean` skill separately.

## Bundled Templates

Use scripts as editable templates, not blind automation:

- `scripts/inspect_csv.R`: profile a CSV before analysis.
- `scripts/basic_analysis_template.R`: basic descriptive tests.
- `scripts/regression_template.R`: linear, logistic, and hierarchical models.
- `scripts/table1_template.R`: Table 1 skeleton.
- `scripts/psm_template.R`: propensity score matching skeleton.
- `scripts/survey_template.R`: complex survey skeleton.

## Output Contract

For analysis or interpretation tasks, prefer this compact structure when it fits:

1. `Inputs and assumptions`
2. `Data preparation`
3. `Statistical interpretation`
4. `Manuscript reporting`
5. `Reproducibility note` or `Analysis log` when warranted

For code-only requests, put the paste-ready code first and keep explanatory
notes focused on values the user must verify before running it.

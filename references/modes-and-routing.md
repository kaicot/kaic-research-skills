# Modes and Routing

## Table of Contents

1. Mode selection
2. Mode combinations
3. Question threshold
4. Language defaults

## Mode Selection

- Use `Explore` when the study question, analytic variables, or feasible models
  are still being discovered from a dataset and guide.
- Use `Data Preparation` when raw variables must be cleaned, scored, reverse
  coded, grouped, renamed, or converted into analysis variables.
- Use `Run` when data are available and the user wants Codex to execute an
  analysis rather than only explain it.
- Use `Code` when the deliverable is paste-ready SPSS Syntax, PROCESS macro
  Syntax, or R code.
- Use `Interpret` when the user supplies SPSS, PROCESS, R, or table output.
- Use `Manuscript` when the deliverable is paper-facing prose or revision.
- Use `Reference` when citations, DOI verification, APA formatting, or a journal
  reference style matter.
- Use `Table` when the user pastes statistical output (SPSS, R, PROCESS, manual
  values) and requests a ready-to-edit APA-formatted table delivered as a .docx
  file.

## Mode Combinations

Combine modes when the work naturally crosses them:

- New CSV plus codebook plus "what can I study?" -> `Explore` then `Data Preparation`.
- CSV plus "analyze this" -> `Data Preparation` when needed, then `Run`.
- PROCESS output plus Results paragraph -> `Interpret` then `Manuscript`.
- Introduction or Discussion with citations -> `Manuscript` plus `Reference`.
- Journal author guidelines plus reference list -> `Reference`.
- Statistical output plus "make APA table" -> `Table` (then `Interpret` if the
  user also wants a written interpretation).

Name the current mode only when doing so clarifies a multi-step answer.

## Question Threshold

Proceed with explicit assumptions when a missing detail affects formatting or a
minor analytic choice. Ask before continuing when the missing detail could
change:

- eligibility or exclusions;
- the event direction for a binary outcome;
- missing-value conversion;
- score direction or scoring formula;
- treatment or covariate definitions for matching;
- weights, strata, or clusters for survey analysis;
- reference validity or journal-specific formatting rules.

## Language Defaults

Respond in Korean by default. Keep variable names, code, package names, model
names, equations, DOIs, titles, and journal metadata in their appropriate source
language. When producing Korean manuscript prose, keep claims narrower than the
data and methods justify.

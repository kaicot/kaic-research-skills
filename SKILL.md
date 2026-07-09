---
name: kaic-research-skills
description: Use when supporting research-paper statistics, data preparation, statistical interpretation, or manuscript reporting, especially for basic analysis, R, SPSS, PROCESS, mediation, moderation, propensity score matching, complex survey analysis, Korea Community Health Survey (KCHS, 지역사회건강조사) analysis in combination with kaic-chs-analysis, verified references, occupational-therapy research, or health-science research.
---

# KAIC Research Skills

## Overview

Support research-paper statistics, data preparation, interpretation, and
manuscript reporting, with occupational-therapy and health-science research as
the core domain specialization. Default to Korean for research consultation,
statistical interpretation, analysis notes, and manuscript drafts unless the
user explicitly requests another language.

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

## Routing Priority

- Use this skill as the default entry point for research-paper statistics,
  analysis preparation, statistical interpretation, or manuscript reporting.
- When a request mentions KCHS, CHS, 지역사회건강조사, KDCA community health
  survey raw data, or variables such as `kstrata`, `SPOT_NO`, or `wt_p`,
  combine this skill with `kaic-chs-analysis`. Let `kaic-chs-analysis` govern
  KCHS design variables, missing codes, scoring, SPSS complex-samples syntax,
  and PROCESS limitations; use this skill for study planning, interpretation,
  manuscript reporting, references, and APA tables.
- Prioritize this skill for statistical research work even when the study topic
  is outside occupational therapy or health science, especially for basic
  analysis, R, SPSS, PROCESS, propensity score matching, or complex surveys.
- Do not treat this skill as the default for generic web research, market or
  technology research, or general writing that is not tied to a research paper.
- Use or combine a more specific skill when the primary request is research
  ethics or integrity, generic preliminary research, general academic artifact
  review, or a dedicated Korean humanization pass.
- Honor an explicit user request to use `kaic-research-skills` when it does not
  conflict with higher-priority safety or integrity requirements.

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

## Reference Verification

Applies to: **Manuscript mode (Introduction, Discussion)** and **Reference mode**.
Do NOT apply to Methods, Results, statistical analysis, or code generation modes.

### Pool-First Procedure

When the user provides research results and requests Introduction or Discussion
writing, build a verified reference pool before writing any prose.

**Phase 1 — Build pool**

1. Extract key topics and keywords from the provided results.
2. Search PubMed MCP for each topic (primary source for health/medical/OT).
3. If PubMed returns fewer than 3 verified references for a topic, call Crossref API:
   `https://api.crossref.org/works?query=<keywords>&rows=5`
   No API key required.
4. If combined PubMed and Crossref results are still fewer than 3, call Semantic Scholar:
   `https://api.semanticscholar.org/graph/v1/paper/search?query=<keywords>&fields=title,authors,year,externalIds`
   No API key required.
5. Add a reference to the pool only when the DOI is confirmed and
   title, author list, and year are complete metadata.
   Confirmed means the DOI is returned as a primary identifier in the PubMed
   or Crossref response, or resolves via `https://doi.org/<DOI>` without error.
6. Report pool size before writing:
   "PubMed N건, Crossref N건, Semantic Scholar N건 — 검증된 문헌 N개 확보"

**Phase 2 — Write**

- Cite only pool references. APA in-text: (Author, Year) or Author (Year).
- If a claim requires a topic with 0 pool references, note inline:
  `[검증된 문헌 없음 — 이 주제 탐색 결과 0건]`
- Never fabricate, guess, or use an unverified reference under any circumstances.

**Phase 3 — Reference list**

- List only references actually cited in the body.
- Full APA format with a DOI line for every entry.
- Sort alphabetically by first author surname.
- Example entry:
  ```
  Kim, J., & Lee, S. (2022). Title of the article. Journal Name, 45(3), 123–135.
  https://doi.org/10.xxxx/xxxxx
  ```

### User-Supplied References

If the user provides a reference manually, verify it through the same
PubMed → Crossref → Semantic Scholar pipeline before using it. Do not include
user-supplied references in the pool without confirmed DOI and complete metadata.

### Codex Compatibility

PubMed MCP is available in Claude Code sessions. In Codex, use available web
search tools to query PubMed (https://pubmed.ncbi.nlm.nih.gov/?term=<keywords>)
as a fallback. Crossref and Semantic Scholar are plain HTTPS calls available in
both environments.

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
| Table | The user pastes statistical output and requests an APA-formatted table as a .docx file. | `references/apa-table-formatting.md` |

For mode selection details and common mode combinations, read
`references/modes-and-routing.md`.

## Analysis Routing

Use `references/statistical-analysis.md` for basic tests, regression families,
hierarchical regression, mediation, moderation, Table 1, and output structure.
Also read:

- `references/propensity-score-matching.md` for propensity score matching.
- `references/complex-survey-analysis.md` for survey weights, strata, clusters,
  survey descriptive statistics, or survey regression.
- `kaic-chs-analysis` plus its relevant references for KCHS/지역사회건강조사
  raw-data work; do not substitute generic survey assumptions for KCHS-specific
  rules.
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
- `scripts/apa_table_template.R`: APA-formatted Word table builder (flextable + officer).

## Output Contract

For analysis or interpretation tasks, prefer this compact structure when it fits:

1. `Inputs and assumptions`
2. `Data preparation`
3. `Statistical interpretation`
4. `Manuscript reporting`
5. `Reproducibility note` or `Analysis log` when warranted

For code-only requests, put the paste-ready code first and keep explanatory
notes focused on values the user must verify before running it.

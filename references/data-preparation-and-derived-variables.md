# Data Preparation and Derived Variables

## Table of Contents

1. Preparation workflow
2. Variable naming
3. Recoding and scoring
4. Derived-variable evidence
5. Validation outputs

## Preparation Workflow

1. Preserve the raw input and list the guide/codebook rules used.
2. Define the analytic sample and exclusions before modeling when possible.
3. Convert documented missing, nonresponse, don't-know, and not-applicable
   codes without silently deleting records.
4. Create analysis variables explicitly from raw variables.
5. Validate value ranges, missingness, distributions, event counts, and coding
   direction after every important transformation.
6. Record transformations in a quick note or full analysis log.

## Variable Naming

- Keep raw variable names visible in the variable map.
- Prefer concise English analysis names for sustained R/SPSS work.
- Do not rename away meaning. Keep a map from raw name to analysis name,
  especially when the raw name is Korean or when the analysis variable reverses
  direction.
- In R code, use backticks or safe rename steps for raw names that are Korean,
  contain spaces, or are not syntactic names.

Suggested variable map:

| Raw variable | Analysis variable | Concept | Transformation | Higher value means |
| --- | --- | --- | --- | --- |

## Recoding and Scoring

Support preparation beyond named examples:

- reverse coding;
- category collapsing and reference-group selection;
- dummy variables;
- sums, means, domain scores, and cutoff-based variables;
- index or value-set calculations when the applicable formula is verified;
- eligibility flags and analytic-sample filters;
- derived variables from multiple raw fields;
- labels and codebook notes for downstream reporting.

Never assume a common scale formula is the one used in the current source.
Check the source guide, scoring manual, validated reference, or user-provided
rule. Examples such as PHQ item sums or EQ index calculations are patterns, not
hard-coded defaults.

## Derived-Variable Evidence

For each important derived variable, retain:

- raw inputs;
- scoring or recoding rule;
- handling of missing components;
- range before and after transformation;
- direction after transformation;
- evidence source for the rule;
- manuscript-ready wording for the operational definition when needed.

## Validation Outputs

After preparation, provide the smallest useful checks:

- row counts before and after exclusions;
- counts of missing values after conversion;
- frequency or summary statistics for new analysis variables;
- unexpected values or empty categories;
- binary event counts before logistic or matching analyses;
- variable map and caution list.

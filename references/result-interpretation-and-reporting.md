# Result Interpretation and Reporting

## Table of Contents

1. Interpretation intake
2. Statistical interpretation
3. Manuscript reporting
4. Reviewer-resistant result checks
5. Common cautions

## Interpretation Intake

When an output is supplied, recover the smallest necessary context:

- model and software;
- analytic sample;
- outcome/event coding;
- predictor, mediator, moderator, and covariate roles;
- reference categories;
- data design and weighting status;
- table or output sections that are missing.

## Statistical Interpretation

Interpret what the output actually supports:

- direction and uncertainty for coefficients;
- odds-ratio direction and event coding for logistic models;
- model-change logic for hierarchical models;
- indirect-effect interval for mediation;
- interaction evidence and probing for moderation;
- balance before matched outcome interpretation;
- survey design before population inference.

## Manuscript Reporting

Provide a separate paper-facing block when requested or useful:

- Korean Results draft;
- recommended table labels, columns, and footnotes;
- limited Discussion implication;
- wording that avoids causal overreach.

## Reviewer-Resistant Result Checks

Before finalizing Results, make three checks that commonly prevent reviewer
misinterpretation:

- Reconcile the eligible cohort, outcome-valid respondents, and each
  model-specific analytic sample numerically. State the exact missing count
  when it explains a gap rather than leaving the reader to infer it.
- For hierarchical models, first determine whether every model used the same
  complete-case cohort. If so, say so and attribute coefficient changes to the
  added adjustment blocks rather than sample turnover. If cohorts differ, do
  not separate adjustment from sample-composition effects without an additional
  analysis.
- Describe a non-significant interaction as no statistical evidence that the
  association varies across the moderator. Do not present it as proof that
  effects are equal or identical. That claim requires a prespecified
  equivalence margin, an equivalence test, and compatible uncertainty; when no
  equivalence test was performed, state that limitation explicitly.

## Common Cautions

- A significant association is not automatically a clinically important effect.
- A statistical indirect effect from cross-sectional secondary data does not by
  itself prove temporal mediation.
- An interaction result needs scale-aware interpretation.
- Non-significant results still require accurate uncertainty reporting.

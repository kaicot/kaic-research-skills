# Propensity Score Matching

## Table of Contents

1. Required definitions
2. Workflow
3. Reporting

## Required Definitions

Before matching, identify:

- treatment/exposure assignment;
- outcome to be analyzed after matching;
- pre-treatment covariates for the propensity score;
- matching target and matching method;
- overlap and balance diagnostics to inspect.

Do not include post-treatment variables in the propensity model merely because
they predict the outcome.

## Workflow

1. Confirm eligible cases and treatment coding.
2. Estimate the propensity score with documented covariates.
3. Inspect overlap.
4. Match or weight according to the stated target.
5. Inspect balance before interpreting outcome differences.
6. Analyze the matched sample with uncertainty handling appropriate to the
   method and study claim.

Use R templates as a starting point, not as a substitute for study design.

## Reporting

Report:

- treatment definition;
- covariates used for score estimation;
- matching method and ratio/caliper if used;
- matched sample counts;
- balance evidence;
- outcome model or comparison;
- limitations from unmeasured confounding and observational design.

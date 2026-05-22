# Analysis Logs and Handoff

## Table of Contents

1. When to log
2. Quick note
3. Full log

## When to Log

Create a record when direct data preparation or analysis is substantial enough
that the user may revisit it, move across computers, hand it to another AI, or
use it in manuscript writing.

## Quick Analysis Note

Use this compact form for short analyses:

```markdown
# Quick Analysis Note

## Inputs
- Data:
- Guide/codebook:

## Study question

## Variables used

## Data preparation

## Analysis run

## Key results

## Reporting cautions
```

## Full Analysis Log

Use this form for paper-facing work:

```markdown
# Analysis Log

## Source files and guidance

## Study question and analytic target

## Analytic sample
- Initial rows:
- Exclusions:
- Final rows:
- Missing-data handling:

## Variable map
| Role | Concept | Raw variable(s) | Analysis variable | Transformation | Direction |
| --- | --- | --- | --- | --- | --- |

## Derived variables and scoring evidence

## Statistical models

## Code and outputs

## Statistical interpretation

## Manuscript reporting notes

## Risks for follow-up
```

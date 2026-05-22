# Editable propensity score matching template.
# Install MatchIt once if needed:
# install.packages("MatchIt")

library(MatchIt)

df <- read.csv("PATH/TO/analysis_data.csv", check.names = FALSE)

# Confirm treatment coding and use pre-treatment covariates only.
match_fit <- matchit(
  treatment ~ age + sex + baseline_health + covariate_1,
  data = df,
  method = "nearest",
  ratio = 1
)

print(summary(match_fit, standardize = TRUE))
plot(match_fit, type = "jitter")
plot(summary(match_fit), abs = TRUE)

matched_df <- match.data(match_fit)

# Replace with the outcome model justified for the matched design.
outcome_fit <- glm(
  outcome_binary ~ treatment,
  data = matched_df,
  family = binomial(),
  weights = weights
)
print(summary(outcome_fit))
print(exp(cbind(OR = coef(outcome_fit), confint(outcome_fit))))

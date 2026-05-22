# Editable regression template.
# Check outcome direction, factor reference groups, missing handling, and model
# assumptions before manuscript reporting.

df <- read.csv("PATH/TO/analysis_data.csv", check.names = FALSE)

# Example factor handling. Replace with study variables and reference levels.
df$sex <- relevel(factor(df$sex), ref = "reference_level")
df$outcome_binary <- as.integer(df$outcome_binary == "event_level")

# Multiple linear regression.
linear_fit <- lm(
  outcome_continuous ~ main_predictor + age + sex + covariate_1,
  data = df
)
print(summary(linear_fit))
print(confint(linear_fit))

# Logistic regression.
logistic_fit <- glm(
  outcome_binary ~ main_predictor + age + sex + covariate_1,
  data = df,
  family = binomial()
)
print(summary(logistic_fit))
print(exp(cbind(OR = coef(logistic_fit), confint(logistic_fit))))

# Hierarchical regression by blocks.
block_1 <- lm(outcome_continuous ~ age + sex, data = df)
block_2 <- lm(outcome_continuous ~ age + sex + main_predictor, data = df)
block_3 <- lm(
  outcome_continuous ~ age + sex + main_predictor + covariate_1,
  data = df
)
print(summary(block_1))
print(summary(block_2))
print(summary(block_3))
print(anova(block_1, block_2, block_3))

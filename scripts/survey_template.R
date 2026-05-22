# Editable complex survey analysis template.
# Install survey once if needed:
# install.packages("survey")

library(survey)

df <- read.csv("PATH/TO/analysis_data.csv", check.names = FALSE)

# Replace PSU, strata, and weight variables with source-guide fields.
survey_design <- svydesign(
  ids = ~psu_variable,
  strata = ~strata_variable,
  weights = ~weight_variable,
  data = df,
  nest = TRUE
)

# Weighted summaries.
print(svymean(~outcome_continuous, survey_design, na.rm = TRUE))
print(svytable(~group_variable + outcome_binary, survey_design))

# Survey linear regression.
survey_linear <- svyglm(
  outcome_continuous ~ main_predictor + age + sex,
  design = survey_design
)
print(summary(survey_linear))

# Survey logistic regression.
survey_logistic <- svyglm(
  outcome_binary ~ main_predictor + age + sex,
  design = survey_design,
  family = quasibinomial()
)
print(summary(survey_logistic))
print(exp(cbind(OR = coef(survey_logistic), confint(survey_logistic))))

# Editable basic-analysis template.
# Verify variable coding, missing handling, and survey design before reporting.

df <- read.csv("PATH/TO/analysis_data.csv", check.names = FALSE)

# Replace with analysis variable names after preparation.
group_binary <- factor(df$group_binary)
outcome_continuous <- df$outcome_continuous
group_three_level <- factor(df$group_three_level)
outcome_binary <- factor(df$outcome_binary)

# Chi-square test: categorical by categorical.
cross_tab <- table(group_binary, outcome_binary, useNA = "no")
print(cross_tab)
print(prop.table(cross_tab, margin = 1))
print(chisq.test(cross_tab))

# Two-group mean comparison.
tt <- t.test(outcome_continuous ~ group_binary, data = df)
print(tt)
print(aggregate(outcome_continuous ~ group_binary, data = df, summary))

# Three-or-more-group mean comparison.
anova_fit <- aov(outcome_continuous ~ group_three_level, data = df)
print(summary(anova_fit))
print(TukeyHSD(anova_fit))

#### Sleep deprivation ####
library(lme4)
library(lattice)
data(sleepstudy)

# 18 subjects chosen from population of long distance truck drivers
# During the study the subjects were restricted to 3hrs sleep per night for 10 days (indexed 0-9)
length(unique(sleepstudy$Subject))

# subject: random effect
# days: fixed effect

#### 1. Trellis plot for all subjects ####
xyplot(Reaction ~ Days|Subject, data = sleepstudy, type = c("p","r"))
# most of the subjects' reaction time appears to be modeled well with a simple linear regression 
#(within-subject variation). apart from 350, 352, and 308. 
# the intercepts and slope for each subject appear quite different from one another (between-subject variation)

#### 2. Model fitting ####
# based on the trellis plot, we will first fit a model with separate intercepts and slopes for each subject
# model with correlated random effects
m1 <- lmer(Reaction ~ Days + (Days|Subject), data = sleepstudy)
summary(m1)
# the correlation between the random effects (ie the subject-specific intercept and subject-specific slope)
# has a value of 0.07 which is low. this suggests we should try a model with uncorrelated random effects (simpler)

# model with uncorrelated random effects
m2 <- lmer(Reaction ~ Days + (1|Subject) + (0 + Days|Subject), data = sleepstudy)
summary(m2)


#### 3. ANOVA ####
# the uncorrelated model is nested within the correlated model
anova(m2, m1)
# the simpler model has a lower aic and bic => suggests it is favourable over m1
# chi2 test- H0: the simpler model is sufficient for explaining variation in the response
# the chi2 p value in the anova table is 0.8 (>0.05) => suggests we cannot reject H0; favour m2 (simple model)


#### 4. More model fitting & ANOVA ####
# Next we will look to simplify the model further by removing the random slope
m3 <- lmer(Reaction ~ Days + (1|Subject), data = sleepstudy)
summary(m3)

# m3 is nested in m2
anova(m3, m2)
# The p-value of the likelihood ratio test is significant => reject H0. The more complex model is favourable

# Therefore our final model is m2

#### 5. Model output ####
summary(m2)

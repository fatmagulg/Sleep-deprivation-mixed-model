# Sleep-deprivation-mixed-model

The data for this analysis comes from a study on sleep deprivation in long-distance truck drivers. The subjects were a sample of 18 long-distance truck drivers and these were restricted to 3 hours of sleep per night for 10 nights. The response is reaction time in milliseconds measured for each subject on each day of the study. The data is repeated measure type data and is balanced (each subject was measured the same number of times and at the same times).  
  
Part 1 of the R script is an exploratory plot of reaction time against day plotted separately for each subject. Examining this plot suggests that the mixed model should contain separate intercept and slope terms for each subject. More comments are in the R script.  
  
Part 2 are the model specifications. Models with uncorrelated and correlated random effects were consructed.  
**Model 1**: correlated random effects (complex model)  
**Model 2**: uncorrelated random effects (simpler model)  
The first model (correlated random effects) showed low correlation between the intercepts and slopes suggesting that the second model (uncorrelated random effects) could be more appropriate.  
  
Part 3 is model comparison using ANOVA.  
AIC and BIC showed that model 2 was more appropriate than model 1.   
Likelihood ratio test- H0: corr = 0; the model with uncorrelated random effects is adequate in explaining variation in the data.  
This gave a p-value of 0.8 < 0.05 based on the Chi squared reference distribution which suggests that there is enough evidence to reject H0 and therefore favour model 2.  
_We are testing H0: corr = 0. The value of 0 is not on the boundary of the parameter space for corr :. the likelihood ratio test is suitable. _  
  
Part 4 is more model fitting where we try an even simpler model without a random slope, m3. m3 and m2 are also compared using ANOVA with the result that the more complex model m2 should be favoured. 
_The parameter being tested for in the Likelihood ratio test is the variance component for the random slope.  
H0: var = 0  
The value of zero is on the boundary of the parameter space for var, therefore the p-value obtained from the Chi squared reference distribution is more conservative. In this case, because our p-value is significant this conservativeness does not take away from the conclusion that we can reject H0_   
  
**The final model** is therefore m2, the model with uncorrelated random slope and random intercept.  
Part 5 is looking at the model summary for m2.

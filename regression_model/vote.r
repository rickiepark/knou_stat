closedness = factor(rep(c('one.sided', 'close'), c(3,3)), levels = c('one.sided', 'close'))
preference = ordered(rep(c('Weak', 'Medium', 'Strong'),2), levels = c('Weak', 'Medium', 'Strong' ))
voted = c(91,121,64,214,284,201)
did.not.vote = c(39,49,24,87,76,25)
logit.turnout = log(voted/did.not.vote)
vote.data = data.frame(closedness, preference, voted, did.not.vote, logit=logit.turnout)

# plot
par(mar=c(5.1,4.1, 4.1, 4.1))
plot(rep(1:3,2), logit.turnout, type='n', axes=F, xlab='internsity of Preference', ylab='Logit(Voted/Did not Vote)')
axis(1, at=1:3, labels=c('Weak','Medium','Strong'))
axis(2)
prob.axis(side='right', at=seq(.7, .85, by=.05), axis.title='Proportion(Voted)')  # Not working in R --- Check !!!
box()
points(1:3, logit.turnout[1:3], pch=1, type='b', lty=2, lwd=3, cex=2)  #one-sided
points(1:3, logit.turnout[4:6], pch=16, type='b', lty=2, lwd=3, cex=2) #close
text(locator(2), c('Close', 'One-Sided'))

# logit model
options(contrasts=c('contr.sum', 'contr.poly'))
mod.camp = glm(cbind(voted, did.not.vote) ~ closedness*preference, family=binomial, data=vote.data)
summary(mod.camp)

# anova
library(car)
Anova(mod.camp)

# Result
> summary(mod.camp)

Call:
glm(formula = cbind(voted, did.not.vote) ~ closedness * preference, 
    family = binomial, data = vote.data)

Deviance Residuals: 
[1]  0  0  0  0  0  0

Coefficients:
                         Estimate Std. Error z value Pr(>|z|)    
(Intercept)               1.17247    0.07461  15.714  < 2e-16 ***
closedness1              -0.26177    0.07461  -3.508 0.000451 ***
preference.L              0.46595    0.13922   3.347 0.000818 ***
preference.Q              0.07516    0.11840   0.635 0.525582    
closedness1:preference.L -0.37152    0.13922  -2.669 0.007618 ** 
closedness1:preference.Q -0.06692    0.11840  -0.565 0.571963    
---
Signif. codes:  0 ¡®***¡¯ 0.001 ¡®**¡¯ 0.01 ¡®*¡¯ 0.05 ¡®.¡¯ 0.1 ¡® ¡¯ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 3.4832e+01  on 5  degrees of freedom
Residual deviance: 8.4377e-14  on 0  degrees of freedom
AIC: 44.093

Number of Fisher Scoring iterations: 3

> local({pkg <- select.list(sort(.packages(all.available = TRUE)),graphics=TRUE)
+ if(nchar(pkg)) library(pkg, character.only=TRUE)})
> library(car)
> Anova(mod.camp)
Analysis of Deviance Table (Type II tests)

Response: cbind(voted, did.not.vote)
                      LR Chisq Df Pr(>Chisq)    
closedness              8.2853  1   0.003997 ** 
preference             19.1053  2  7.101e-05 ***
closedness:preference   7.1186  2   0.028458 *  
---
Signif. codes:  0 ¡®***¡¯ 0.001 ¡®**¡¯ 0.01 ¡®*¡¯ 0.05 ¡®.¡¯ 0.1 ¡® ¡¯ 1
> 

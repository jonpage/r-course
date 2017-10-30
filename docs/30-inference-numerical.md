
# Inference for Numerical Data {-#inference-numerical}

> The source for this topic is the Open Intro labs https://www.openintro.org/stat/labs.php

## North Carolina births {-}

In 2004, the state of North Carolina released a large data set containing 
information on births recorded in this state. This data set is useful to 
researchers studying the relation between habits and practices of expectant 
mothers and the birth of their children. We will work with a random sample of 
observations from this data set.

## Exploratory analysis {-}

Load the `nc` data set into our workspace.


```r
load("data/nc.RData")
```

We have observations on 13 different variables, some categorical and some 
numerical. The meaning of each variable is as follows.

variable         | description
---------------- | -----------
`fage`           | father's age in years.
`mage`           | mother's age in years.
`mature`         | maturity status of mother.
`weeks`          | length of pregnancy in weeks.
`premie`         | whether the birth was classified as premature (premie) or full-term.
`visits`         | number of hospital visits during pregnancy.
`marital`        | whether mother is `married` or `not married` at birth.
`gained`         | weight gained by mother during pregnancy in pounds.
`weight`         | weight of the baby at birth in pounds.
`lowbirthweight` | whether baby was classified as low birthweight (`low`) or not (`not low`).
`gender`         | gender of the baby, `female` or `male`.
`habit`          | status of the mother as a `nonsmoker` or a `smoker`.
`whitemom`       | whether mom is `white` or `not white`.

1.  What are the cases in this data set? How many cases are there in our sample?

As a first step in the analysis, we should consider summaries of the data. This
can be done using the `summary` command:


```r
summary(nc)
```

As you review the variable summaries, consider which variables are categorical 
and which are numerical. For numerical variables, are there outliers? If you 
aren't sure or want to take a closer look at the data, make a graph.

Consider the possible relationship between a mother's smoking habit and the 
weight of her baby. Plotting the data is a useful first step because it helps 
us quickly visualize trends, identify strong associations, and develop research
questions.

2.  Make a side-by-side boxplot of `habit` and `weight`. What does the plot 
highlight about the relationship between these two variables?


```r
library(tidyverse)
ggplot(nc, aes(habit, weight)) + geom_boxplot()
```

The box plots show how the medians of the two distributions compare, but we can
also compare the means of the distributions using the following function to 
split the `weight` variable into the `habit` groups, then take the mean of each
using the `mean` function.


```r
by(nc$weight, nc$habit, mean)
```

We can do the same thing with `group_by` and `summarize` (or `summarise`).


```r
habits <- nc %>%
  group_by(habit) %>%
  summarize(mean_weight = mean(weight), n = n(), sd_weight = sd(weight))
habits
```

For more examples see `?dplyr::summarise`.


There is an observed difference, but is this difference statistically 
significant? In order to answer this question we will conduct a hypothesis test.

## Inference {-}

3.  Check if the conditions necessary for inference are satisfied. Note that 
you will need to obtain sample sizes to check the conditions. You can compute 
the group size using the same `by` command above but replacing `mean` with 
`length`.

4.  Write the hypotheses for testing if the average weights of babies born to 
smoking and non-smoking mothers are different.

\[H_0: \mu_{nonsmoker} = \mu_{smoker}  \]

\[H_A: \mu_{nonsmoker} \neq \mu_{smoker} \]

Test statistic:

\[ z = \frac{\bar{x_1} - \bar{x_2}}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}}  \]


```r
std_err <- sqrt(
    habits[1,]$sd_weight^2 / habits[1,]$n + 
    habits[2,]$sd_weight^2 / habits[2,]$n
  )
std_err
difference <- habits[1,]$mean_weight - habits[2,]$mean_weight
difference
z <- difference / std_err
z
```

Two-tailed test: Here the `p_value` is the probability of drawing a difference as large as the one we had.

```r
p_value <- 2 * (1 - pnorm(z))
p_value
```


5.  Now let's construct a confidence 
interval for the difference between the weights of babies born to smoking and 
non-smoking mothers.


```r
a <- 0.05
difference + (qnorm(a/2) * std_err)
difference + (qnorm(1 - a/2) * std_err)
```

## `stats` package {-}

The `stats` library is loaded by default in R and includes functions for performing the above
calculations.


```r
t.test(nc[nc$habit == "smoker",]$weight, nc[nc$habit == "nonsmoker",]$weight)
```


* * *

## On your own {-}

-   Calculate a 95% confidence interval for the average length of pregnancies 
(`weeks`) and interpret it in context. Note that since you're doing inference 
on a single population parameter, there is no explanatory variable, so you can 
omit the `x` variable from the function.

-   Calculate a new confidence interval for the same parameter at the 90% 
confidence level. You can change the confidence level by adding a new argument 
to the function: `conflevel = 0.90`.

-   Conduct a hypothesis test evaluating whether the average weight gained by 
younger mothers is different than the average weight gained by mature mothers.

-   Now, a non-inference task: Determine the age cutoff for younger and mature 
mothers. Use a method of your choice, and explain how your method works.

-   Pick a pair of numerical and categorical variables and come up with a 
research question evaluating the relationship between these variables. 
Formulate the question in a way that it can be answered using a hypothesis test
and/or a confidence interval. Answer your question using the `inference` 
function, report the statistical results, and also provide an explanation in 
plain language.

<div id="license">
This is a product of OpenIntro that is released under a [Creative Commons 
Attribution-ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-sa/3.0).
This lab was adapted for OpenIntro by Mine &Ccedil;etinkaya-Rundel from a lab 
written by the faculty and TAs of UCLA Statistics.
</div>

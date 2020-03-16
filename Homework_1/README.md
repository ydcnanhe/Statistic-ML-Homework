## This is the linear regression code using R for reproducing the analysis of prostate cancer data. 
## REFERENCE
### [1] http://homepages.math.uic.edu/~jyang06/stat494/R/3_2_1.r
### [2] https://rdrr.io/cran/ElemStatLearn/man/prostate.html
## Codes
### you can check the codes in the file _linear_regression.R_ or _LinearRegression_codes_
## Outputs

1. Correlation analysis between predictors

* Predictors Correlation 

![Predictors Correlation](https://github.com/ydcnanhe/Statistic-ML-Homework/blob/master/Homework_1/Correlation.png?raw=true)

* Table of correlation

| name | lcavol | lweight | age | lbph | svi | lcp | gleason | pgg45 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **lcavol**  |  1.000 | 0.300 | 0.286 | 0.063  | 0.593 |  0.692 | 0.426 | 0.483 |
| **lweight** | 0.300  | 1.000 | 0.317 | 0.437  | 0.181 | 0.157 | 0.024 | 0.074 |
| **age**     | 0.286  | 0.317 | 1.000 | 0.287  | 0.129 | 0.173 | 0.366 | 0.276 |
| **lbph**    | 0.063  | 0.437 | 0.287 | 1.000 | -0.139 | -0.089 | 0.033 | -0.030 |
| **svi**     | 0.593  | 0.181 | 0.129 | -0.139 | 1.000 | 0.671 | 0.307 | 0.481 |
| **lcp**     | 0.692  | 0.157 | 0.173 | -0.089 | 0.671 | 1.000 | 0.476 | 0.663 |
| **gleason** | 0.426  | 0.024 | 0.366 | 0.033 | 0.307 | 0.476 | 1.000 | 0.757 |
| **pgg45**   | 0.483  | 0.074 | 0.276 | -0.030 | 0.481 | 0.663 | 0.757 | 1.000 |

2. Subset Selection

* Best rss in subset selection model

|# of predictors|1|2|3|4|5|6|7|8|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RSS | 44.52858 | 37.09185 | 34.90775 | 32.81499 | 32.06945 | 30.53978 | 29.43730 | 29.42638 | 

* Histogram of Subsection Model Size

![Histogram of Subsection Model Size](https://github.com/ydcnanhe/Statistic-ML-Homework/blob/master/Homework_1/HistLeapsModelSize.png?raw=true)

* Subset RSS

![Subset RSS](https://github.com/ydcnanhe/Statistic-ML-Homework/blob/master/Homework_1/subsetRSS.png?raw=true)

3. Ridge

![Ridge](https://github.com/ydcnanhe/Statistic-ML-Homework/blob/master/Homework_1/Ridge.png?raw=true)

4. Lasso

![Lasso](https://github.com/ydcnanhe/Statistic-ML-Homework/blob/master/Homework_1/Lasso.png?raw=true)

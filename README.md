# Analysis-on-Defect-Data-with-Topic-Metrics-Prediction-Methods
Data Analyses on Defect Data and Experiments with Defect Prediction Methods using Topic Metrics

In spite of diligent planning, good documentation and proper process control during software development, appear- ance of defects are inevitable. 
These software defects may lead to degradation of the quality and even sometimes extremely serious problems. it is important to make conscious efforts to control and minimize these defects by using techniques to allow in-process quality monitoring and control. 
In this paper, I compared Weibull, Rayleigh and Gamma models to check the goodness of the fit for the defect curses in the taken datasets and prediction accuracy with defect curves of prior release and using defect curves of other projects. 

In spite of diligent planning, good documentation and proper process control during software development, appear- ance of defects are inevitable. 
These software defects may lead to degradation of the quality and even sometimes extremely serious problems. 
It is important to make conscious efforts to control and minimize these defects by using techniques to allow in-process quality monitoring and control. 
In this paper, I compared Weibull, Rayleigh and Gamma models to check the goodness of the fit for the defect curses in the taken datasets and prediction accuracy with defect curves of prior release and using defect curves of other projects.

  1. Data  - (Can share them on request)
The datasets for this project contains files,4 Each file contains the following metrics:

LOC: number of lines of code (measuring the code complexity)

BF: number of prior bug fixes (measuring the defect history)

HCM: the entropy of code changes (measuring the complexity of code changes)

V1-VK: the log transformation of the number of words assigned for each topic (from 1 to K). For example, topic5log.csv will have 5 metrics V1-V5, each for a topic.

In the file, BUG is the actual number of post-release bugs, which should be predicted and not used as predictor.

  2. Method

To analyze or predict with K topics, used the dataset with that number. For example, To analyze/predict with 20 topic metrics (V1-V20), loaded and analyzed the dataset in topic20log.csv

Used a prediction model involving topic metrics, used PCA (Principal Component Analysis). For example, used 20 topic metrics (V1-V20) in addition to 3 base metrics (LOC, BF, HCM), loaded the dataset in topic20log.csv, perform PCA, and choose the first P components as predictor in your model. 
Since we originally have 23 metrics, P can be from 1 to 23.

The explanatory power of a prediction model is measured with AIC score (the lower the better). The predictive power of a prediction model is measured with Spearman correlation (the higher the better) via the same cross-valiation process as in Project 1.

  3. Research questions

Performed data analysis and machine learning to answer the following research questions for each dataset.

a. What is the correlation of topic metrics to BUG? You should answer this question by plotting as boxplots the correlation of BUG and topic metrics for the number of topics of 10, 20, 50, and 100.

b. Do topic metrics provide better and additional explanatory power and predictive power to base metrics? You could answer this question by plotting:

- Explanatory power and predictive power of 3 base metrics as baseline.

- Explanatory power and predictive power when only topic metrics are used. You will plot for K = 5, 10, ... 100 topics. For each K, you vary P (number of selected pricipal components) and choose what provides the best explanatory/predictive power.

- Explanatory power and predictive power when both topic metrics and base metrics are used. You will also plot for K = 5, 10, ... 100 topics, each with the best P.

After plotting, you summarize the results in tables, which list the explanatory and predictive power for the best K and P, in addition to those for base metrics.

As explanatory power and predictive power are not comparable, you should plot them in separate figures and tables.

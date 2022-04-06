# Extreme-Gradient-Boosting
XGBoost Extreme Gradient Boosting is a supervised predictive algorithm that uses the boosting principle.
The idea behind boosting is to generate multiple "weak" prediction models sequentially, and each of these takes the results of the previous model, to generate a "stronger" model, with better predictive power and greater stability in its results.
To get a stronger model, an optimization algorithm is used, in this case Gradient Descent.
During training, the parameters of each weak model are fit iteratively trying to find the minimum of an objective function, which can be the proportion of error in the classification, the area under the curve (AUC), the root mean square error ( RMSE) or some other.

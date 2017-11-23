import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Importing the dataset
dataset = pd.read_csv('chords.csv')
X = dataset.iloc[:, 0:10].values
y = dataset.iloc[:, 10].values

# Taking care of missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 0:10])
X[:, 0:10] = imputer.transform(X[:, 0:10])

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)


# Fitting the Decision Tree to the dataset
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state=2)
regressor.fit(X,y)

y_pred = regressor.predict(X_test)

np.mean(y_pred == y_test)
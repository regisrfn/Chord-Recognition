import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Importing the dataset
dataset = pd.read_csv('dataset.csv')
test = pd.read_csv('test.csv')
X = dataset.iloc[:, 0:12].values
y = dataset.iloc[:, 12].values

X_test = test.iloc[:, 0:12].values
y_test = test.iloc[:, 12].values


## Taking care of missing data
#from sklearn.preprocessing import Imputer
#imputer = Imputer(missing_values = 'NaN', strategy = 'median', axis = 0)
#imputer = imputer.fit(X[:, 0:10])
#X[:, 0:10] = imputer.transform(X[:, 0:10])
#X_test[:, 0:10] = imputer.transform(X_test[:, 0:10])

from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 10, random_state = 0)
regressor.fit(X, y)

y_pred = regressor.predict(X_test)
y_pred = np.round(y_pred)
print(np.mean(y_pred == y_test))

from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test,y_pred)
print(cm)
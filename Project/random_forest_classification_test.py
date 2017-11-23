#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct  6 11:48:14 2017

@author: regis
"""

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset

dataset = pd.read_csv('dataset.csv')
test = pd.read_csv('test.csv')
X = dataset.iloc[:, 0:12].values
y = dataset.iloc[:, 12].values

X_test = test.iloc[:, 0:12].values
y_test = test.iloc[:, 12].values

# #Feature Scaling
#from sklearn.preprocessing import StandardScaler
#sc = StandardScaler()
#X = sc.fit_transform(X)
#X_test = sc.transform(X_test)


from sklearn.ensemble import RandomForestClassifier
classifier = RandomForestClassifier(n_estimators = 100, criterion = 'entropy', random_state = 0)
classifier.fit(X, y)


# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
label= np.arange(1,14);
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred, labels = label)


print(np.mean(y_pred == y_test))
print(cm)
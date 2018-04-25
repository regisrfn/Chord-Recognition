# K-Nearest Neighbors (K-NN)

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
# Importing the dataset
dataset = pd.read_csv('dataset.csv')
X = dataset.iloc[:, 0:12].values
y = dataset.iloc[:, 12].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# Importing the Keras libraries and packages
import keras
from keras.models import Sequential
from keras.layers import Dense

# Initialising the ANN
classifier = Sequential()

# Adding the input layer and the first hidden layer
classifier.add(Dense(64,  kernel_initializer= 'uniform', activation = 'relu', input_dim = 12))

# Adding the second hidden layer
classifier.add(Dense(16,  kernel_initializer= 'uniform', activation = 'relu'))


# Adding the output layer
classifier.add(Dense(5,  kernel_initializer= 'uniform', activation = 'softmax'))

# Compiling the ANN
classifier.compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy', metrics = ['accuracy'])

# Fitting the ANN to the Training set
classifier.fit(X_train, y_train, batch_size = 128, epochs = 100)

# Predicting the Test set results
y_pred = classifier.predict(X_test)
y_pred = y_pred.argmax(axis=1)

# Making the Confusion Matrix
label= np.arange(0,13)
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred, labels = label)

print(np.mean(y_pred == y_test))
print(cm)

from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import OneHotEncoder

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

# # Feature Scaling
# from sklearn.preprocessing import StandardScaler
# sc = StandardScaler()
# X_train = sc.fit_transform(X_train)
# X_test = sc.transform(X_test)

# integer encode
label_encoder = LabelEncoder()
integer_encoded = label_encoder.fit_transform(y_train)
#print(integer_encoded)
# binary encode
onehot_encoder = OneHotEncoder(sparse=False)
integer_encoded = integer_encoded.reshape(len(integer_encoded), 1)
onehot_encoded = onehot_encoder.fit_transform(integer_encoded)
#print(onehot_encoded)



# Importing the Keras libraries and packages
import keras
from keras.models import Sequential
from keras.layers import Dense

# Initialising the ANN
classifier = Sequential()

# Adding the input layer and the first hidden layer
classifier.add(Dense(128,  kernel_initializer= 'uniform', activation = 'relu', input_dim = 12))

# Adding the second hidden layer
classifier.add(Dense(64,  kernel_initializer= 'uniform', activation = 'relu'))

# Adding the output layer
classifier.add(Dense(5,  kernel_initializer= 'uniform', activation = 'softmax'))

# Compiling the ANN
classifier.compile(optimizer = 'adam', loss = 'categorical_crossentropy', metrics = ['accuracy'])

# Fitting the ANN to the Training set
classifier.fit(X_train, onehot_encoded, batch_size = 128, epochs = 100,verbose=0)

# serialize model to JSON
model_json = classifier.to_json()
with open("model-ann.json", "w") as json_file:
    json_file.write(model_json)
# serialize weights to HDF5
classifier.save_weights("model-ann.h5")
print("Saved model to disk")


# Predicting the Test set results
y_pred = classifier.predict(X_test)
y_pred = y_pred.argmax(axis=1)

# Making the Confusion Matrix
label= np.arange(0,13)
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred, labels = label)

print(np.mean(y_pred == y_test))
print(cm)

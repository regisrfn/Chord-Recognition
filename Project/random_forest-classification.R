# Random Forest Classification

# Importing the dataset
dataset = read.csv('dataset.csv')
#dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Acorde = factor(dataset$Acorde, levels = c(1, 2, 3, 5, 9))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Acorde, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
#training_set[-13] = scale(training_set[-13])
#test_set[-13] = scale(test_set[-13])

training_set[-13] = training_set[-13]
test_set[-13] = test_set[-13]


# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-13],
                          y = training_set$Acorde,
                          ntree = 5)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-13])
#y_pred = round(y_pred)

# Making the Confusion Matrix
cm = table(test_set[, 13], y_pred)


# Plotting the tree
plot(classifier)
text(classifier)
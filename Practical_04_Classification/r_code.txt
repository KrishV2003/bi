install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")

# Step 1: Load Libraries
library(rpart)
library(rpart.plot)
library(caret)

# Step 2: Load Dataset
data(iris)

# Step 3: Preprocess Data (Feature Scaling)
iris_scaled <- as.data.frame(scale(iris[,1:4]))
iris_scaled$Species <- iris$Species

# Step 4: Split Dataset
set.seed(42)
trainIndex <- createDataPartition(iris_scaled$Species, p = 0.8, list = FALSE)

trainData <- iris_scaled[trainIndex, ]
testData  <- iris_scaled[-trainIndex, ]

# Step 5: Train Decision Tree
model <- rpart(Species ~ ., data = trainData, method = "class")

# Step 6: Predict
predictions <- predict(model, testData, type = "class")

# Step 7: Evaluate
conf_matrix <- confusionMatrix(predictions, testData$Species)
print(conf_matrix)

# Step 8: Plot Tree
rpart.plot(model)
# Step 1: Load Dataset
data(iris)

# Step 2: Remove Target/Label Column
iris_data <- iris[, 1:4]

# Step 3: Preprocess Data (Feature Scaling / Standardization)
iris_scaled <- scale(iris_data)

# Step 4: Apply K-Means Clustering
set.seed(42)
kmeans_result <- kmeans(iris_scaled, centers = 3)

# Step 5: Print Cluster Information
print(kmeans_result)

# Step 6: Plot Clusters (Using First Two Scaled Features)
plot(
  iris_scaled[,1],
  iris_scaled[,2],
  col = kmeans_result$cluster,
  pch = 19,
  xlab = "Scaled Sepal Length",
  ylab = "Scaled Sepal Width",
  main = "K-Means Clustering with Preprocessed Data"
)

# Step 7: Plot Centroids
points(
  kmeans_result$centers[,1],
  kmeans_result$centers[,2],
  col = 1:3,
  pch = 8,
  cex = 2
)
# Understand your biostatistic data with XGBoost

require(xgboost)
require(Matrix)
require(data.table)

# Looking at the raw data

data("veteran")
head(veteran)
describe(veteran)
df <- data.table(veteran, keep.rownames = FALSE)
sparse_matrix <- sparse.model.matrix(status~.-1, data = df)
head(sparse_matrix)
output_vector = df[,status] 

# Build the model

bst <- xgboost(data = sparse_matrix, label = output_vector, max.depth = 4, eta = 1, nthread = 2, nrounds = 10,objective = "binary:logistic")

# Measure feature importance

importance <- xgb.importance(feature_names = sparse_matrix@Dimnames[[2]], model = bst)
head(importance)

# Improvement in the interpretability of feature importance data.table

importanceRaw <- xgb.importance(feature_names = sparse_matrix@Dimnames[[2]], model = bst, data = sparse_matrix, label = output_vector)
importanceClean <- importanceRaw[,`:=`(Cover=NULL, Frequency=NULL)]
head(importanceClean)

xgb.plot.importance(importance_matrix = importanceRaw)

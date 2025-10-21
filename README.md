# middleby-DE-test
Coding test for Middleby. Creating a supervised learning system for item-item collaborative filtering to predict grocery purchases.

# Problem Statement
## Based on a user's past purchases, can we predict what they will purchase in the future (and how much of it they will purchase)?
This is a classic problem in sales. In the case of grocery stores in particular, having an accurate answer to this problem allows for better inventory management, better sale management (if we know a person will buy a product, we can put a corresponding product on sale to encourage further sales), and better recommendations to customers of what they may want to buy.

# Data Pre-processing
Before working with the data I took the following steps:
1. Looked at shape and details of data (columns, relationships between tables, etc.
2. Encoded categorical variables
3. Dropped NaN values

# Feature Selection
Because I opted to create a collaborative filtering system, the most important features were:
1. Item codes to identify various items
2. Weeks to split train and test data
3. Units to see how many of a given item was purchased
4. Customer ID to predict purchases on a per-customer basis

# Modeling Approach
In general, item-item collaborative filtering models require a few key components.
1. A sparse matrix of all items purchased by a given customer. In this case I was able to pivot the existing data to generate a matrix where rows were customer IDs and columns were item IDs. The values were the total number of that item the customer had bought.
2. A sparse matrix of all customers that had bought a given item. Similar to the above, this matrix allows us to see which customers have bought a given item. In this case, rows are item IDs and columns are customer IDs with values being a binary whether the customer had bought the item.
3. An item similarity matrix. I opted to use cosine similarity to determine how commonly items were bought together. This helped with theoretical cold start scenarios.

Using these components I was able to build a prediction system using collaborative filtering. Based on the purchases of each item from all users, the number of items a user might buy can be calculated, weighed against the purchases of all users.

# Evaluation
I opted to evaluate the predictions using root mean squared error (RMSE) because it gave a solid idea of what overall error across all items looked like. Due to compute constraints I opted not to evaluate the RMSE of all user and item combinations, instead focusing on a small subset of 100 users from the test set. This yielded an RMSE of **0.12374108790667744**, implying strong accuracy from the system. I suspect that part of this relatively high level of accuracy is due to the fact that an average user does not purchase most items, meaning that the system has a higher chance of just randomly being correct if it guesses 0. However, in my small subset, I did find that purchased item quantities were often correctly predicted.

# Insights
Using the collaborative filtering model it is clear that it is possible to predict the number of a given item a user will purchase. Because collaborative filtering can also be used to find similar items, this means that it's possible to extend the system and recommend specific items to the user based on what is currently in their cart. This allows for more effective ad targeting, more effective decisions surrounding what should go on sale, and better inventory management. Effective ad targeting and deciding what goes on sale increase revenue, while improved inventory management can lead to less unnecessary spending.


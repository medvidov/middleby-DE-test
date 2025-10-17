# middleby-DE-test
Coding test for Middleby. Supervised learning for product segments and reinforcement learning for pathfinding.

# Problem Statement
## What items are frequently bought together?
- In the event that only one item is on sale, does that impact purchases of the other item?
- **Recommender system using collaborative filtering (top 3 most commonly bought items) for a given item**
    - Also using XGBoost to be able to implement a hybrid system
- Are different types of items bought together frequently?
- Are different brands of items bought together frequently?
- Stratify on zip code?

To check the error in the recommender system, I will use RMSE against a small (20%) test set. The goal is that for a given customer, I want to see how many of each item they will buy given the quantity of one item.



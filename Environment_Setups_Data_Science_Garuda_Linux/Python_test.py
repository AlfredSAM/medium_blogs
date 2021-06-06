import timeit

import numpy as np
import xgboost as xgb
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_theme(style="whitegrid")

# Test multi threads for xgboost
#
data = np.random.rand(10000, 100)
label = np.random.randint(2, size=10000)
dtrain = xgb.DMatrix(data, label=label)

param_1 = {"objective": "binary:logistic", "nthread": 1, "eval_metric": "auc"}

param_4 = {"objective": "binary:logistic", "nthread": 4, "eval_metric": "auc"}

param_8 = {"objective": "binary:logistic", "nthread": 8, "eval_metric": "auc"}

num_round = 100


start = timeit.default_timer()

xgb.train(param_1, dtrain, num_round)

stop = timeit.default_timer()

print("Time: ", stop - start)

start = timeit.default_timer()

xgb.train(param_4, dtrain, num_round)

stop = timeit.default_timer()

print("Time: ", stop - start)

start = timeit.default_timer()

xgb.train(param_8, dtrain, num_round)

stop = timeit.default_timer()

print("Time: ", stop - start)


# Test seaborn plots

# Load the example diamonds dataset
diamonds = sns.load_dataset("diamonds")

# Draw a scatter plot while assigning point colors and sizes to different
# variables in the dataset
f, ax = plt.subplots(figsize=(6.5, 6.5))
sns.despine(f, left=True, bottom=True)
clarity_ranking = ["I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"]
sns.scatterplot(
    x="carat",
    y="price",
    hue="clarity",
    size="depth",
    palette="ch:r=-.2,d=.3_r",
    hue_order=clarity_ranking,
    sizes=(1, 8),
    linewidth=0,
    data=diamonds,
    ax=ax,
)

plt.show()

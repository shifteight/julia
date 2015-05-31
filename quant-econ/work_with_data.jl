using DataFrames

commodities = ["crude", "gas", "gold", "silver"]
last = @data([4.2, 11.3, 12.1, NA])
df = DataFrame(commod = commodities, price=last)
df[:price]
df[:commod]

describe(df)

# Accessing classic data sets
using RDatasets
iris = dataset("datasets", "iris")
head(iris)
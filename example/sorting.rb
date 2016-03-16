puts Algs4ruby::Sorting::DEFAULT_STRATEGY # => :quick
puts Algs4ruby::Sorting::STRATEGIES       # => All supported strategies

data = [9, 5, 2, 7, 0, 1, 3, 4, 8, 6]

# Default strategy
array = data.clone
sorting = Algs4ruby::Sorting.new

sorting.sort(array)   # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p array               # => [9, 5, 2, 7, 0, 1, 3, 4, 8, 6]
sorting.sort!(array)  # => nil
p array               # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Manually set strategy
array = data.clone
sorting = Algs4ruby::Sorting.new(:insertion)

sorting.sort(array)   # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p array               # => [9, 5, 2, 7, 0, 1, 3, 4, 8, 6]
sorting.sort!(array)  # => nil
p array               # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Shuffling
array = data.clone
sorting = Algs4ruby::Sorting::Shuffling.new

p sorting.sort(array.sort) # => in shuffling order

# Quick Select
array = data.clone
sorting = Algs4ruby::Sorting::Quick.new

sorting.select(array, 3) # => 2
sorting.select(array, 7) # => 8

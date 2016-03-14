set = Algs4ruby::UnionFind.new(5) # Default strategy is :weighted_quick_union_with_path_compression

set.union(0,1)
set.union(2,3)
set.union(2,4)

set.connected?(0,2) # => false
set.connected?(1,2) # => false
set.connected?(3,4) # => true

set = Algs4ruby::UnionFind.new(5, strategy: :quick_find)

set.union(0,1)
set.union(2,3)
set.union(2,4)

set.connected?(0,2) # => false
set.connected?(1,2) # => false
set.connected?(3,4) # => true


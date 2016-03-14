# Union Find

> [Algorithms - 1.5 Case Study: Union-Find](http://algs4.cs.princeton.edu/15uf/)

## Description

Given a set of N objects.

+ Union command: connect two objects.
+ Find/connected query: is there a path connecting the two objects?

## Usage

[/example/union_find.rb](/example/union_find.rb)

## Implementation

#### API

```ruby
class UnionFind
  class Base
    def initialize(n)     # n objects (0 to n-1)`
    end

    def union(p, q)       # connect p and q
    end

    def connected?(p, q)  # are p and q in the same component?
    end
  end
end
```

#### Strategy

+ Quick Find
+ Quick Union
+ Weighted QU
+ QU + Path Compression
+ Weighted QU + Path Compression


## Analysis

algorithm | worst-case time
--------- | --------------
quick-find | MN
quick-union | MN
weighted QU | N + M log N
QU + path compression | N + M log N
weighted QU + path compression | N + M lg* N

## Into The Wild

+ Percolation
+ Dynamic connectivity
+ Least common ancestor (LCA)


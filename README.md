# Algs4ruby

Algorithms implemented by Ruby, while reading [Algorithms 4th Edition](http://algs4.cs.princeton.edu/home/) and [Algorithms on Coursera](https://class.coursera.org/algs4partI-010/)

## Installation

```sh
gem install 'algs4ruby'
```

## Usage

Check algorithms which current support

```ruby
require 'algs4ruby'

Algs4ruby::Support #=> [:UnionFind, :Sorting, :Searching, :Stack, :Queue]
```

## Specification

+ UnionFind ([README](/lib/algs4ruby/union_find/README.md), [Example](/example/union_find.rb))
+ Sorting ([README](/lib/algs4ruby/sorting/README.md), [Example](/example/sorting.rb))
+ Searching ([README](/lib/algs4ruby/searching/README.md), [Example](/example/searching.rb))
+ Stack and Queue ([README](/lib/algs4ruby/stack_and_queue/README.md), [Example](/example/stack_and_queue.rb))

## Changelog

*v0.1.0*

+ Add UnionFind

*v0.2.0*

+ Add Sorting
  - Insertion
  - Selection
  - Shell
  - Shuffling
  - Merge
  - Quick
  - PriorityQueue
  - Heap

*v0.3.0*

+ Add Searching
  - BinarySearchTree
  - RedBlackBST
  - IntervalSearchTree

*v0.4.0*

+ Stack
+ Queue

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


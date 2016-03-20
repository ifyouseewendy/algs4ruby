# Searching

> [Algorithms - 3 Searching](http://algs4.cs.princeton.edu/30searching/)

## Symbol Table

> [Algorithms - 3.1 Elementary Symbol Tables](http://algs4.cs.princeton.edu/31elementary)

Associative array abstraction. Associate one value with each key.

**Conventions**

+ Values are not null.
+ Method get() returns null if key not present.
+ Method put() overwrites old value with new value.

**API**

+ `void put(Key key, Value val)` put key-value pair into the table (remove key from table if value is null)
+ `Value get(Key key)` value paired with key (null if key is absent)
+ `void delete(Key key)`
+ `boolean contains(Key key)`
+ `boolean isEmpty()`
+ `int size()`
+ `Iterable<Key> keys()`

**Implementation**

+ Sequential search in a linked list
+ Binary search in an ordered array
+ Binary search tree

![symbol_table_binary_search.png](image/symbol_table_binary_search.png)


**Ordered symbol table API**

Besides basic APIs, there are:

+ `Key min()`
+ `Key max()`
+ `Key floor(Key key)` largest key less than or equal to key
+ `Key ceiling(Key key)` smallest key greater than or equal to key
+ `int rank(Key key)` number of keys less than key
+ `Key select(int k)` key of rank k
+ `void deleteMin()`
+ `void deleteMax()`

![symbol_table_ordered_example.png](image/symbol_table_ordered_example.png)

**Summary**

![symbol_table_summary.png](image/symbol_table_summary.png)

## Binary Search Tree

> An implementation for Symbol Table

**Definition**

+ Binary Tree - Empty or with disjoint left and right binary trees
+ Binary Search Tree - A binary tree in symmetric order (each node has a key, which is larger than all keys in its left subtree, smaller than all keys in its right subtree)
+ Binary Heap - Completed binary tree in symmetric order (each node has a key, which is larger than all keys in its left and right subtree)

**API**

+ `void put(Key key, Value val)`
+ `Value get(Key key)`
+ `boolean contains(Key key)`
+ `int size()`
+ `boolean isEmpty()`
+ `Key min()`
+ `Key max()`
+ `Key floor(Key key)` largest key less than or equal to key
+ `Key ceiling(Key key)` smallest key greater than or equal to key
+ `int rank(Key key)` number of keys less than key
+ `Key select(int k)` key of rank k
+ `void delete(Key key)`
+ `void deleteMin()`
+ `void deleteMax()`
+ `Iterable<Key> iterator()`



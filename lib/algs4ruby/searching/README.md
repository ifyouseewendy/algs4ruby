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

There are some Balanced Search Trees help to improve performace.

+ 2-3 Search Tree
+ Red-black BST
+ B-Tree

## 2-3 Search Tree

Allow 1 or 2 keys per node.

+ 2-node: one key, two children
+ 3-node: two keys, three children

![2-3_tree.png](image/2-3_tree.png)

**Invariants**

Maintains symmetric order and perfect balance.

+ Symmetric order. Inorder traversal yields keys in ascending order.
+ Perfect balance. Every path from root to null link has same length.

**Insertion**

+ Travere finding the right place.
+ Insertion into a 2-node, make it a 3-node.
+ Insertion into a 3-node at bottom.
  - Add new key to 3-node to create temporary 4-node.
  - Move middle key in 4-node into parent.
  - Repeat up the tree, as necessary.
  - If you reach the root and it's a 4-node, split it into three 2-nodes.

![2-3_tree_insertion.png](image/2-3_tree_insertion.png)

**Performance**

![2-3_tree_performance.png](image/2-3_tree_performance.png)

## Left-Leaning Red-Black BST

> Guibas-Sedgewick 1979 and Sedgewick 2007

+ Represent 2–3 tree as a BST.
+ Use "internal" left-leaning links as "glue" for 3–nodes.

**Invariants**

+ No node has two red links connected to it.
+ Every path from root to null link has the same number of black links. (perfect black balance)
+ Red links lean left.

**1–1 correspondence between 2–3 and LL**

![llrb.png](image/llrb.png)

**Elementary Operations**

+ `rotate_left(node)`
+ `rotate_right(node)`
+ `flip_colors(node)`

**Insertion**

Several insertion situations, like insert into a 2-node, 3-node. Below is a really complicated one.

![llrb_insertion.png](image/llrb_insertion.png)

**What's most amazing?!**

We can have the same code for all cases.

![llrb_implementation.png](image/llrb_implementation.png)

**Performance**

![llrb_performance.png](image/llrb_performance.png)

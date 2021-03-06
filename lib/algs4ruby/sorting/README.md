  * [Sorting](#sorting)
    * [Elementary Sorts](#elementary-sorts)
        * [Selection Sort](#selection-sort)
        * [Insertion Sort](#insertion-sort)
        * [Shell Sort](#shell-sort)
        * [Knuth Shuffle](#knuth-shuffle)
    * [Mergesort](#mergesort)
    * [Quicksort](#quicksort)
    * [Counting Sort](#counting-sort)
    * [Priority Queues](#priority-queues)
    * [Application](#application)
        * [System sorts](#system-sorts)
        * [Convex Hull](#convex-hull)
        * [Quick Sort Easy Partition](#quick-sort-easy-partition)

# Sorting

> [Algorithms - 2 Sorting](http://algs4.cs.princeton.edu/20sorting/)

name        | inplace?  | stable? | worst   | average | best    | remarks
-------     | --------  | ------- | -----   | ------- | ----    | -------
selection   | ✔         |         | N^2/2   | N^2/2   | N^2/2   | N exchanges
insertion   | ✔         | ✔       | N^2/2   | N^2/4   | N       | use for small N or partially ordered
shell       | ✔         |         | ?       | ?       | N       | tight code, subquadratic
quick       | ✔         |         | N^2/2   | 2NlnN   | NlgN    | NlgN probabilistic guarantee, fastest in practice
3-way quick | ✔         |         | N^2/2   | 2NlnN   | N       | improves quicksort in presence of duplicate keys
merge       |           | ✔       | NlgN    | NlgN    | NlgN    | NlgN guarantee, stable
heap        | ✔         |         | 2NlgN   | 2NlgN   | NlgN    | NlgN guarantee, in-place
???         | ✔         | ✔       | NlgN    | NlgN    | N       | holy sorting grail

## Elementary Sorts

> [Algorithms - 2.1 Elementary Sorts](http://algs4.cs.princeton.edu/21elementary/)

**Rules of the game**

+ Basic API:
  - `less(v, w)`
  - `swap(ar, i, j)`

+ Sorting cost model: compares and exchanges.
+ Extra memory: in-place and extra-place

#### Selection Sort

Algorithm: Scans from left to right

Invariants:

+ Entries the left of i (include i) fixed and in ascending order.
+ No entry to right of i is smaller than any entry to the left of i.

![selection_sort](image/selection_sort.png)

#### Insertion Sort

Algorithm: Scans from left to right

Invariants:

+ Entries to the left of i (include i) fixed and in ascending order.
+ Entries to the right of i have not yet been seen.

![insertion_sort](image/insertion_sort.png)

**Inversion**

Def. An inversion is a pair of keys that are out of order.

+ Def. An array is **partially sorted** if the number of inversions is <= cN.
+ Proposition. For partially-sorted arrays, insertion sort runs in linear time.
+ Pf. Number of exchanges equals the number of inversions.

![inversion](image/inversion.png)

#### Shell Sort

> idea: reduce the inversions

+ Move entries more than one poisition at a time by **h-sorting** the array.
+ Knuth's incremental sequence is `3x+1`.
+ Example of simple idea leading to substantial performace gains.

![shell_sort](image/shell_sort.png)

#### Knuth Shuffle

Algorithm:

+ In iteration i, pick integer r between 0 and i uniformly at random.
+ Swap a[i] and a[r]

## Mergesort

> [Algorithms - 2.2 Mergesort](http://algs4.cs.princeton.edu/22mergesort)

Algorithm

+ Divide array into two halves.
+ Recursively sort each half.
+ Merge two halves.

![merge_sort](image/merge_sort.png)

Improvements

+ Cutoff to insertion sort for ~ 7 items. (Has too much overhead for tiny subarrays)
+ Stop if already sorted, is biggest in first half <= smallest in second half.

Bottom-up mergesort

+ Pass through array, merging subarrays of size 1.
+ Repeat for subarrays of size 2, 4, 8, 16, ...

## Quicksort

> [Algorithms - 2.3 Quicksort](http://algs4.cs.princeton.edu/23quicksort)

Algorithm

+ Shuffle the array. (performace guarantee)
+ Partition so that, for some j
  - entry a[j] is in place
  - no larger entry to the left of j
  - no smaller entry to the right of j
+ Sort each piece recursively

![quick_sort](image/quick_sort.png)

Improvements

+ Cutoff to insertion sort for ~ 10 items. (Has too much overhead for tiny subarrays)
+ Median of sample `median_of_3(arr, lo, (lo+hi)/2, hi)`

**Quick Select**

> Top k, find a k-th smalles item.

Algorithm

+ Partition array so that entry a[j] is in place.
+ Repeat in one subarray, depending on comparison with j.
+ Finish when j equals k.

![quick_select](image/quick_select.png)

**Duplicate Keys**

> Entropy-optimal sorting && Dutch national flag problem

Algorithm: Dijkstra 3-way partition

+ Let v be partition item a[lo].
+ Scan i from left to right.
  - (a[i]  < v): exchange a[lt] with a[i]; increment both lt and i
  - (a[i]  > v): exchange a[gt] with a[i]; decrement gt
  - (a[i] == v): increment i

![three_way_partition](image/three_way_partition.png)

## Counting Sort

> Counting sort is a sorting technique based on keys between a specific range

Most sorting algorithms are comparison sorts, i.e. they sort a list just by comparing the elements to one another. A comparison sort algorithm cannot beat n×log(n)n×log(n) (worst-case) running time, since n×log(n)n×log(n) represents the minimum number of comparisons needed to know where to place each element.

However, for certain types of input, it is more efficient to use a non-comparison sorting algorithm. This will make it possible to sort lists even in linear time. These challenges will cover Counting Sort, a fast way to sort lists where the elements have a **small number of possible values**, such as integers within a certain range.

## Priority Queues

> [Algorithms - 2.4 Priority Queues](http://algs4.cs.princeton.edu/24pq)


API

+ `initialize(arr)` create a priority queue with given keys
+ `insert(v)`
+ `delete_max()` return and remove the max/min key

**Binary Heap**

+ Binary tree - Empty or node with links to left and right binary trees.
+ Compelte binary tree - Perfectly balanced, except for bottom level. (Property. Height of complete tree with N nodes is lg N)
+ Binary heap - Array representation of a heap-ordered complete binary tree.

![binary_heap](image/binary_heap.png)

Property

+ Largest key is a[1], which is root of binary tree.
+ Can use array indices to move through tree. (Indices start at 1)
  - Parent of node at k is at k/2.
  - Children of node at k are at 2k and 2k+1.

API

+ `swim(k)`, promotion. Child's key becomes larger key than its parent's key.
+ `sink(k)`, demotion. Parent's key becomes smaller than one (or both) of its children's.
+ `insert(v)`. Add node at end, and swim it up.
+ `delete_max()` . Exchange root with node at end, sink it down.

![binary_heap_swim](image/binary_heap_swim.png)
![binary_heap_sink](image/binary_heap_sink.png)

Consideration

+ Immutability of keys. Better use immutable keys.
+ Underflow and overflow. Throw exception if deleting from empty PQ.
+ Minimum-oriented priority queue. Replace `less()` with `greater()`
+ Other operations.
  - Remove an arbitrary item.
  - Change the priority of an item.

**Heap Sort**

Using the Binary Heap data structure.

+ Build map heap using bottom-up method.
+ Repeatedly delete the largest remaining item.

```ruby
for (int k = N/2; k >= 1; k--)
  sink(a, k, N);

while (N > 1)
{
  exch(a, 1, N--);
  sink(a, 1, N);
}
```

Significance. In-place sorting algorithm with N log N worst-case.

+ Mergesort: no, linear extra space.
+ Quicksort: no, quadratic time in worst case.
+ Heapsort: yes!

Bottom line. Heapsort is optimal for both time and space, but:

+ Inner loop longer than quicksort’s.
+ Makes poor use of cache memory.
+ Not stable.

## Application

#### System sorts

Mergesort

+ Java sort for objects.
+ Perl, C++ stable sort, Python stable sort, Firefox JavaScript, ...

Quicksortu
+ Java sort for primitive types.
+ C qsort, Unix, Visual C++, Python, Matlab, Chrome JavaScript, ...

Q. Why use different algorithms for primitive and reference types?

+ Merge sort for objects, because it's stable, and maybe who using objects has less consideration about spaces.
+ Quick sort for primitves. Faster in practice and also save space.

#### Convex Hull

Algorithm: Graham Scan

+ Choose point p with smallest y-coordinate.
+ Sort points by polar angle with p.
+ Consider points in order; discard unless it create a ccw turn.

![convex_hull](image/convex_hull.png)

Q. How to check a CCW turn

![ccw](image/ccw.png)

#### Quick Sort Easy Partition

> [Quicksort In-Place](https://www.hackerrank.com/challenges/quicksort3) on HackerRank

+ Use [Lomuto Partition](http://en.wikipedia.org/wiki/Quicksort#Algorithm).

```
algorithm partition(A, lo, hi) is
    pivot := A[hi]
    i := lo        // place for swapping
    for j := lo to hi – 1 do
        if A[j] ≤ pivot then
            swap A[i] with A[j]
            i := i + 1
    swap A[i] with A[hi]
    return i
```

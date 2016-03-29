# Check the full usage and API in test/searching/

bst = Searching::BinarySearchTree.new

data = %w(S E A R C H E X A M P L E)
data.each_with_index do |key, value|
  bst.put(key, value)
end

# -----------------------
#
#              S
#           /     \
#         E         X
#       /   \
#     A       R
#      \    /
#       C H
#           \
#             M
#           /   \
#         L       P

bst.get('S') # => 0
bst.get('A') # => 8
bst.get('Z') # => nil

bst = Searching::RedBlackBST.new

data = %w(S E A R C H E X A M P L E)
data.each_with_index do |key, value|
  bst.put(key, value)
end

# -----------------------
#
#              M
#           /     \
#         E         R
#       /   \     /   \
# A - C   H - L  P  S - X

import qualified Data.Foldable as F
import Data.Monoid

-- TREE       5
--           / \
--          4   7
--             / \
--            6   8
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- create root node, with empty left and right branches
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- insert element to tree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x          -- create root node
treeInsert x (Node a left right)
  | x == a = Node x left right                -- return the same tree
  | x < a  = Node a (treeInsert x left) right -- insert to left branch
  | x > a  = Node a left (treeInsert x right) -- insert to right branch

-- search element in tree
inTree :: (Ord a) => a -> Tree a -> Bool
inTree x EmptyTree = False
inTree x (Node a left right)
  | x == a = True                             -- if it's root node
  | x < a  = inTree x left                    -- search in left branch
  | x > a  = inTree x right                   -- search in right branch

root = singleton 0
two = treeInsert 1 root
three = treeInsert 2 two


-- foldable with monoid
instance F.Foldable Tree where
  foldMap f EmptyTree = mempty
  foldMap f (Node x l r) = F.foldMap f l `mappend` -- recursion trough left node
                           f x           `mappend` -- just apply function to current node
                           F.foldMap f r           -- recursion by right node

-- F.foldMap return single monoid value
testMonoid = "one" `mappend` " two"

testTree = Node 5
            (Node 3
              (Node 1 EmptyTree EmptyTree)
              (Node 6 EmptyTree EmptyTree)
            )
            (Node 9
              (Node 8 EmptyTree EmptyTree)
              (Node 10 EmptyTree EmptyTree)
            )

testFTree = F.foldl (+) 0 testTree -- 42
testFTree2 = F.foldMap (\x -> Any $ x == 3) testTree -- Any {getAny = True}

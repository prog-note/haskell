import Control.Applicative

-- class (Functor f) => Applicative f where
--   (<*>) :: f (a -> b) -> f a -> f b
-- instance Applicative [] where
--   fs <*> xs = [f x | f <- fs, x <- xs]

-- (<$>) :: (Functor f) => (a -> b) -> f a -> f b
-- f <$> x = fmap f x


-- build new list with combinate of two list
a = [x+y | x <- [1,2,3], y <- [1,2,3]]  -- [2,3,4,3,4,5,4,5,6]

-- map function to list and then combinate with other list
b = (+) <$> [1,2,3] <*> [1,2,3]         -- [2,3,4,3,4,5,4,5,6]

-- just combinate one list with other
c = [(1+),(2+),(3+)] <*> [1,2,3]        -- [2,3,4,3,4,5,4,5,6]

-- apply 5 both functors and then add
d = (+) <$> (+1) <*> (+2) $ 5           -- 13

-- apply list itmes by one (first to first, second to second etc.)
zippedList = (+) <$> ZipList [1,2,3] <*> ZipList [1,2,3] -- ZipList {getZipList = [2,4,6]}
e = getZipList zippedList                                -- [2,4,6]

-- (,,) eq: `\x y z -> (x,y,z)`
f = (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "man"

-- liftA2 f x y = f <$> x <*> y
g = liftA2 (+) [1,2,3] [1,2,3]          -- [2,3,4,3,4,5,4,5,6]

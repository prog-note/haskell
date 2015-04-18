-- class Monad m where
--   return :: a -> m a
--
--   (>>=) :: m a -> (a -> m b) -> m b
--
--   (>>) :: m a -> m b -> m b
--   x >> y = x >>= \_ -> y
--
--   fail :: String -> m a
--   fail msg = error msg
--
-- instance Monad Monad where
--   return x = Just x
--   Nothing >>= f = Nothing
--   Just x  >>= f = f x
--   fail _ = Nothing

import Control.Monad

type Birds = Int
type Pole = (Birds, Birds)

-- without restriction
landLeft :: Birds -> Pole -> Pole
landLeft n (left, right) = (left + n, right)

landRight :: Birds -> Pole -> Pole
landRight n (left, right) = (left, right + n)

testLeft = landLeft 1 (0, 0)
testRight = landRight 1 (0, 0)
testBoth = landLeft 1 (landRight 1 (0, 0))

x -: f = f x
extra = (0, 0) -: landLeft 2 -: landRight 1

-- with restriction (Nothing like fail), and monad as resolver
landLeft2 :: Birds -> Pole -> Maybe Pole
landLeft2 n (left, right)
  | abs((left + n) - right) < 4 = Just (left + n, right)
  | otherwise                   = Nothing

landRight2 :: Birds -> Pole -> Maybe Pole
landRight2 n (left, right)
  | abs(left - (right+ n)) < 4  = Just (left, right + n)
  | otherwise                   = Nothing

testLeft2 = landLeft2 1 (0, 0)
testRight2 = landRight2 1 (0, 0)

-- if Nothing >>= return Nothing emadiately
-- else get value from Maybe and pass to next chain

monad = return (0, 0) >>= landLeft2 2 >>= landRight2 1
monad2 = Nothing >>= landLeft2 1
monad3 = return (0, 0) >>= landLeft2 1 >> Just (1,2) >>= landLeft2 1

-- >> like ignore incomming parameters
-- Nothing >> Just 1    -- Just 1
-- Just 2 >> Just 1     -- Just 1

-- do
--  <- like >>= (just return unwraped walue)
test = Just 9 >>= (\x -> Just (x > 8))
testDo = do
  x <- Just 9
  Just (x > 8)

-- line without <- is the same as >>
testDo2 = do
  x <- Just 9
  Nothing
  Just (x > 8)

-- fail matching return Nothing
testDoWithMatch = do
  (x:h) <- Just "" -- expect fail
  Just $ x:"!"

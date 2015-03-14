class YesNo a where                  -- declare own class like: Eq, Show, Ord
  yesno :: a -> Bool

instance YesNo Int where             -- define instance for Int
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where             -- define instance for list
  yesno [] = False
  yesno _ = True

instance YesNo Bool where            -- define instance for Bool
  yesno = id                         -- id return themself (because its already Bool)

testString = yesno "test"            -- True
testEmptyString = yesno ""           -- False
testInt = yesno(1::Int)              -- True
testZero = yesno(0::Int)             -- False
testBool = yesno True                -- True

-- class (Num a) => NumYesNo a where -- allow class just for Num
-- instance NumYesNo [a]             -- raise error because `[a]` is not Num


----------------------------------------------------------------------
-- data    - if you want to make something completely new
----------------------------------------------------------------------

data YN = Yes | No                   -- declare own data type like: Int, Bool

instance YesNo YN where              -- define instance for YN type
  yesno Yes = True
  yesno _ = False

instance Show YN where               -- define show instance for YN type
  show Yes = "Yes! Sure!"
  show No = "No! No!"

testShow = Yes                       -- Yes! Sure!
testYesNo = yesno Yes                -- True


----------------------------------------------------------------------
-- newtype - if you want to take an existing type and wrap it in a
--           new type in order to make it an instance of a type class
----------------------------------------------------------------------

newtype Pair a b = Pair { getPair :: (b, a) } deriving (Show)

instance Functor (Pair a) where
  fmap f (Pair (x, y)) = Pair (f x, y)

test = fmap (+10) (Pair (1, 2))      -- Pair {getPair = (11,2)})
result = getPair test                -- (11, 2)


----------------------------------------------------------------------
-- type - if you just want your type signature to look cleaner and
--        more descriptive
----------------------------------------------------------------------

type NewString = [Char]
type Name = String
type List = (Int, Int)
type MList a b = (a, b) -- parametrized type (List with diff types)

first :: MList a b -> a
first list = fst list

testMListWithInt = first (1, 2) -- for int could be use simple List
testMListWithString = first ("test", "west")

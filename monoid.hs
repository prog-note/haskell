-- MONOID - Data.Monoid
class Monoid m where
  mempty :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  mconcat = foldr mappend mempty


-- Monoid for List
instance Monoid [a] where
  mempty = []
  mappend = (++) -- just use existing function ++

mListTest = [1,2,3] `mappend` [4,5,6] -- [1,2,3,4,5,6]
mListTest2 = "one" `mappend` " two " `mappend` "tree"    -- "one two tree"
mListTest21 = "one" `mappend` (" two " `mappend` "tree") -- "one two tree"
mListTest22 = ("one" `mappend` " two ") `mappend` "tree" -- "one two tree"


-- Monoid implementation Any, All
newtype Any = Any { getAny :: Bool }
  deriving (Eq, Ord, Read, Show, Bounded)

instance Monoid Any where
  mempty = Any False
  Any x `mappend` Any y = Any (x || y) -- for `All` we should change || to &&

mBoolAny = Any True `mappend` Any False
mBoolAny2 = mempty `mappend` Any False
mBoolAny3 = mconcat . map Any $ [False, False, False, True] -- mconcat above (it is `foldr`)


-- Monoid for Maybe
instance Monoid a => Monoid (Maybe a) where
  mempty = Nothing
  Nothing `mappend` m = m
  m `mappend` Nothing = m
  Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)

mMaybe =  Just "one" `mappend` Nothing     -- Just "one"
mMaybe2 =  Just "one" `mappend` Just "two" -- Just "one two"

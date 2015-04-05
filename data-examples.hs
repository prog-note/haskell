-- Circle, Square - data constructors with parameters, and return Shape type
data Shape = Circle Float Float Float | Square Float Float deriving (Show)

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Square a b)   = (a + b) * 2

testAreaCircle = area $ Circle 1 2 3
testAreaSquare = area $ Square 1 2


-- Name of type can be the same as data constructor
data Point = Point Float Float deriving (Show)

xPoint :: Point -> Float      -- like function accessor to `x` Point
xPoint (Point x _) = x

testPoin = Point 10.2 20.3
testXPoint = xPoint testPoin  -- 10.2


-- Data constructor with specified fields
--    automatically will define function accessor
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phone :: String
                     } deriving (Show)

testPerson = Person { firstName="Foo"
                    , lastName="Zoo"
                    , age=21
                    , height=188.0
                    , phone="12340-2222"
                    }

testFirstName = firstName testPerson -- "Foo"


-- Parametrized type - without specifying concrete type
data Car a b c = Car { company :: a
                     , model :: b
                     , year :: c
                     } deriving (Show)

carWithYearAsString = Car "Ford" "Mustang" "old"
carWithYearAsNum    = Car "Ford" "Mustang" 1999
carWithNamedParams  = Car {company="Ford", model="Mustang", year="new"}

-- allow Car year attribute just as Num
carTest :: (Num c) => Car a b c -> c
carTest (Car a b c) = c

-- carTest carWithYearAsString  -- failed because "old" is not num
-- carTest carWithYearAsNum     -- 1999


data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)
testVector = Vector 1 2 3 `vplus` Vector 1 2 3 -- Vector 2 4 6


-- Macke type as Subtype with `deriving`
data User = User { first :: String, last :: String} deriving (Eq, Show, Read)

resultShow = User "Jon" "Test" -- User {first = "Jon", last = "Test"}
resultEq = resultShow == User "Jon" "Test" -- True
resultRead = read "User {first=\"Jon\", last=\"Test\"}" :: User -- User {first = "Jon", last = "Test"}


-- Eq and Ord compare in next priority
-- 1 - compare attributes (if field is Ord)
-- 2 - data constructor position (first is smaller than second)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

testWednesday = Wednesday               -- Wednesday
testSaturday  = read "Saturday" :: Day  -- Saturday
testCompare   = Saturday > Friday       -- True
minDay        = minBound :: Day         -- Monday
afterMonday   = succ Monday             -- Tuesday
beforeSunday  = pred Sunday             -- Saturday


-- parametrized data type with separating between constructor
--    good for specifying some result, like success and error
data Zero a b = ERight a | EWrong b deriving (Show)

zero :: Int -> Zero String Int
zero num = if num == 0
           then ERight "Zero"
           else EWrong num

testZero1 = zero 0 -- ERight "Zero"
testZero2 = zero 2 -- EWrong 2


-- RECURSIVE data type (one parameter in constructor is the same as data type)
-- FIXITY declaration
infixr 5 :>: -- right direction
infixl 5 :<: -- left direction

data SimpleList a = Empty
      | RightPush a (SimpleList a) -- simple right constructor
      | BadPush (SimpleList a) a   -- just something not good

      | a :>: (SimpleList a)       -- right direction
      | (SimpleList a) :<: a       -- left direction

      deriving (Show)

right1 = RightPush 1 $ RightPush 2 Empty      -- RightPush 1 (RightPush 2 Empty)
right2 = 1 `RightPush` (2 `RightPush` Empty)  -- RightPush 1 (RightPush 2 Empty)
bad = BadPush (BadPush (BadPush Empty 1) 2) 3 -- bad recursion ;(

rightFixity = Empty :<: 1 :<: 2    -- (Empty :<: 1) :<: 2
leftFixity =  1 :>: 2 :>: Empty    -- 1 :>: (2 :>: Empty)

-- minus is left directed method 4 - 2 - 1 == ((4 - 2) - 1)
--    declare fixity for right directed minus
infixr 5 `minus`

minus :: Float -> Float -> Float
minus a b = a - b

testMinus = 4 `minus` 3 `minus` 2 `minus` 1 -- (4 - (3 - (2 - 1)))

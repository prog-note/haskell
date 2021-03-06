-- FIXITY declaration
infixr 5 :>: -- right direction
infixl 5 :<: -- left direction

data SimpleList a = Empty
      | Push a (SimpleList a)      -- right constructor
      | (SimpleList a) `LPush`  a  -- left constructor

      | a :>: (SimpleList a)       -- right direction fixity
      | (SimpleList a) :<: a       -- left direction fixity

      deriving (Show)


right1 = Push 1 $ Push 2 Empty      -- Push 1 (Push 2 Empty)
right2 = 1 `Push` (2 `Push` Empty)  -- Push 1 (Push 2 Empty)
left  = Empty `LPush` 1 `LPush` 2   -- (Empty `LPush` 1) `LPush` 2


-- with fixity we don't need parenthesis for right direction
rightFixity = 1 :>: 2 :>: Empty     -- 1 :>: (2 :>: Empty)
leftFixity  = Empty :<: 1 :<: 2     -- (Empty :<: 1) :<: 2


-- minus is left directed method 4 - 2 - 1 == ((4 - 2) - 1)
--    declare fixity for right directed minus
infixr 5 `minus`

minus :: Float -> Float -> Float
minus a b = a - b

testMinus = 4 `minus` 3 `minus` 2 `minus` 1 -- (4 - (3 - (2 - 1)))

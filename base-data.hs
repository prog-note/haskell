-- LIST may contain variable just one type
-----------------------------------------------------------

list = ["t","e","s","t"]          -- the same as "test"
concat = list ++ [" end"]         -- concat only the same type
before = "start ":list            -- add element to list with `:` (first argument must be element)
otherList = 1:2:3:[]              -- the same as [1,2,3]

elementOfList = list !! 1         -- `!!` access to element of array

compare = [2,3,4] > [1,5,5]       -- compare first, than second etc.

headOfList  = head list           -- first element
tailOfList  = tail list           -- without first
lastOfList  = last list           -- last element
initOfList  = init list           -- without last
listIsEmpty = null list           -- if empty return true

fewElements = take 3 list         -- 3 first elements
cleanList   = drop 3 list         -- delete 3-th first elements
exis        = 4 `elem` [1,2,3]    -- check existing element with value 4

-- Some functions: maximum, minimum, sum,
-- product(multiply), reverse, length


-- RANGE
-----------------------------------------------------------

range        = [1..4]                   -- like [1,2,3,4]
rangeWitStep = [1,5..15]                -- first 2 elements set setp (in this case is 4)
infinite     = take 20 [10, 20..]       -- infinite range with step 10 (just get first 20)
fewCycle     = take 10 (cycle "test ")  -- first 10 elements from cicle -> "test test "
fewRpeat     = take 10 (repeat "test ") -- repeat this 10 times -> ['test ', 'test ', ..]
fewReplicate = replicate 3 "test"       -- like repeat 3 times (don't use take)


-- COMPREHENSION (can input many list and set many condition)
-----------------------------------------------------------

-- x will has value from range, and calculated
comp = [(x+1)*2 | x <- [1..10]]

-- before calculation `x` will be chacked (filtered)
compWithCondition = [x*2 | x <- [1..10], x > 5]

-- expected list as argumet and use it in comprehension
someFunc arg = [ if x < 10 then "litle" else "big" | x <- arg]

-- for each `x` use each `y` (like x1y1, x2,y1, x3y1..x1y2..) it's all combination
multiComp = [x+y | x <-[1..5], y <- [5..10]]

-- replace each value of list to 1 and sumarize it (_ is like tmp var)
count arg = sum [1 | _ <- arg]


-- TUPLE
-----------------------------------------------------------

-- tuple - diff types, fixed size
tuple = (1,2,3,4)

-- not [(1,2,3),(4,5)] and [(1,'one'),(2,3)]
listWithTuple = [(1,2),(2,3)]

-- tuple like pairs (fst-first, snd-second)
firstVal = fst (1,2)
secondVal = snd (1,2)

-- create pairs like [(1,"one"),(2,"two"),(3,"three")]
pairs = zip [1..3] ["one","two","three"]
elementAt str int = head $ [v | (i, v) <- zip [1..] str, i == int] -- like !!

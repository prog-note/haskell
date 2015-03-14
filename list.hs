-- LIST may contain variable just one type

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

-- Some functions:
-- maximum, minimum, sum, product(multiply), reverse, length

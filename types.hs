someFunction :: Int -> Int      -- input Int and output Int
someFunction x = x + 1

otherFunc :: Int -> Int -> Int  -- input 2 Int, output Int
otherFunc x y = x + y

diffTypeFunc :: a -> a          -- can be diff type (but input and output data is the same type)
diffTypeFunc x = x

-- Int
-- Bool
-- Char == ''
-- String == [Char] == ""

eBool = read "True" || False    -- convert string to context
eInt  = read "1" + 1
eList = read "[1,2,3]" ++ [4]

tBool = read "True" :: Bool     -- convert to defined type
tInt  = read "123" :: Int
tList = read "[1,2,3]" :: [Int]

sBool = show True               -- convert to string
sInt  = show 1

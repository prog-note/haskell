-- if match isn't found then will be raise exeption
matchFunc :: Int -> String
matchFunc 1 = "This is only one"
matchFunc 2 = "Second"
matchFunc x = "It something like: " ++ show x

-- () is not tuple is just for build case
infoFunc :: [a] -> String
infoFunc []      = "list is empty"
infoFunc (x:[])  = "x - first, size = 1"             -- (x:[]) like [x]
infoFunc [x,y]   = "x - first, y - second, size = 2" -- (x:y:[]) like [x,y]
infoFunc (x:_)   = "x - first, doesn't matter size"

-- match tuple
tupleFunc :: (Int, Int, Int) -> String
tupleFunc (x, 0, 0) = "y, z eq: 0"
tupleFunc (1, _, _) = "x eq: 1, y and z is ignored"
tupleFunc (x, y, z) = "x:" ++ show x ++ " y:" ++ show y ++ " z:" ++ show z

-- pattern matching defined inside where
matchInsideWhere x = "The argument is: " ++ getArg x
  where getArg 0 = "null"
        getArg 1 = "one"
        getArg 2 = "two"
        getArg a = show a

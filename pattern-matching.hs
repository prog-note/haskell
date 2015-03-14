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

-- pattern matching defined inside where
matchInsideWhere x = "The argument is: " ++ getArg x
  where getArg 0 = "null"
        getArg 1 = "one"
        getArg 2 = "two"
        getArg a = show a


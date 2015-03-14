-- GUARDS (like `pattern matching` but in this case we can use condition)
getSomeChois :: Int -> String
getSomeChois arg
  | arg == 1  = "It's one"
  | arg < 5   = "It's more then one"
  | arg > 5   = "It's more then five"
  | otherwise = "Argument is: " ++ show arg

useWhere :: Int -> Int -> String
useWhere wight height
  | sqare < 5 = "Litle sqare"
  | sqare > 5 = "Big sqare! " ++ additional
  where sqare = wight * height                  -- calculate comparing argument once before campare
        additional = "And some other data"      -- we can create some additional function

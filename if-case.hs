big x y = if x < y
          then y
          else x


theSameCase x = "The argument is: " ++
  case x of
    0 -> "null"
    1 -> "one"
    2 -> "two"
    xs -> show x

someCase x = "The argument is: " ++ argument
  where argument = case x of
                     0 -> "null"
                     xs -> show x

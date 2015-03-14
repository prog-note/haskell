-- LET inside comprehension
letWithComprehension = [someFuncWithLet | x <- [1..10], let someFuncWithLet = x + 1]

-- LET inside `do` notation
letWithDo = do
  let x = 1
  let y = 2
  x + y

-- LET with IN (inline)
letIn     = let square x y = x * y in square 2 2  -- define function in local scope
moreLetIn = let a = 2; b = 3       in a + b       -- more then one definition

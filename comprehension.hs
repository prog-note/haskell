-- COMPREHENSION (can input many list and set many condition)

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

-- TUPLE

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

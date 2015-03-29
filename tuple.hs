-- TUPLE

-- tuple - diff types, fixed size
tuple = (1,2,3,4)

-- not [(1,2,3),(4,5)] and [(1,'one'),(2,3)]
listWithTuple = [(1,2),(2,3)]

-- tuple like pairs (fst-first, snd-second)
firstVal = fst (1,2)
secondVal = snd (1,2)

-- list of tuple pairs is like key-value storage
testPairs = zip [1..] ["one","two","three"] -- [(1,"one"),(2,"two"),(3,"three")]

-- find value by key
valueAt pairs key = head $ [v | (i, v) <- pairs, i == key]
testValueAt = testPairs `valueAt` 2

-- find char in string by index (like: !!)
elementAt str index = head $ [v | (i, v) <- zip [1..] str, i == index]
testElementAt = "awesome" `elementAt` 2

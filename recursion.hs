-- recursive with matching (in the end we have simple max function)
maximum_ :: (Ord a) => [a] -> a
maximum_ []     = error "maximum of empty list!"
maximum_ [x]    = x
maximum_ (x:xs) = max x (maximum_ xs)

-- reverse array
reverse_ :: [a] -> [a]
reverse_ []     = []
reverse_ (x:xs) = reverse_ xs ++ [x]

-- infinite repeat (add x as first element of returned array from repeat_)
repeat_ :: a -> [a]
repeat_ x = x:repeat_ x

-- zip
zip_ :: [a] -> [b] -> [(a, b)]
zip_ _ [] = []
zip_ [] _ = []
zip_ (x:xs) (y:ys) = (x,y):zip_ xs ys

-- quicksort (first element into center)
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [a | a <- xs, a <= x]
      larger         = [a | a <- xs, a > x]
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger

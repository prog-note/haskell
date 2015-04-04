-- function can return function as result
-----------------------------------------

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

sum1 = (++ "+2") "1"   -- is '1+2', sum as function, eq "1" + "+2"
sum2 = ("1"++) "+2"

div1 = (/10) 200       -- is 20, divide as function eq: 200 / 10
div2 = (200/) 10

sub1 = (subtract 1) 5  -- is 4, minus as function eq: 1 `subtract` 5
sub2 = (-4)            -- for convenience it's just -4

-- all function take just one parameter and return function which
--    is applied for next parameter etc.
func x y z = x + y + z
func0 = func     -- func0 is the same as func
func1 = func0 1  -- func1 is func where x is 1
func2 = func1 2  -- func2 is func where x = 1, y = 2
funcR = func2 3  -- is 6, func where x = 1, y = 2, z = 3


-- function can take other functions as parameter
-------------------------------------------------

-- first parameter `(a -> a)` is function (get and return the same type)
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f(f x)

testApplyTwice1 = applyTwice (++ "0") "Z"   -- is "Z00"
testApplyTwice2 = applyTwice (3:) [1]       -- is [3,3,1]

-- map
map_1 = map (+3) [1,2,3,4,5] -- eq: [x+3 | x <- [1,2,3,4,5]]
map_2 = map (+) [1,2,3]      -- build list of functions (1+), (2+) ...
map_v = (map_2 !! 2) 1       -- is 4, eq: (3+1)

-- filter - get elements greate then 3
filter_1 = filter (>3) [1,2,3,4,5]    -- eq: [x | x <- [1,2,3,4,5], x > 3]

-- foldl/foldr - left/right fold (foldl1/foldr1 - without starting point)
foldl_sum = foldl (+) 0 [1,2,3,4]     -- is 10, start from 0,
foldr_val_1 = foldr (:) [] [1,2,3,4]  -- good for build list from other list

-- scanl/scanr - previous result apply to next (scanl1/scanr1)
scan_1  = scanl (+) 0 [1,2,3,4]   -- is [0, 1, 3, 6, 10]
scan_2  = scanr (+) 0 [1,2,3,4]   -- is [10, 9, 7, 4, 0]

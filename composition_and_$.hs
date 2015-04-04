-- $ - function application operator (calc1 eq calc2) instead parentheses
calc1 = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
calc2 = sum $ takeWhile (<10000) $ filter odd $ map (^2) [1..]

-- $ - apply function from left side to result from right side
calc3 = (4/) 2 + 1     -- is 3,      eq: ((4/) 2) + 1
calc4 = (4/) $ 2 + 1   -- is 1.33.., eq: (4/) (2+1)

-- $ - apply function from list to right side
val_for_func = map ($ 2) [(+2), (4/), (^2)] -- is [4, 2, 4]

-- . - composition (concatenate functions)
com1 = map (negate . abs . (/10)) [1,2,3]         -- apply list elements to composition
com2 = map (\x -> negate $ abs $ (/10) x) [1,2,3] -- the same with lambda
com3 = (>15) . length                             -- eq: \x -> length x > 15

-- like val_for_func but without completing, instead increase functionality from list
composition_list = map (. (*2)) [(abs), (negate)]
comp_calc_val = (composition_list !! 1) 1 -- is -2


-- $ right side is defined (closed part)
-- . right side receiv intuitive parameter
--    - for finished calculation could be complete with $

func1 x = (*2) $ negate x         -- not `func1 = (*2) $ negate`
func2 = (*2) . negate             -- not `func2 x = (*2) . negate x`
finished = (*2) . (+2) $ negate 1 -- finished calculation value


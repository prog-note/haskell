-- RANGE

range        = [1..4]                   -- like [1,2,3,4]
rangeWitStep = [1,5..15]                -- first 2 elements set setp (in this case is 4)
infinite     = take 20 [10, 20..]       -- infinite range with step 10 (just get first 20)
fewCycle     = take 10 (cycle "test ")  -- first 10 elements from cicle -> "test test "
fewRpeat     = take 10 (repeat "test ") -- repeat this 10 times -> ['test ', 'test ', ..]
fewReplicate = replicate 3 "test"       -- like repeat 3 times (don't use take)

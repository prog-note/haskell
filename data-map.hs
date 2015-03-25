import Data.Char
import qualified Data.Map as Map

isDigitTest = isDigit '1'               -- true

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show
testDigitSum = digitSum 1234            -- 10

stringToDigit :: String -> [Int]
stringToDigit = map digitToInt . filter isDigit
testStringToDigit = stringToDigit "123-123,1"     -- [1,2,3,1,2,3,1]


-- pair list [([Char], [Char])]
keyValue1 = [("betty", "555-2222"), ("bonnie", "444-5555")]
keyValue2 = [("MS", 1), ("MS", 2), ("NN", 3)]

-- key-value from pair list
mapFromList1 = Map.fromList keyValue1             -- fromList [(..), ..]
mapFromList2 = Map.fromList keyValue2             -- fromList [("MS", 2)] - uniq key
newMapFromList2 = Map.fromListWith (+) keyValue2  -- fromList [("MS",3)] - build common value
otherMapFromList2 = Map.fromListWith (++) $ map (\(a, b) -> (a, [b])) keyValue2 -- fromList [("MS", [1,2])]

findInMapByKey = Map.lookup "betty" mapFromList1          -- Just "555-2222"
mapWithUpdatedValue = Map.map stringToDigit mapFromList1  -- fromList [("betty",[5,5,5,2,2,2,2])...]
sizeOffMap = Map.size mapFromList1                        -- 2

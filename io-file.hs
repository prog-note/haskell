import System.IO

main = do
  handle  <- openFile "test.txt" ReadMode
  content <- hGetContents handle
  putStr content
  hClose handle

  -- bracketOnError(openFile "test.txt" ReadMode)
  --   (\hadnler -> do ... ) -- when error happens
  --   (\hadnler -> do ... ) -- without error

  -- withFile - automaticaly close file and with bracketOnError
  withFile "test.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents)

  -- hGetLine
  -- hPutStrLn
  -- hPutStr
  -- appendFile "file" "line"
  -- (tmpName, tmpHandle) <- openTempFile "." "temp"

  contents <- readFile "test.txt"
  putStr contents

  writeFile "test.txt" "first line\nsecond line\nthird line\n"

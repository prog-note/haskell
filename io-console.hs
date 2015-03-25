import System.Environment
import Control.Monad (when, forM, forever)

-- main = putStrLn "hello, world"

main = do

  args     <- getArgs
  progName <- getProgName

  putStrLn $ "The arguments are: " ++ show args
  putStrLn $ "The program name: "  ++ progName

  putStrLn "Hello, what's your name?"
  name <- getLine

  if null name
    then return ()                    -- doesn't do nothing
    else putStrLn("Hey, " ++ name)

  -- without using `if` with `return ()`
  when (name == "John") $ putStrLn("You are rock")

  -- like one I/O action
  rs <- sequence [ getLine , getLine ]

  -- putStrLn $ show rs
  print rs

  -- sequence $ map print [1,2,3]
  mapM print [1,2,3]

  list <- forM [1,2,3] (\a -> do
    print("part-" ++ show a)
    return("result-" ++ show a))

  print list


  -- like loop
  forever $ do
    val <- getLine
    putStrLn("Echo: " ++ val)

  -- getContents like streaming from terminal (or from file)
  -- if line is entered we print it and getContents wait next line
  str <- getContents
  putStrLn("Echo: " ++ str)

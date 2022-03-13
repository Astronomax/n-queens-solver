module Lib (someFunc) where
import GenerateTask (generateTask)
import PrintSolution (printSolution)
import System.Environment (getArgs)
import Picosat

someFunc :: IO ()
someFunc = do
    args <- getArgs
    let n = (read $ head args) :: Int
    res <- solve $ generateTask n
    case res of
        (Solution s) -> putStrLn $ printSolution n (filter (>0) s)
        _ -> putStrLn "The problem has no solutions"
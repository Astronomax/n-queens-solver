module Lib (someFunc) where
import GenerateTask (generateTask)
import Picosat

someFunc :: IO ()
someFunc = do
    res <- solve $ generateTask 8
    case res of
        (Solution s) -> putStrLn $ show $ filter (>0) s
        _ -> putStrLn "The problem has no solutions"
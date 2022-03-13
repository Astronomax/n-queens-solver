module PrintSolution (printSolution) where

printSolution :: Int -> [Int] -> String
printSolution n s = foldl1 (\x y -> x ++ "\n" ++ y) $ 
    (\x -> "|" ++ (replicate x '.') ++ "Q" ++ (replicate (n - x - 1) '.') ++ "|") 
    <$> (flip mod n . pred) <$> s
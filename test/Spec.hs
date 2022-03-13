{-# LANGUAGE InstanceSigs #-}
import Test.QuickCheck
import GenerateTask
import System.IO.Unsafe
import Data.List
import Picosat

prop_solution n = 1 <= n && n <= 50 ==> case n of 
    2 -> (unsafePerformIO $ solve $ generateTask n) == Unsatisfiable
    3 -> (unsafePerformIO $ solve $ generateTask n) == Unsatisfiable
    otherwise -> let    (Solution s) = unsafePerformIO $ solve $ generateTask n
                        res = (filter (>0) s) in 
        (distinct $ (\x -> (x - 1) `div` n) <$> res) &&
        (distinct $ (\x -> (x - 1) `mod` n) <$> res) &&
        (distinct $ (\x -> (x - 1) `div` n + (x - 1) `mod` n) <$> res) &&
        (distinct $ (\x -> (x - 1) `div` n - (x - 1) `mod` n) <$> res) &&
        (all (\x -> 1 <= x && x <= n * n) res) &&
        (length res == n)
    where   distinct :: [Int] -> Bool
            distinct arr = let sorted = sort arr in 
                not $ elem 0 $ zipWith (-) sorted $ tail sorted

main :: IO ()
main = do
    quickCheck prop_solution

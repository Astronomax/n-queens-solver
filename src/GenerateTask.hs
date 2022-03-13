module GenerateTask (generateTask) where
import Control.Monad.Identity (guard)

generateTask :: Int -> [[Int]]
generateTask n = (genColCond n) ++
             (genRowCond n) ++
             (genDiag1Cond n) ++
             (genDiag2Cond n) ++
             (genNotEmptyCond n)
    where   genColCond :: Int -> [[Int]]
            genColCond n = do
                i <- [0..(n - 1)]
                j <- [0..(n - 1)]
                k <- [1..(n - 1)]
                guard $ i + k < n
                return [-(i * n + j + 1), -((i + k) * n + j + 1)]
            genRowCond :: Int -> [[Int]]
            genRowCond n = do
                i <- [0..(n - 1)]
                j <- [0..(n - 1)]
                k <- [1..(n - 1)]
                guard $ j + k < n
                return [-(i * n + j + 1), -(i * n + j + k + 1)]
            genDiag1Cond :: Int -> [[Int]]
            genDiag1Cond n = do
                i <- [0..(n - 1)]
                j <- [0..(n - 1)]
                k <- [1..(n - 1)]
                guard $ i + k < n && j + k < n
                return [-(i * n + j + 1), -((i + k) * n + j + k + 1)]
            genDiag2Cond :: Int -> [[Int]]
            genDiag2Cond n = do
                i <- [0..(n - 1)]
                j <- [0..(n - 1)]
                k <- [1..(n - 1)]
                guard $ i + k < n && j - k >= 0
                return [-(i * n + j + 1), -((i + k) * n + j - k + 1)]    
            genNotEmptyCond :: Int -> [[Int]]
            genNotEmptyCond n = do
                i <- [0..(n - 1)]
                return [(i * n + 1)..((i + 1) * n)]
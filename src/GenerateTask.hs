module GenerateTask (generateTask) where
import Control.Monad.Identity (guard)

generateTask :: Int -> [[Int]]
generateTask n = (concat (do
    i <- [0..(n - 1)]
    j <- [0..(n - 1)]
    k <- [1..(n - 1)]
    return $ snd <$> (filter fst [(i + k < n, [-(i * n + j + 1), -((i + k) * n + j + 1)]), 
                (j + k < n, [-(i * n + j + 1), -(i * n + j + k + 1)]),
                (i + k < n && j + k < n, [-(i * n + j + 1), -((i + k) * n + j + k + 1)]),
                (i + k < n && j - k >= 0, [-(i * n + j + 1), -((i + k) * n + j - k + 1)])])))
    ++ ((\i -> [(i * n + 1)..((i + 1) * n)]) <$> [0..(n - 1)])
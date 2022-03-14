module Lib (someFunc) where
import GenerateTask (generateTask)
import PrintSolution (printSolution)
import System.Environment (getArgs)
import Control.Monad.Except (Except, runExcept, withExcept, MonadError (throwError))
import Text.Read (readMaybe)
import Picosat

data MainError = NonNatArgument | IncorrectArgsNumber

instance Show MainError where
    show NonNatArgument = "Non-natural number"
    show IncorrectArgsNumber = "Incorrect number of arguments"

argsExcept :: [String] -> Except MainError Int
argsExcept [arg] = case ((readMaybe arg) :: Maybe Int) of 
    Nothing -> throwError $ NonNatArgument
    (Just n) -> if (1 <= n) then return n else throwError $ NonNatArgument
argsExcept _ = throwError $ IncorrectArgsNumber

someFunc :: IO ()
someFunc = do
    args <- getArgs
    case runExcept $ argsExcept args of
        Right n -> do
            res <- solve $ generateTask n
            case res of
                (Solution s) -> putStrLn $ printSolution n (filter (>0) s)
                _ -> putStrLn "The problem has no solutions"
        Left err -> print err
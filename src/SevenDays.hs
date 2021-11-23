module SevenDays where

-- 基本的な関数の定義
double :: Integer -> Integer
double x = x + x

-- 再帰
factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x - 1)

fact_with_guard :: Integer -> Integer
fact_with_guard x
  | x > 1 = x * fact_with_guard (x - 1)
  | otherwise = 1

-- タプルとリスト
fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, index) = fibTuple (y, x + y, index - 1)

fibResult :: (Integer, Integer, Integer) -> Integer
fibResult (x, y, z) = x

fib :: Integer -> Integer
fib x = fibResult (fibTuple (0, 1, x))

-- タプルと合成
fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (x, y) = (y, x + y)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair (fibNthPair (n - 1))

fib2 :: Integer -> Integer
fib2 = fst . fibNthPair
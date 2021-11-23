module SevenDays where

double :: Integer -> Integer
double x = x + x

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x - 1)

fact_with_guard :: Integer -> Integer
fact_with_guard x
  | x > 1 = x * fact_with_guard (x - 1)
  | otherwise = 1

fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, index) = fibTuple (y, x + y, index - 1)

fibResult :: (Integer, Integer, Integer) -> Integer
fibResult (x, y, z) = x

fib :: Integer -> Integer
fib x = fibResult (fibTuple (0, 1, x))
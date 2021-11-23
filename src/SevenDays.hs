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
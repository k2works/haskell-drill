module Some where

fizzbuzz :: Int -> String
fizzbuzz num
  | num `mod` 15 == 0 = "FizzBuzz"
  | num `mod` 3 == 0 = "Fizz"
  | num `mod` 5 == 0 = "Buzz"
  | otherwise = show num
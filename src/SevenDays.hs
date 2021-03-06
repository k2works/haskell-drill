module SevenDays where

import Data.Bits (Bits (xor))

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

-- リストを作り出す
allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (h : t) = if even h then h : allEven t else allEven t

-- リスト内包表記
doubleList :: [Integer] -> [Integer]
doubleList list = [x * 2 | x <- list]

matchList :: [(Integer, Integer)] -> [(Integer, Integer)]
matchList list = [(y, x) | (x, y) <- list]

combList :: [String] -> [(String, String)]
combList crew = [(a, b) | a <- crew, b <- crew, a < b]

-- 高階関数
squareAll list = map square list
  where
    square x = x * x

-- 遅延評価
myRange start step = start : (myRange (start + step) step)

lazyFib x y = x : (lazyFib y (x + y))

fib3 = lazyFib 1 1

fibNth x = head (drop (x - 1) (take (x) fib3))

-- ユーザー定義の型
data Suit = Spades | Hearts

data Rank = Ten | Jack | Queen | King | Ace deriving (Show)

type Card = (Rank, Suit)

type Hand = [Card]

value :: Rank -> Integer
value Ten = 1
value Jack = 2
value Queen = 3
value King = 4
value Ace = 5

cardValue :: Card -> Integer
cardValue (rank, suit) = value rank

-- モナド

stagger :: (Num t) => t -> t
stagger d = d + 2

crawl d = d + 1

treasureMap d =
  crawl
    ( stagger
        ( stagger d
        )
    )

letTreasureMap (v, d) =
  let d1 = stagger d
      d2 = stagger d1
      d3 = crawl d2
   in crawl d3

data Position t = Position t deriving (Show)

stagger2 (Position d) = Position (d + 2)

crawl2 (Position d) = Position (d + 1)

rtn x = x

x >>== f = f x

treasureMap2 pos = pos >>== stagger2 >>== stagger2 >>== crawl2 >>== rtn

tryIo = do
  putStr "Enter your name: "
  line <- getLine
  let backwards = reverse line
  return ("Hello. Your name backwards is " ++ backwards)

crack = do
  x <- ['a' .. 'c']
  y <- ['a' .. 'c']
  z <- ['a' .. 'c']
  let password = [x, y, z]
  if attempt password
    then return (password, True)
    else return (password, False)

attempt pw = if pw == "cab" then True else False
module SevenDaysSpec (spec) where

import SevenDays
import SevenDays (Position (Position), attempt, crack)
import Test.Hspec

spec :: Spec
spec = do
  describe "基本的な関数の定義" $ do
    it "2倍にして返す" $
      double 5 `shouldBe` 10

  describe "再帰" $ do
    it "3ならば6を返す" $
      factorial 3 `shouldBe` 6
    it "3ならば6を返す" $
      fact_with_guard 3 `shouldBe` 6

  describe "タプルとリスト" $ do
    it "タプルを返す" $
      fibTuple (0, 1, 4) `shouldBe` (3, 5, 0)
    it "タプルの一番目を取り出す" $
      fibResult (0, 1, 4) `shouldBe` 0
    it "フィボナッチ数を返す" $
      fib 100 `shouldBe` 354224848179261915075

  describe "タプルと合成" $ do
    it "一組のペアを計算する" $
      fibNextPair (1, 2) `shouldBe` (2, 3)
    it "数列内の任意の一組を求める" $
      fibNthPair (8) `shouldBe` (21, 34)
    it "フィボナッチ数を返す" $
      fib2 100 `shouldBe` 354224848179261915075

  describe "リストを作り出す" $ do
    it "リストから偶数を取り出して返す" $
      allEven [1, 2, 3, 4, 5] `shouldBe` [2, 4]

  describe "リスト内包表記" $ do
    it "リスト内のすべての項を2倍する" $
      doubleList [1, 2, 3] `shouldBe` [2, 4, 6]
    it "リスト内包表記でパターンマッチングを使う" $
      matchList [(1, 2), (2, 3), (3, 1)] `shouldBe` [(2, 1), (3, 2), (1, 3)]
    it "組み合わせを計算する" $
      combList ["Kirk", "Spock", "McCoy"] `shouldBe` [("Kirk", "Spock"), ("Kirk", "McCoy"), ("McCoy", "Spock")]

  describe "高階関数" $ do
    it "無名関数" $
      (\x -> x ++ " captain.") "Logical," `shouldBe` "Logical, captain."

    it "mapとwhere" $
      squareAll [1, 2, 3] `shouldBe` [1, 4, 9]

    it "セレクションと呼ばれる部分的な関数の一種と共にmapを使うこともできる" $
      map (+ 1) [1, 2, 3] `shouldBe` [2, 3, 4]

    it "filter, foldl, foldr" $
      filter odd [1, 2, 3, 4, 5] `shouldBe` [1, 3, 5]

    it "畳み込み" $
      foldl (\x carryOver -> x + carryOver) 0 [1 .. 10] `shouldBe` 55

    it "畳み込み2" $
      foldl1 (+) [1 .. 3] `shouldBe` 6

  describe "部分適用関数とカリー化" $ do
    it "部分適用関数" $
      (\x -> x + 1) 2 `shouldBe` 3
    it "カリー化" $
      (\x -> \y -> x + y) 1 2 `shouldBe` 3

  describe "遅延評価" $ do
    it "無限範囲を作る" $
      take 10 (myRange 10 1) `shouldBe` [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

    it "遅延評価とリスト合成を用いてフィボナッチ数列を作成する" $
      take 5 (lazyFib 0 1) `shouldBe` [0, 1, 1, 2, 3]

    it "遅延評価とリスト合成を用いてフィボナッチ数列を作成する" $
      take 5 (fib3) `shouldBe` [1, 1, 2, 3, 5]

    it "遅延評価とリスト合成を用いてフィボナッチ数列を作成する" $
      take 5 (drop 20 (lazyFib 0 1)) `shouldBe` [6765, 10946, 17711, 28657, 46368]

    it "遅延評価とリスト合成を用いてフィボナッチ数列を作成する" $
      take 5 (zipWith (+) fib3 (drop 1 fib3)) `shouldBe` [2, 3, 5, 8, 13]

    it "範囲の各項を2倍する" $
      take 5 (map (* 2) [1 ..]) `shouldBe` [2, 4, 6, 8, 10]

    it "部分適用関数および遅延数列と組み合わせる" $
      take 5 (map ((* 2) . (* 5)) fib3) `shouldBe` [10, 10, 20, 30, 50]

  describe "ユーザー定義の型" $ do
    it "カード値を返す" $
      cardValue (Ten, Hearts) `shouldBe` 1

  describe "モナド" $ do
    it "酔った海賊1" $
      treasureMap 5 `shouldBe` 10

    it "酔った海賊2" $
      letTreasureMap (1, 5) `shouldBe` 11

    -- it "酔った海賊3" $
    -- reasureMap2 (Position 0) `shouldBe` Position 5

    it "さまざまな計算戦略1" $
      let cartesian (xs, ys) = do x <- xs; y <- ys; return (x, y)
       in cartesian ([1 .. 2], [3 .. 4]) `shouldBe` [(1, 3), (1, 4), (2, 3), (2, 4)]
    it "さまざまな計算戦略2" $
      crack `shouldBe` [("aaa", False), ("aab", False), ("aac", False), ("aba", False), ("abb", False), ("abc", False), ("aca", False), ("acb", False), ("acc", False), ("baa", False), ("bab", False), ("bac", False), ("bba", False), ("bbb", False), ("bbc", False), ("bca", False), ("bcb", False), ("bcc", False), ("caa", False), ("cab", True), ("cac", False), ("cba", False), ("cbb", False), ("cbc", False), ("cca", False), ("ccb", False), ("ccc", False)]

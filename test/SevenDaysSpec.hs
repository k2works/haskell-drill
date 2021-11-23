module SevenDaysSpec (spec) where

import SevenDays
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

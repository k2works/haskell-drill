module SomeSpec (spec) where

import Some
import Test.Hspec

spec :: Spec
spec = do
  describe "fizzbuzz" $ do
    it "数値を文字列にして返す" $ do
      fizzbuzz 1 `shouldBe` "1"
      fizzbuzz 2 `shouldBe` "2"

    it "3の倍数の場合はFizzを返す" $ do
      fizzbuzz 3 `shouldBe` "Fizz"
      fizzbuzz 6 `shouldBe` "Fizz"

    it "5の倍数の場合はBuzzを返す" $ do
      fizzbuzz 5 `shouldBe` "Buzz"
      fizzbuzz 10 `shouldBe` "Buzz"

    it "3と5の倍数の場合はFizzBuzzを返す" $ do
      fizzbuzz 15 `shouldBe` "FizzBuzz"
      fizzbuzz 30 `shouldBe` "FizzBuzz"

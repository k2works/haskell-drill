module SevenDaysSpec (spec) where

import SevenDays
import Test.Hspec

spec :: Spec
spec = do
  describe "double" $ do
    it "2倍にして返す" $
      double 5 `shouldBe` 10

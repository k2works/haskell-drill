module SevenDaysSpec (spec) where

import SevenDays
import Test.Hspec

spec :: Spec
spec = do
  describe "hello" $ do
    it "standard" $
      hello "world" `shouldBe` "hello, world"
    it "empty" $
      hello "" `shouldBe` "hello, "

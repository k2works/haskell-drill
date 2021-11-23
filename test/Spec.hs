import Test.Hspec

hello :: String -> String
hello name = "hello, " ++ name

specHello :: Spec
specHello = do
  describe "hello" $ do
    it "standard" $
      hello "world" `shouldBe` "hello, world"
    it "empty" $
      hello "" `shouldBe` "hello, "

main :: IO ()
main = hspec $ do
  specHello
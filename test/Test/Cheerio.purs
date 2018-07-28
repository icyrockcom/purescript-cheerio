module Test.Cheerio where

import Prelude hiding (eq)

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

import Cheerio
  ( attr
  , children
  , eq
  , find
  , first
  , hasClass
  , html
  , last
  , length
  , next
  , parent
  , prev
  , siblings
  , text
  )

import Cheerio.Static (loadRoot)

import Test.HtmlEx (htmlEx)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Attributes" do
    test "attr" do
      Assert.equal
        "fruits"
        (loadRoot htmlEx # find "ul" # attr "id")

    test "hasClass" do
      Assert.equal
        true
        (loadRoot htmlEx # find ".pear" # hasClass "pear")

      Assert.equal
        false
        (loadRoot htmlEx # find "apple" # hasClass "fruit")

      Assert.equal
        true
        (loadRoot htmlEx # find "li" # hasClass "pear")

  suite "Traversing" do
    test "find" do
      Assert.equal
        3
        (loadRoot htmlEx # find "#fruits" # find "li" # length)

    test "parent" do
      Assert.equal
        "fruits"
        (loadRoot htmlEx # find ".pear" # parent # attr "id")

    test "next" do
      Assert.equal
        true
        (loadRoot htmlEx # find ".apple" # next # hasClass "orange")

    test "prev" do
      Assert.equal
        true
        (loadRoot htmlEx # find ".orange" # prev # hasClass "apple")

    test "siblings" do
      Assert.equal
        2
        (loadRoot htmlEx # find ".pear" # siblings # length)

    test "children" do
      Assert.equal
        3
        (loadRoot htmlEx # find "#fruits" # children # length)

    test "first" do
      Assert.equal
        "Apple"
        (loadRoot htmlEx # find "#fruits" # children # first # text)

    test "last" do
      Assert.equal
        "Pear"
        (loadRoot htmlEx # find "#fruits" # children # last # text)

    test "eq" do
      Assert.equal
        "Apple"
        (loadRoot htmlEx # find "li" # eq 0 # text)

      Assert.equal
        "Pear"
        (loadRoot htmlEx # find "li" # eq (-1) # text)

  suite "Rendering" do
    test "html" do
      Assert.equal
        (Just "Apple")
        (loadRoot htmlEx # find ".apple" # html)

    test "text" do
      Assert.equal
        "Apple"
        (loadRoot htmlEx # find ".apple" # text)

  suite "More" do
    test "Long chain" do
      Assert.equal
        "Apple"
        ( loadRoot htmlEx
        # find ".apple"
        # siblings
        # eq 1
        # parent
        # children
        # first
        # text)

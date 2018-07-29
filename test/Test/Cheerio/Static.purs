module Test.Cheerio.Static where

import Prelude hiding (eq)

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

import Cheerio (attr, find, length, text)

import Cheerio.Static
  ( load
  , select
  , selectDeep
  , html
  , root
  , loadRoot
  )

import Test.HtmlEx (htmlEx)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Loading" do
    test "load" do
      Assert.equal
        1
        (load htmlEx # root # find "#fruits" # length)

  suite "Selectors" do
    test "select" do
      Assert.equal
        (Just "pear")
        (load htmlEx # select "ul .pear" # attr "class")

    test "selectDeep" do
      Assert.equal
        "Apple"
        (load htmlEx # selectDeep [".apple", "#fruits"] # text)

  suite "Rendering" do
    test "html" do
      Assert.equal
        (Just """<li class="apple">Apple</li>""")
        (loadRoot htmlEx # find ".apple" # html)

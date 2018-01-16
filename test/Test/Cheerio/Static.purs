module Test.Cheerio.Static where

import Prelude hiding (eq)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
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

main :: Eff (avar :: AVAR, console :: CONSOLE, testOutput :: TESTOUTPUT) Unit
main = runTest suites

suites :: forall eff. TestSuite eff
suites = do
  suite "Loading" do
    test "load" do
      Assert.equal
        1
        (load htmlEx # root # find "#fruits" # length)

  suite "Selectors" do
    test "select" do
      Assert.equal
        "pear"
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
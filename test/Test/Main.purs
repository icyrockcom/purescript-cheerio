module Test.Main where

import Prelude hiding (eq)

import Effect (Effect)
import Test.Unit (TestSuite)
import Test.Unit.Main (runTest)

import Test.Cheerio as C
import Test.Cheerio.Static as CS

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  C.suites
  CS.suites

module Test.Main where

import Prelude hiding (eq)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit (TestSuite)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

import Test.Cheerio as C
import Test.Cheerio.Static as CS

main :: Eff (avar :: AVAR, console :: CONSOLE, testOutput :: TESTOUTPUT) Unit
main = runTest suites

suites :: forall eff. TestSuite eff
suites = do
  C.suites
  CS.suites
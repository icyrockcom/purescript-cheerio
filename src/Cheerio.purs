module Cheerio where

import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Data.Maybe (Maybe(..))

foreign import data Cheerio :: Type

-- Attributes
foreign import attrImpl :: Fn2 String Cheerio String

attr :: String -> Cheerio -> String
attr = runFn2 attrImpl

foreign import hasClassImpl :: Fn2 String Cheerio Boolean

hasClass :: String -> Cheerio -> Boolean
hasClass = runFn2 hasClassImpl

-- Traversing
foreign import findImpl :: Fn2 String Cheerio Cheerio

find :: String -> Cheerio -> Cheerio
find = runFn2 findImpl

foreign import parent :: Cheerio -> Cheerio
foreign import next :: Cheerio -> Cheerio
foreign import prev :: Cheerio -> Cheerio
foreign import siblings :: Cheerio -> Cheerio
foreign import children :: Cheerio -> Cheerio
foreign import first :: Cheerio -> Cheerio
foreign import last :: Cheerio -> Cheerio

foreign import eqImpl :: Fn2 Int Cheerio Cheerio

eq :: Int -> Cheerio -> Cheerio
eq = runFn2 eqImpl

-- Rendering
foreign import htmlImpl :: forall a.
  Fn3 (Maybe a) (a -> Maybe a) Cheerio (Maybe String)

html :: Cheerio -> Maybe String
html = runFn3 htmlImpl Nothing Just

foreign import text :: Cheerio -> String

-- Miscellaneous
foreign import length :: Cheerio -> Int
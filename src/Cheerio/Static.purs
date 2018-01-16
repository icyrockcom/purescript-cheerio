module Cheerio.Static where

import Prelude
import Cheerio (Cheerio)
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Data.Maybe (Maybe(..))

foreign import data CheerioStatic :: Type

-- Loading
foreign import load :: String -> CheerioStatic

-- Selectors
foreign import selectImpl :: Fn2 String CheerioStatic Cheerio

select :: String -> CheerioStatic -> Cheerio
select = runFn2 selectImpl

foreign import selectDeepImpl :: Fn2 (Array String) CheerioStatic Cheerio

selectDeep :: Array String -> CheerioStatic -> Cheerio
selectDeep = runFn2 selectDeepImpl

-- Rendering
foreign import htmlImpl :: forall a.
  Fn3 (Maybe a) (a -> Maybe a) Cheerio (Maybe String)

html :: Cheerio -> Maybe String
html = runFn3 htmlImpl Nothing Just

-- Utilities
foreign import root :: CheerioStatic -> Cheerio

-- Convenience
loadRoot :: String -> Cheerio
loadRoot = load >>> root

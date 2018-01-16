module Basic where

import Prelude

import Cheerio (Cheerio, find, length)
import Cheerio.Static (loadRoot)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

htmlEx :: String
htmlEx = """
  <ul id="fruits">
    <li class="apple">Apple</li>
    <li class="orange">Orange</li>
    <li class="pear">Pear</li>
  </ul>
"""

root :: Cheerio
root = loadRoot htmlEx

example :: forall eff. Eff (console :: CONSOLE | eff) Unit
example =
  let fruitCount = find "#fruits" root # length
  in log $ "Number of fruits: " <> show fruitCount

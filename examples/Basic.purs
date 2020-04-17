module Basic where

import Prelude

import Cheerio (Cheerio, find, length)
import Cheerio.Static (loadRoot)
import Effect (Effect)
import Effect.Console (log)

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

main :: Effect Unit
main =
  let fruitCount = root # find "#fruits" # find "li" # length
  in log $ "Number of fruits: " <> show fruitCount

[![Build Status](https://travis-ci.org/icyrockcom/purescript-cheerio.svg?branch=master)](https://travis-ci.org/icyrockcom/purescript-cheerio)

## Description

Basic bindings for [cheerio](https://cheerio.js.org/). Only includes read-only functionality for now.

## Installation

Install [cheerio](https://www.npmjs.com/package/cheerio) dependency:

    $ npm install --save cheerio

Install this package:

* Using [bower](https://bower.io/):

      $ bower install --save purescript-cheerio

* Using [psc-package](https://github.com/purescript/psc-package):

      $ psc-package install cheerio

  You might need to set up a [custom package set](https://github.com/purescript/psc-package#add-a-package-to-the-package-set).

## Example

From [basic example](examples/Basic.purs).

Imports:

    import Cheerio (Cheerio, find, length)
    import Cheerio.Static (loadRoot)

Example html:

    htmlEx :: String
    htmlEx = """
      <ul id="fruits">
        <li class="apple">Apple</li>
        <li class="orange">Orange</li>
        <li class="pear">Pear</li>
      </ul>
    """

Load it and get the root element:

    root :: Cheerio
    root = loadRoot htmlEx

Use the query functions:

    let fruitCount = find "#fruits" root # length
    in log $ "Number of fruits: " <> show fruitCount

For more examples, please take a look at the [unit tests](test/Test/Main.purs). They cover most of the read-only cheerio functions.

## Issues or suggestions

If you run into any issues or have suggestions, please open an issue or submit a pull request. Both are welcome!

Be prepared to wait more than a couple of days for a response though :)

## License

MIT

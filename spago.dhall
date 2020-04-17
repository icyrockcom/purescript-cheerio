{ name = "purescript-cheerio"
, dependencies =
  [ "console"
  , "effect"
  , "functions"
  , "prelude"
  , "psci-support"
  , "test-unit"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

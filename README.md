# elm-review-missing-url-codec-getters

Provides [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) rules to REPLACEME.


## Provided rules

- [`NoMissing.UrlCodecGetters`](https://package.elm-lang.org/packages/Janiczek/elm-review-missing-url-codec-getters/1.0.0/NoMissing-UrlCodecGetters) - Reports REPLACEME.


## Configuration

```elm
module ReviewConfig exposing (config)

import NoMissing.UrlCodecGetters
import Review.Rule exposing (Rule)

config : List Rule
config =
    [ NoMissing.UrlCodecGetters.rule
    ]
```


## Try it out

You can try the example configuration above out by running the following command:

```bash
elm-review --template Janiczek/elm-review-missing-url-codec-getters/example
```

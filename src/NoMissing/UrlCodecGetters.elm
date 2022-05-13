module NoMissing.UrlCodecGetters exposing (rule)

{-|

@docs rule

-}

import Review.Rule as Rule exposing (Rule)


{-| Reports... REPLACEME

    config =
        [ NoMissing.UrlCodecGetters.rule
        ]


## Fail

    a =
        "REPLACEME example to replace"


## Success

    a =
        "REPLACEME example to replace"


## When (not) to enable this rule

This rule is useful when REPLACEME.
This rule is not useful when REPLACEME.


## Try it out

You can try this rule out by running the following command:

```bash
elm-review --template Janiczek/elm-review-missing-url-codec-getters/example --rules NoMissing.UrlCodecGetters
```

-}
rule : Rule
rule =
    Rule.newModuleRuleSchema "NoMissing.UrlCodecGetters" ()
        -- Add your visitors
        |> Rule.fromModuleRuleSchema

# elm-review-missing-url-codec-getters

Provides [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) rules to generate missing getters and predicates for [`Janiczek/elm-url-codec`](https://package.elm-lang.org/packages/Janiczek/elm-url-codec/latest/) module [`Url.Codec`](https://package.elm-lang.org/packages/Janiczek/elm-url-codec/latest/Url-Codec).

The `Url.Codec` module needs predicates and getters like

```elm
type Route
  = HomeRoute
  | UsersRoute Int (Maybe String)


isUsersRoute : Route -> Bool
isUsersRoute route =
  case route of
    UsersRoute _ _ ->
      True

    _ ->
      False



getUsersRoutePage : Route -> Maybe Int
getUsersRoutePage route =
  case route of
    UsersRoute page _ ->
      Just page

    _ ->
      Nothing


getUsersRouteSearchTerm : Route -> Maybe String
getUsersRouteSearchTerm route =
  case route of
    UsersRoute _ searchTerm ->
      searchTerm

    _ ->
      Nothing
```

and this package will autogenerate them for you.

## Provided rules

- [`NoMissing.UrlCodecGetters`](https://package.elm-lang.org/packages/Janiczek/elm-review-missing-url-codec-getters/1.0.0/NoMissing-UrlCodecGetters) - Autogenerates predicates and getters usable with [`Url.Codec`](https://package.elm-lang.org/packages/Janiczek/elm-url-codec/latest/Url-Codec).


## Configuration

```elm
module ReviewConfig exposing (config)

import NoMissing.UrlCodecGetters
import Review.Rule exposing (Rule)

config : List Rule
config =
    [ NoMissing.UrlCodecGetters.forTypes
        [ "Route.Route" ]
    ]
```

## Usage

The rule will generate the helpers (with names that won't be very nice) in a comment-delimited section under the given type:

```elm
module Route exposing (Route(..))

type Route
  = UsersRoute Int (Maybe String) 
  | UserRoute String (List Int)
```

will be transformed into

```elm
module Route exposing (Route(..))

type Route
  = UsersRoute Int (Maybe String) 
  | UserRoute String (List Int)


-- Auto generated Url.Codec helpers - START


isUsersRoute : Route -> Bool
isUsersRoute route =
  case route of
    UsersRoute _ _ ->
      True

    _ ->
      False


isUserRoute : Route -> Bool
isUserRoute route =
  case route of
    UserRoute _ _ ->
      True

    _ ->
      False


getUsersRouteInt : Route -> Maybe Int
getUsersRouteInt route =
  case route of
    UsersRoute int _ ->
      Just int

    _ ->
      Nothing


getUsersRouteString : Route -> Maybe String
getUsersRouteString route =
  case route of
    UsersRoute _ maybeString ->
      maybeString

    _ ->
      Nothing


getUserRouteString : Route -> Maybe String
getUserRouteString route =
  case route of
    UserRoute string _ ->
      Just string

    _ ->
      Nothing


getUserRouteInts : Route -> List Int
getUserRouteInts route =
  case route of
    UserRoute _ ints ->
      ints

    _ ->
      []


-- Auto generated Url.Codec helpers - END
```

The rule will automatically collapse multiple `Maybe`s into one, and return a `List` instead of `Maybe List`, since `[]` can be used instead of `Nothing`. This is OK and safe for usage with `Url.Codec`.

In case of multiple arguments of the same type in the same custom type constructor, the rule will number them.

---

After the rule is finished with generating these helpers, **you can freely rename them and change their implementation.**

> In later `elm-review` invocations, as the comment markers are found by the rule, it will simply check there is a correct number of getters for each costructor inside the comment-delimited area. But it will _not_ check the correctness of the implementation, nor whether all constructor fields are exposed through the getters.

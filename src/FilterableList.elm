import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String exposing (contains)

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { items : List String
  , searchText : String
  }

items =
  [ "apple"
  , "aardvark"
  , "charles"
  , "banana"
  , "devastating"
  , "deepholm"
  ]

model : Model
model =
  { items = items
  , searchText =  ""
  }

-- UPDATE

type Msg = Search String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Search text ->
      { model |
        searchText = text
      }

-- VIEW

view : Model -> Html Msg
view model =
  let
      filteredItems =
        List.filter (\item -> String.contains model.searchText item) model.items
  in
      div []
        [ input [ onInput Search, placeholder "Filter me!" ] [ text "" ]
        , itemList filteredItems
        ]

itemList items =
  ul []
    (List.map (\item -> li [] [ text item ]) items)


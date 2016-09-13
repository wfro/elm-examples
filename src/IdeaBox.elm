import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (placeholder, class, type')
import Html.Events exposing (onInput)

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- render a few mock ideas on the screen
-- add the form to add ideas
-- when the form is submitted, add the idea to the page
-- user can delete an idea

-- MODEL

type alias Idea =
  { id : Int
  , title : String
  , body : String
  , quality : String
  }

type alias Model =
  { ideas : List Idea
  , ideaTitle : String
  , ideaBody : String
  }

mockIdeas =
  [{ id = 1
  , title = "facebook for dogs"
  , body = "the next hottest thing in social networking"
  , quality = "swill"
  },
  { id = 1
  , title = "instagram for cats"
  , body = "the next next hottest thing in social networking"
  , quality = "swill"
  }]

model : Model
model =
  { ideas = mockIdeas
  , ideaTitle =  ""
  , ideaBody = ""
  }

-- UPDATE

type Msg
  = CreateIdea Idea
  | Title String
  | Body String

update : Msg -> Model -> Model
update msg model =
  case msg of
    CreateIdea idea ->
      model

    Title title ->
      { model | ideaTitle = title }

    Body body ->
      { model | ideaBody = body }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Idea Box! It's a Box of Ideas! Add yours below!" ]
    , ideaForm
    , div [ class "ideas" ]
        (List.map renderIdea model.ideas)
    ]

ideaForm : Html Msg
ideaForm =
  form []
    [ input [ type' "text", placeholder "Title", onInput Title ] []
    , input [ type' "text", placeholder "Body", onInput Body ] []
    , input [ type' "submit" ] []
    ]

renderIdea : Idea -> Html Msg
renderIdea idea =
  div [ class "idea" ]
    [ h2 [ class "idea-title" ] [ text idea.title ]
    , p [ class "idea-body" ]  [ text idea.body ]
    , p [ class "idea-quality" ]  [ text idea.quality ]
    ]


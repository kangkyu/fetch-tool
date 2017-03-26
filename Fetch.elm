module Fetch exposing (..)

import Html exposing (..)
import Html.Events exposing (onSubmit, onInput)
import Html.Attributes exposing (type_, value)


view model =
    div []
        [ form [ onSubmit ShowInput ]
            [ input
                [ type_ "text"
                , onInput Input
                , value model.name
                ]
                []
            , button [ type_ "submit" ] [ text "hello world" ]
            ]
        , p [] [ text model.showName ]
        ]


type Msg
    = ShowInput
    | Input String


update msg model =
    case msg of
        Input name ->
            { model | name = name }

        ShowInput ->
            { model | showName = model.name, name = "" }


model =
    { name = "", showName = "" }


type alias Model =
    { name : String, showName : String }


main =
    beginnerProgram { model = model, update = update, view = view }

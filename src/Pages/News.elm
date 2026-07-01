module Pages.News exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [ class "news-container" ] []

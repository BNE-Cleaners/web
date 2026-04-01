module Pages exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)

homePage: Model -> Html Msg
homePage model =
    div [class "hero"] [
         img [id "hero-image"
             ,src "./static/glass_clean.jpg"
             ,alt "Hero image"] []
        ]


newsPage: Model -> Html Msg
newsPage model = div [] []

aboutUsPage: Model -> Html Msg
aboutUsPage model = div [] []

-- Needs to be a form which takes User details.
-- Pop up alert() with functional form validation with text boxes
-- Need to validate the form on fields (Location, PostCode, Phone Number)
-- Full Name, Location, PostCode, Contact Phone Number, Additional Message (150 words max)
contactPage: Model -> Html Msg
contactPage model = div [] []

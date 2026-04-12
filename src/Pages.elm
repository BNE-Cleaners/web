module Pages exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)


homePage: Model -> Html Msg
homePage model = div [class "home-container"] [
  div [class "home-bubble"] [
    div [class "home-bubble-logo"] [
        text "X"
      ]
    , div [class "home-bubble-text"] [text "Police-Checked Cleaners"]
    , div [class "home-bubble-text"] [text "Selected for respectful in-home residential work, with trust and professionalism expected from the start."]
    ]
  , div [class "home-bubble"] [
    div [class "home-bubble-logo"] [
        text "X"
      ]
    , div [class "home-bubble-text"] [text "Defined Cleaning Scopes"]
    , div [class "home-bubble-text"] [text "A structured services approach that helps keep the scope clearer and the deliverfy more consistent."]
    ]
  , div [class "home-bubble"] [
    div [class "home-bubble-logo"] [
        text "X"
      ]
    , div [class "home-bubble-text"] [text "Easy Online Booking"]
    , div [class "home-bubble-text"] [text "Clear pricing, fast quoting, and a staightforward booking flow designed to make planning easier."]
    ]
  , div [class "home-bubble"] [
    div [class "home-bubble-logo"] [
        text "X"
      ]
    , div [class "home-bubble-text"] [text "Training Backed Delivery"]
    , div [class "home-bubble-text"] [text "Our service model is built around defined methods and expectations, not just individual habit or guesswork."]
    ]
  , div [class "home-bubble"] [
    div [class "home-bubble-logo"] [
        text "X"
      ]
    , div [class "home-bubble-text"] [text "Commercial Standards"]
    , div [class "home-bubble-text"] [text "Our scope always follow all conventions proposed by the Australian Government and according to community standards."]
    ]
  ]


newsPage: Model -> Html Msg
newsPage model = div [] []

aboutUsPage: Model -> Html Msg
aboutUsPage model = 
    div [] [ div [class "aboutus-container"][
          div [class "review-post"][
            img [id "profile-image"
            ,src "./static/demo_pfp.png"
            ,alt "profile image"][]
            ,div [ class "review-text" ][
              text "Caption text" ]],
              div[class "review-post"][
                img [id "profile-image"
                , src "./static/demo_pfp.png"
                , alt "profile image"][]
                , div [class "review-text"][
                   text "Caption text" ]]
              , div[class "review-post"][
                    img [id "profile-image"
                    ,src "./static/demo_pfp.png"
                    ,alt "profile image"][]
                    ,div[class "review-text"][
                      text "Caption text" ]] 
              , div[class "review-post"][
                        img [id "profile-image"
                        ,src "./static/demo_pfp.png"
                        ,alt "profile image"][]
                        ,div[class "review-text"][
                          text "Caption text" ]]]]


-- Needs to be a form which takes User details.
-- Pop up alert() with functional form validation with text boxes
-- Need to validate the form on fields (Location, PostCode, Phone Number)
-- Full Name, Location, PostCode, Contact Phone Number, Additional Message (150 words max)
contactPage: Model -> Html Msg
contactPage model = div [] []

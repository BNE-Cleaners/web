module Pages exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)

maintainancePage : Model -> Html Msg
maintainancePage model =
    div [class "maintainance-container"] [
         img [class "maintainance-logo"
             , src "./static/images/logo.png"
             ,alt "BNECLEANERS logo"] []
             ,div [class "maintainance-text"] [
                  div [class "maintainance-heading maintainance-heading1"]
                      [text "The site is currently down"]
                 ,div [class "maintainance-heading maintainance-heading2"]
                      [text "for maintainance."]
                 , div [class "maintainance-subheading maintainance-subheading1"] [
                       text "We apologize for any inconvenience."
                      ]
                 , div [class "maintainance-subheading maintainance-subheading2"] [
                       text "Please call or email to book a free quote."
             ]
                 ]
        , img [class "maintainance-plug"
             , src "./static/icons/maintainance-plug.svg"
              , alt "connection image"] []
        , div [class "maintainance-footer"] [
              div [class "maintainance-footer-spacer"] []
             , div  [class "maintainance-footer-content"] [
                   div [] [text "Reach us out at:"]
                  , div [class "maintainance-bubble"] [
                        img [class "maintainance-icon"
                            , src "./static/icons/phone.svg"
                            ,alt "Phone"] []
                       , text "(+61) 421 401 308"
                       ]
                  , div [class "maintainance-bubble"] [
                        img [class "maintainance-icon"
                            , src "./static/icons/mail.svg"
                            ,alt "Email"] []
                       , text "info@bnecleaners.com.au"]
                  ]
             ]
        ] 
        
homePage: Model -> Html Msg
homePage model =
    div [class "home-container"] [
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
            ,src "./static/images/demo_pfp.png"
            ,alt "profile image"][]
            ,div [ class "review-text" ][
              text "Caption text" ]],
              div[class "review-post"][
                img [id "profile-image"
                , src "./static/images/demo_pfp.png"
                , alt "profile image"][]
                , div [class "review-text"][
                   text "Caption text" ]]
              , div[class "review-post"][
                    img [id "profile-image"
                    ,src "./static/images/demo_pfp.png"
                    ,alt "profile image"][]
                    ,div[class "review-text"][
                      text "Caption text" ]] 
              , div[class "review-post"][
                        img [id "profile-image"
                        ,src "./static/images/demo_pfp.png"
                        ,alt "profile image"][]
                        ,div[class "review-text"][
                          text "Caption text" ]]]]


-- Needs to be a form which takes User details.
-- Pop up alert() with functional form validation with text boxes
-- Need to validate the form on fields (Location, PostCode, Phone Number)
-- Full Name, Location, PostCode, Contact Phone Number, Additional Message (150 words max)
contactPage: Model -> Html Msg
contactPage model = div [] []

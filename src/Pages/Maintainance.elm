module Pages.Maintainance exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [ class "maintainance-container" ]
        [ img
            [ class "maintainance-logo"
            , src "./static/images/logo.webp"
            , alt "BNECLEANERS logo"
            ]
            []
        , div [ class "maintainance-text" ]
            [ div [ class "maintainance-heading maintainance-heading1" ]
                [ text "The site is currently down" ]
            , div [ class "maintainance-heading maintainance-heading2" ]
                [ text "for maintainance." ]
            , div [ class "maintainance-subheading maintainance-subheading1" ]
                [ text "We apologize for any inconvenience."
                ]
            , div [ class "maintainance-subheading maintainance-subheading2" ]
                [ text "Please call or email to book a free quote."
                ]
            ]
        , img
            [ class "maintainance-plug"
            , src "./static/icons/maintainance-plug.svg"
            , alt "connection image"
            ]
            []
        , div [ class "maintainance-footer" ]
            [ div [ class "maintainance-footer-spacer" ] []
            , div [ class "maintainance-footer-content" ]
                [ div [] [ text "Reach us out at:" ]
                , div [ class "maintainance-bubble" ]
                    [ img
                        [ class "maintainance-icon"
                        , src "./static/icons/phone.svg"
                        , alt "Phone"
                        ]
                        []
                    , text "(+61) 421 401 308"
                    ]
                , div [ class "maintainance-bubble" ]
                    [ img
                        [ class "maintainance-icon"
                        , src "./static/icons/mail.svg"
                        , alt "Email"
                        ]
                        []
                    , text "bnecleaneraus@gmail.com"
                    ]
                ]
            ]
        ]

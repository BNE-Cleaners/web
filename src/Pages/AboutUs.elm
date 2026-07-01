module Pages.AboutUs exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [ class "aboutus-container" ]
        [ div [ class "about-logo" ]
            [ div [] [ text "BNE" ]
            , div [] [ text "CLEANERS" ]
            ]
        , div [ class "aboutus-row" ]
            [ div [ class "aboutus-icon" ] [ img [ src "./static/images/eye.jpg", alt "VISION" ] [] ]
            , div [ class "aboutus-items" ]
                [ div [ class "aboutus-title" ] [ text "Our Vision" ]
                , div [ class "aboutus-text" ]
                    [ text "To build a cleaning company that’s 100% worker-owned—where the people who do the work also own the business. We exist to make professional cleaning accessible to households and businesses across Australia, while ensuring workers are treated fairly and rewarded for the effort, skill, and care they bring to every job. From domestic homes to industrial sites, our goal is simple: deliver the best cleaning results, keep pricing transparent and competitive, and share the upside with the people who power the organisation."
                    ]
                ]
            ]
        , div [ class "aboutus-row" ]
            [ div [ class "aboutus-items" ]
                [ div [ class "aboutus-text" ]
                    [ div [ class "aboutus-title" ] [ text "Our Motto" ]
                    , text "Cleaned with pride. Owned by workers. Built for everyone."
                    ]
                ]
            , div [ class "aboutus-icon" ] [ img [ src "./static/images/motto.jpg", alt "MOTTO" ] [] ]
            ]
        , div [ class "aboutus-row" ]
            [ div [ class "aboutus-icon" ] [ img [ src "./static/images/team.jpg", alt "TEAM" ] [] ]
            , div [ class "aboutus-items" ]
                [ div [ class "aboutus-title" ] [ text "Our Team" ]
                , div [ class "aboutus-text" ]
                    [ text "Our team is made up only of workers who run the organisation and deliver the cleaning—no outsourcing, no subcontracting. That means consistent service, direct accountability, and experienced hands on every job. Our worker-managers also handle most quoting, setting prices that stay reasonable for consumers while protecting fair earnings for workers."
                    ]
                ]
            ]
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
                    , text "info@bnecleaners.com.au"
                    ]
                ]
            ]
        ]

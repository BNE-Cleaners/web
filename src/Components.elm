module Components exposing (..)

import Browser.Navigation exposing (pushUrl)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Task
import Types exposing (..)


routeToHref : Route -> String
routeToHref route =
    case route of
        Home ->
            "/"

        AboutUs ->
            "/aboutus"

        BookClean ->
            "/bookclean"

        -- News ->
        --     "/news"


        PrivacyPolicy -> "/privacypolicy"

        NotFound ->
            "/"


routeToString : Route -> String
routeToString route =
    case route of
        Home ->
            "home"

        AboutUs ->
            "aboutus"

        BookClean ->
            "bookclean"

        -- News ->
        --     "news"

        PrivacyPolicy -> "privacypolicy"

        NotFound ->
            "home"


sendMsg : msg -> Cmd msg
sendMsg msg =
    Task.succeed msg
        |> Task.perform identity


navbarLink : Model -> Route -> String -> Html Msg
navbarLink model route label =
    a
        [ href (routeToHref route)
        , classList
            [ ( "nav-item", True )
            , ( "nav-item-active", model.route == route )
            ]
        ]
        [ text label ]


navbar : Model -> Html Msg
navbar model =
    div [ class "header" ]
        [ div [ class "nav-logo" ]
            [ div [] [ text "BNE" ]
            , div [] [ text "CLEANERS" ]
            ]
        , div [ class "nav-items" ]
            [ navbarLink model Home "Home"
            , navbarLink model AboutUs "About Us"

            -- , navbarLink model news "News"
            ]
        , div [ class "nav-right" ] [ a [ href "mailto:info@bnecleaners.com.au" ] [ button [ id "book-a-clean-btn" ] [ text "Book a Clean" ] ] ]
        ]

viewPdf : String -> Html msg
viewPdf pdfUrl =
    div [ style "width" "100%"
        , style "height" "100vh"] [ Html.node "embed"
            [ src pdfUrl
            , attribute "type" "application/pdf"
            , style "width" "100%"
            , style "height" "100%"
            ] []]

footerLink : Model -> Route -> String -> Html Msg
footerLink model route label =
    a
        [ href (routeToHref route)
        , classList [ ( "footer-link", True ) ]
        ]
        [ text label ]


footerLinkExt : Model -> String -> String -> Html Msg
footerLinkExt model route label =
    a
        [ href route
        , classList [ ( "footer-link", True ) ]
        ]
        [ text label ]


footer : Model -> Html Msg
footer model =
    div [ class "footer" ]
        [ div [ class "footer-items" ]
            [ div [ class "footer-item" ]
                [ h1 [] [ text "Services" ]
                , div [ class "footer-links" ]
                    [ footerLink model NotFound "Regular Cleaning"
                    , footerLink model NotFound "Deep Cleaning"
                    , footerLink model NotFound "Inspection Cleaning"
                    , footerLink model NotFound "Bond Cleaning"
                    , footerLink model NotFound "Office Cleaning"
                    , footerLink model NotFound "Carpet Steam Cleaning"
                    ]
                ]
            , div [ class "footer-item" ]
                [ h1 [] [ text "Quick Links" ]
                , div [ class "footer-links" ]
                    [ footerLink model PrivacyPolicy "Privacy Policy"
                    , footerLink model NotFound "Terms Of Services"
                    , footerLink model NotFound "FAQ"
                    , footerLink model NotFound "About Us"
                    , footerLink model NotFound "Contact Us"
                    , footerLink model NotFound "Become A Partner"
                    ]
                ]
            , div [ class "footer-item" ]
                [ h1 [] [ text "Social Links" ]
                , div [ class "footer-links" ]
                    [ footerLinkExt model "https://facebook.com" "Facebook"
                    , footerLinkExt model "https://instagram.com" "Instagram"
                    , footerLinkExt model "mailto:info@bnecleaners.com.au" "Email"
                    , footerLinkExt model "https://x.com" "X (Formerly Twitter)"
                    ]
                ]
            ]
        , div [ class "footer-text" ]
            [ div [] [ text "Copyright Reserved 2026 ©" ]
            , div [] [ text "BNE Cleaners. All rights reserved." ]
            ]
        ]


hero : Model -> Html Msg
hero model =
    div [ class "hero" ]
        [ img
            [ id "hero-image"
            , src "./static/images/glass_clean.png"
            , alt "Hero image"
            ]
            []
        ]


card : String -> String -> String -> Maybe (List String) -> Maybe (List String) -> Html Msg
card title description tag_description extra_html_classes images =
    div
        [ classList
            (List.append
                [ ( "card-container", True ) ]
                (extra_html_classes
                    |> Maybe.map (List.map (\x -> ( x, True )))
                    |> Maybe.withDefault []
                )
            )
        ]
        [ div [ class "card-tag" ]
            [ div [ class "card-tag-dot" ] []
            , div [ class "card-tag-text" ]
                [ text
                    (String.concat
                        [ "Perfect for "
                        , tag_description
                        ]
                    )
                ]
            ]
        , div [ class "card-title" ] [ text title ]
        , div [ class "card-description" ] [ text description ]
        , div [ class "card-image-container" ]
            (images
                |> Maybe.map
                    (List.map
                        (\url -> img [ src url, alt url, class "card-image" ] [])
                    )
                |> Maybe.withDefault []
            )
        ]

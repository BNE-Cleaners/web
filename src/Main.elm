module Main exposing (..)

import Browser
import Html exposing (Html, h1, header, footer, button, div, text, a, img)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Pages exposing (homePage, aboutUsPage, newsPage)
import Types exposing (..)

main =
  Browser.sandbox { init = init, update = update, view = view }

init : Model
init = {page = Home}

update : Msg -> Model -> Model
update msg model =
  case msg of
    SwitchToPage new_page ->
      {model | page = new_page}

view : Model -> Html Msg
view model =
  div [class "body"] [ 
    header [class "header"]
    [
        div [id "nav-logo"] [
        div [] [text "BNE"]
        ,div [] [text "CLEANERS"]
        ],
        div [id "nav-items"] [
          button [onClick (SwitchToPage Home)
          ,(if model.page == Home then class "nav-item-active" else class "nav-item")] [text "Home"]
          ,button [onClick (SwitchToPage News)
          ,(if model.page == News then class "nav-item-active" else class "nav-item")] [text "News"]
          ,button [onClick (SwitchToPage AboutUs)
          ,(if model.page == AboutUs then class "nav-item-active" else class "nav-item")] [text "About Us"]
          ],
          div [id "nav-right"] [button [id "book-a-clean-btn"] [text "Book a Clean"]]]
          ,div [class "hero"] [
            img [id "hero-image"
            ,src "./static/glass_clean.jpg"
            ,alt "Hero image"] []
            ]
          ,(if model.page == Home then homePage model
          else if model.page == AboutUs then aboutUsPage model
          else if model.page == News then newsPage model
          else div [][])
          ,footer [class "footer"] [
            div [class "footer-items"] [
              div [class "footer-item"] [
                h1 [] [text "Services"]
                , div [class "footer-links"] [
                  a [href "#"] [text "Regular Cleaning"]
                  ,a [href "#"] [text "Deep Cleaning"]
                  ,a [href "#"] [text "Inspection Cleaning"]
                  ,a [href "#"] [text "Bond Cleaning"]
                  ,a [href "#"] [text "Office Cleaning"]
                  ,a [href "#"] [text "Carpet Steam Cleaning"]
                  ]
                ]
                ,div [class "footer-item"] [
                  h1 [] [text "Quick Links"]
                  , div [class "footer-links"] [
                    a [href "#"] [text "Privacy Policy"]
                    ,a [href "#"] [text "Terms Of Services"]
                    ,a [href "#"] [text "FAQ"]
                    ,a [href "#"] [text "About Us"]
                    ,a [href "#"] [text "Contact Us"]
                    ,a [href "#"] [text "Become A Partner"]
                    ]
                ]
              ]
            ,div [class "footer-text"] [
              div [] [text "Copyright Reserved 2026"]
              , div [] [text "BNE Cleaners. All rights reserved."]
              ]
            ]

        ]

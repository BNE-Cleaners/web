module Main exposing (..)

-- import Pages.Maintainance
-- import Pages.Services

import Browser
import Browser.Navigation as Nav
import Components exposing (footer, hero, navbar)
import Html exposing (div)
import Pages.AboutUs
import Pages.Home
import Pages.News
import Types exposing (..)
import Url
import Url.Parser


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url (parseRoute url)
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( { model | route = parseRoute url }, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


route : Url.Parser.Parser (Route -> a) a
route =
    Url.Parser.oneOf
        [ Url.Parser.map Home Url.Parser.top
        , Url.Parser.map News (Url.Parser.s "news")
        , Url.Parser.map AboutUs (Url.Parser.s "aboutus")
        ]


parseRoute : Url.Url -> Route
parseRoute url =
    case Url.Parser.parse route url of
        Just matchedRoute ->
            matchedRoute

        Nothing ->
            NotFound


view : Model -> Browser.Document Msg
view model =
    { title = "BNE Cleaners"
    , body =
        [ navbar model
        , hero model
        , case model.route of
            Home ->
                Pages.Home.view model

            AboutUs ->
                Pages.AboutUs.view model

            News ->
                Pages.News.view model

            NotFound ->
                div [] []
        , footer model
        ]
    }

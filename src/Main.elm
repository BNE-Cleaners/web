module Main exposing (..)

-- import Pages.Maintainance
-- import Pages.Services
-- import Pages.News

import Browser
import Browser.Navigation as Nav
import Components exposing (footer, hero, navbar)
import Html exposing (div)
import Pages.AboutUs
import Pages.BookForm
import Pages.Home
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
    ( Model key url (parseRoute url) "" "" "" General ""
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Name n ->
            ( { model | name = n }, Cmd.none )

        Email e ->
            ( { model | email = e }, Cmd.none )

        Phone p ->
            ( { model | phone = p }, Cmd.none )

        Cleaning t ->
            ( { model | cleaning = t }, Cmd.none )

        Message m ->
            ( { model | message = m }, Cmd.none )

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

        -- , Url.Parser.map News (Url.Parser.s "news")
        , Url.Parser.map PrivacyPolicy (Url.Parser.s "privacypolicy")
        , Url.Parser.map TermsofService (Url.Parser.s "termsofservice")
        , Url.Parser.map BookClean (Url.Parser.s "bookclean")
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
        , case model.route of
            Home ->
                hero model

            AboutUs ->
                div [] []

            BookClean ->
                div [] []

            -- News ->
            --     div [] []

            PrivacyPolicy -> div [] []

            TermsofService -> div [] []

            NotFound ->
                div [] []
        , case model.route of
            Home ->
                Pages.Home.view model

            AboutUs ->
                Pages.AboutUs.view model

            BookClean ->
                Pages.BookForm.view model

            -- News ->
            --     Pages.News.view model

            PrivacyPolicy ->
                (Components.viewPdf "./static/BNECleanersPrivacypolicy.pdf")

            TermsofService ->
                (Components.viewPdf "./static/TOS.pdf")
            

            NotFound ->
                div [] []
        , footer model
        ]
    }

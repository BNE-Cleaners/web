module Types exposing (..)

import Browser
import Browser.Navigation as Nav
import Url


type Route
    = Home
    | News
    | AboutUs
    | NotFound


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    }


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url

module Types exposing (..)

import Browser
import Browser.Navigation as Nav
import Url


type Route
    = Home
    | AboutUs
    | NotFound
    | BookClean



-- | News


type CleaningType
    = General
    | Lease
    | Commercial
    | Other


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    , name : String
    , email : String
    , phone : String
    , cleaning : CleaningType
    , message : String
    }


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | Name String
    | Email String
    | Phone String
    | Cleaning CleaningType
    | Message String

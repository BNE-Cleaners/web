module Types exposing (..)

type Pages
    = Home
    | News
    | AboutUs
      
type alias Model = {page: Pages}

type Msg
  = SwitchToPage Pages

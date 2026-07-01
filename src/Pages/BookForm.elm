module Pages.BookForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    div [ class "book-form-container" ]
        [ div [ class "form-item" ] [ viewInput "text" "Name*" model.name Name, viewNameValidation model.name ]
        , div [ class "form-item" ] [ viewInput "email" "Email*" model.email Email, viewMailValidation model.email ]
        , div [ class "form-item" ] [ viewInput "tel" "Phone*" model.phone Phone, viewPhoneValidation model.phone ]
        , div [ class "form-item form-add-notes" ] [ textarea [ placeholder "Additional Information (optional)", value model.message, onInput Message ] [] ]
        , div [ class "form-tip" ] [ text "* indicates the field is required." ]
        , button [ id "book-a-clean-btn" ] [ text "Send Form" ]
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewNameValidation : String -> Html msg
viewNameValidation name =
    if String.length name > 0 then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Enter your name!" ]


viewPhoneValidation : String -> Html msg
viewPhoneValidation phone =
    if String.length phone == 10 then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Enter valid phone number!" ]


viewMailValidation : String -> Html msg
viewMailValidation mail =
    if String.contains "@" mail && String.endsWith ".com" mail then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Enter valid email!" ]


viewValidation : Model -> Html msg
viewValidation model =
    if model.message == "" then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Passwords do not match!" ]

module Pages.Home exposing (..)

import Components exposing (card)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [ class "home-container" ]
        [ div [ class "home-catchline" ]
            [ div [ class "home-subcatchline" ]
                [ div [] [ text "BRISBANE TRUSTED CLEANING SERVICE" ]
                , div [] [ text "100% EMPLOYEE OWNED" ]
                ]
            ]
        , div [ class "services-title" ]
            [ text "Services we offer, tailored for your needs"
            ]
        , div [ class "services-cards" ]
            [ card "Move In / Move Out Cleaning" "Thorough and comprehensive cleaning of all rooms, including cabinets and cupboards. Detailed appliances cleaning, ensuring the house is spotless." "transition" Nothing (Just [ "./static/images/moveinmoveout_1.webp", "./static/images/moveinmoveout_2.webp" ])
            , card "Post Renovation Cleaning" "Thorough and detailed cleaning including paint removal, wall cleaning, floor polishing etc." "transition" Nothing (Just [ "./static/images/renovation_1.webp", "./static/images/renovation_2.webp" ])
            , card "Office Cleaning" "Regular and standardized cleaning of office rooms, cabins, meeting rooms. Also extends to ensure your everyday workplaces are kept clean." "reliability" Nothing (Just [ "./static/images/office_1.webp", "./static/images/office_2.webp" ])
            , card "Commercial / Restaurant Cleaning" "Regular and standardized cleaning of kitchen and dining rooms, cabins and storerooms. Also extends to ensure your everyday workplaces are kept clean." "reliability" Nothing (Just [ "./static/images/commercial_1.webp", "./static/images/restaurant_1.webp" ])
            ]
        ]

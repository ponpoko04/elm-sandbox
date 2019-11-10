import Html exposing (..)
import Html.Attributes exposing (class, type_)
import Html.Events exposing (onClick, onInput)

-- Model

type alias Model = {counter : Int, incrementBy : String}

model : Model
model = {counter = 0, incrementBy = ""}

-- Update

type Message = IncrementBy Int | SetIncrementBy String

update : Message -> Model -> Model
update message model =
    case message of
        IncrementBy howMuch -> {model | counter = model.counter + howMuch}
        SetIncrementBy value -> {model | incrementBy = value}

-- View

view : Model -> Html Message
view model =
    let
        numberInput = model.incrementBy
            |> String.toInt
            |> Result.withDefault 0
    in
      div [] [
          counterButton (IncrementBy numberInput) "Increment By",
          input [type_ "number", onInput SetIncrementBy] [],
          text (toString model.counter)
      ]

counterButton : Message -> String -> Html Message
counterButton message label =
    button [onClick message] [text label]

-- Main

main = beginnerProgram {model = model, update = update, view = view}

-- import Html exposing (..)
-- main = div [] [text "Hello world"]

-- import Html exposing (text)
-- main = text "Hello world"

-- import Html
-- main = Html.text "Hello world"

-- main = "Hello world"
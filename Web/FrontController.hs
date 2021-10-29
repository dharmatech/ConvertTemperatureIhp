module Web.FrontController where

import IHP.RouterPrelude

import Application.Helper.Controller
import IHP.ControllerPrelude

import IHP.ViewPrelude
import Generated.Types
import Application.Helper.View

data Temperature = Temperature { 
    id :: Int, 
    farenheit :: Float, 
    meta :: MetaBag 
} deriving (Show)

type instance GetModelName Temperature = "Temperature"

renderForm :: Temperature -> Html
renderForm temp = formFor' temp "/Temperature/Result" [hsx|
    {textField #farenheit}
|]

instance CanRoute TemperatureController where
    parseRoute' = do
        let form   = string "/Temperature/Form"   <* endOfInput >> pure FormAction
        let result = string "/Temperature/Result" <* endOfInput >> pure ResultAction
        form <|> result

instance HasPath TemperatureController where
    pathTo FormAction   = "/Temperature/Form"
    pathTo ResultAction = "/Temperature/Result"

data WebApplication = WebApplication deriving (Eq, Show)

data TemperatureController
    = FormAction
    | ResultAction
    deriving (Eq, Show, Data)

instance Controller TemperatureController where
   
    action FormAction = 

        let temp = Temperature { id = 0, farenheit = 100.0, meta = def }

        in
                
        respondHtml [hsx| {renderForm temp} |]

    action ResultAction = 
        let
            farenheit = IHP.ControllerPrelude.param @Float "farenheit"
            celsius = (farenheit - 32.0) * 5.0 / 9.0
        in
            respondHtml [hsx| 
                <p>Celsius: {celsius}</p>
            |]

instance FrontController WebApplication where
    controllers = 
        [ 
          parseRoute @TemperatureController 
        ]

instance InitControllerContext WebApplication where
    initContext = do
        initAutoRefresh

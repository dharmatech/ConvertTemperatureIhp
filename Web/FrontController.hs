module Web.FrontController where

import IHP.RouterPrelude

import Application.Helper.Controller
import IHP.ControllerPrelude

import IHP.ViewPrelude
import Generated.Types
import Application.Helper.View


instance AutoRoute TemperatureController 

data WebApplication = WebApplication deriving (Eq, Show)

data TemperatureController
    = FormAction
    | ResultAction
    deriving (Eq, Show, Data)

instance Controller TemperatureController where
   
    action FormAction = respondHtml [hsx|
        <form action={pathTo ResultAction} method="post">
            <label>Farenheit</label>
            <input type="text" name="farenheit"/>
        </form>
    |]

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

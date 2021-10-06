module Web.Controller.Temperature where

import Web.Controller.Prelude
import Web.View.Static.Temperature

instance Controller TemperatureController where
    action FormAction = render FormView

    action ResultAction = 
        let farenheit = param @Float "farenheit"
        in
        render (ResultView farenheit)

    
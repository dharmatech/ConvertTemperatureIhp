module Web.Controller.Temperature where

import Web.Controller.Prelude
import Web.View.Static.Temperature

instance Controller TemperatureController where
    -- action StartAction = renderPlain "abc"
    action StartAction = 
        
        let farenheit = param @Float "farenheit"

        in
        
        render (StartView farenheit)

    
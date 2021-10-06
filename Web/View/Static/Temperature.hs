module Web.View.Static.Temperature where

import Web.View.Prelude

data StartView = StartView { farenheit :: Float }

instance View StartView where
    html (StartView farenheit) = 

        let 
            
            celsius = (farenheit - 32.0) * 5.0 / 9.0

        in
        
        [hsx| 

        <p>Celsius: {celsius}</p>

    |]
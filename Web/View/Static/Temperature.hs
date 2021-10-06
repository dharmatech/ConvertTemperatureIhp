module Web.View.Static.Temperature where

import Web.View.Prelude


data FormView = FormView

instance View FormView where
    html FormView =
        [hsx|
        
            <form action="/Result" method="post">
                <label>Farenheit</label>
                <input type="text" name="farenheit"/>
            </form>            

        |]


data ResultView = ResultView { farenheit :: Float }

instance View ResultView where
    html (ResultView farenheit) = 
        let 
            celsius = (farenheit - 32.0) * 5.0 / 9.0
        in
        
        [hsx| 

            <p>Celsius: {celsius}</p>

        |]


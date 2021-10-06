module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         
         <form action="/Start" method="post">
            <label>Farenheit</label>
            <input type="text" name="farenheit"/>
         </form>
         
|]
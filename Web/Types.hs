module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController 
    = WelcomeAction
    | PostAction
    deriving (Eq, Show, Data)

data TemperatureController
    = StartAction
    deriving (Eq, Show, Data)


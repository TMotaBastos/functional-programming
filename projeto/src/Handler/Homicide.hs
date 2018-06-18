module Handler.Homicide where

import Import
    
getHomicideR :: Handler Value
getHomicideR = do
    homicides <- runDB $ selectList [HomicideDataVictimAge >=. 0] []
    -- requireJsonBody will parse the request body into the appropriate type, or return a 400 status code if the request JSON is invalid.
    -- (The ToJSON and FromJSON instances are derived in the config/models file).
    -- The YesodAuth instance in Foundation.hs defines the UserId to be the type used for authentication.
    returnJson homicides

getHomicideR2 :: Text -> Handler Value
getHomicideR2 state = do
    homicides <- runDB $ selectList [HomicideDataState ==. state] []
    returnJson homicides
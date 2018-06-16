{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
-- instance ToJSON (Entity HomicideData) where
--     toJSON (Entity hdId hd) = object
--     ["id" .= (String $ toPathPiece hdId)
--         ,"state" .= state hd
--         ,"year" .= year hd
--         ,"month" .= month hd
--         ,"crimeSolved" .= crimeSolved hd
--         ,"victimSex" .= victimSex hd
--         ,"victimAge" .= victimAge hd
--         ,"victimRace" .= victimRace hd
--         ,"perpetratorSex" .= perpetratorSex hd
--         ,"perpetratorAge" .= perpetratorAge hd
--         ,"perpetratorRace" .= perpetratorRace hd
--         ,"relationship" .= relationship hd
--         ,"weapon" .= weapon hd
--         ,"victimCount" .= victimCount hd
--     ]

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")
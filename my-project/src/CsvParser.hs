{-# LANGUAGE OverloadedStrings #-}
module CsvParser where

import Control.Applicative
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V


data HomicideDataCsv = HomicideDataCsv 
    {state :: !String
    ,year ::  !Int
    ,month :: !Int
    ,crimeSolved :: !String
    ,victimSex :: !String
    ,victimAge :: !Int
    ,victimRace :: !String
    ,perpetratorSex  :: !String
    ,perpetratorAge :: !String
    ,perpetratorRace :: !String
    ,relationship :: !String
    ,weapon :: !String
    ,victimCount :: !Int
    }

data Person = Person 
    { name :: String
    , age ::  Int
    }

-- State,Year,Month,Crime Solved,Victim Sex,Victim Age,Victim Race,Perpetrator Sex,Perpetrator Age,Perpetrator Race,Relationship,Weapon,Victim Count

instance FromNamedRecord HomicideDataCsv where
    parseNamedRecord r = HomicideDataCsv <$> r .: "state" <*> r .: "year" <*> r .: "month" <*> r .: "crimeSolved" <*> r .: "victimSex" <*> r .: "victimAge" <*> r .: "victimRace" <*> r .: "perpetratorSex" <*> r .: "perpetratorAge" <*> r .: "perpetratorRace" <*> r .: "relationship" <*> r .: "weapon" <*> r .: "victimCount"

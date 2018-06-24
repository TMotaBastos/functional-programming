{-# LANGUAGE OverloadedStrings #-}
module CsvParser where

import Control.Applicative
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
import Database.PostgreSQL.Simple


data HomicideDataCsv = HomicideDataCsv 
    {state :: !String
    ,year ::  !Int
    ,month :: !String
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
    }deriving (Show)

data Person = Person 
    { name :: String
    , age ::  Int
    }

convertToBool :: String -> Bool
convertToBool "Yes" = True
convertToBool "No" = False

-- State,Year,Month,Crime Solved,Victim Sex,Victim Age,Victim Race,Perpetrator Sex,Perpetrator Age,Perpetrator Race,Relationship,Weapon,Victim Count
conn_string = "host='localhost' port=5432 dbname='postgres' user='postgres' password='root'"
-- execute db_connection "INSERT INTO public.homicide_data (state, year, month, crime_solved, victim_sex, victim_age, victim_race, perpetrator_sex, perpetrator_age, perpetrator_race, relationship, victim_count, weapon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"  (state hd :: String, year hd, month hd, crimeSolved hd, victimSex hd, victimAge hd, victimRace hd, perpetratorSex hd, perpetratorAge hd, perpetratorRace hd, relationship hd, victimCount hd, weapon hd)
-- insertHomicide :: IO Connection 
-- insertHomicide connection hd = execute conn "INSERT INTO public.homicide_data (id, state, year, month, crime_solved, victim_sex, victim_age, victim_race, perpetrator_sex, perpetrator_age, perpetrator_race, relationship, victim_count, weapon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"  (state hd, year hd, month hd, crimeSolved hd, victimSex hd, victimAge hd, victimRace hd, perpetratorSex hd, perpetratorAge hd, perpetratorRace hd, relationship hd, weapon hd, victimCount hd)

instance FromNamedRecord HomicideDataCsv where
    parseNamedRecord r = HomicideDataCsv <$> r .: "State" <*> r .: "Year" <*> r .: "Month" <*> r .: "Crime Solved" <*> r .: "Victim Sex" <*> r .: "Victim Age" <*> r .: "Victim Race" <*> r .: "Perpetrator Sex" <*> r .: "Perpetrator Age" <*> r .: "Perpetrator Race" <*> r .: "Relationship" <*> r .: "Weapon" <*> r .: "Victim Count"

-- instance FromRow HomicideDataCsv where
--     fromRow = HomicideDataCsv <$> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field

getHomicideData = do
                db_connection <- connectPostgreSQL conn_string
                csvData <- BL.readFile "database2.csv"
                case decodeByName csvData of
                    Left err -> putStrLn err
                    Right (_, v) -> V.forM_ v $ \ hd ->
                        -- sql_state <- state hd
                        -- sql_year <- year hd
                        -- sql_month <- month hd
                        -- sql_crime_solved <- crimeSolved hd
                        -- sql_victim_sex <- victimSex hd
                        -- sql_victim_age <- victimAge hd
                        -- sql_victim_race <- victimRace hd
                        -- sql_perpetrator_sex <- perpetratorSex hd
                        -- sql_pepertrator_age <- perpetratorAge hd 
                        -- sql_perpetrator_race <- perpetratorRace hd
                        -- sql_relationship <- relationship hd
                        -- sql_weapon <- weapon hd
                        -- sql_victim_count <- victimCount hd
                        -- execute db_connection "INSERT INTO public.homicide_data (state, year, month, crime_solved, victim_sex, victim_age, victim_race, perpetrator_sex, perpetrator_age, perpetrator_race, relationship, victim_count, weapon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"  (sql_state :: String, sql_year :: Int, sql_month :: String, (convertToBool sql_crime_solved) :: Bool , sql_victim_sex :: String , sql_victim_age :: Int, sql_victim_race :: String, sql_perpetrator_sex :: String, sql_pepertrator_age :: String, sql_pepertrator_age :: String, sql_relationship :: String, sql_victim_count :: Int, sql_weapon :: String)
                        execute db_connection "INSERT INTO public.homicide_data (state, year, month, crime_solved, victim_sex, victim_age, victim_race, perpetrator_sex, perpetrator_age, perpetrator_race, relationship, victim_count, weapon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"  $ ((state hd) :: String, (year hd) :: Int, (month hd):: String, (convertToBool (crimeSolved hd)) :: Bool, (victimSex hd) :: String, (victimAge hd) :: Int, (victimRace hd) :: String) :. ((perpetratorSex hd) :: String, (perpetratorAge hd) :: String, (perpetratorRace hd):: String, (relationship hd) :: String, (victimCount hd) :: Int, (weapon hd) :: String)


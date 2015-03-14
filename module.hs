module SomeFunction
( Shape               -- type will be available just in used methods
, Shape(..)           -- allow all data constructors
, Shape(Circle)       -- just Circle constructor
, digitSum            -- public methods
, stringToDigit
) where

import Data.Char                  -- import all methods
import qualified Data.Map as Map  -- can calling method with new name `Map`

import qualified Data.Map         -- can calling method just with module name
import Data.List (nub, sort)      -- just nub and sort function
import Data.List hiding (nub)     -- just exclude nub

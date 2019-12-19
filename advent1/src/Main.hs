module Main where

fuelNeeded :: Int -> Int
fuelNeeded mass = mass `div` 3 - 2

totalNeeded :: Int -> Int
totalNeeded mass = if fuel <= 0
                   then 0
                   else fuel + totalNeeded fuel
  where fuel = fuelNeeded mass

main :: IO ()
main = interact (show . sum . map (totalNeeded . read) . lines)

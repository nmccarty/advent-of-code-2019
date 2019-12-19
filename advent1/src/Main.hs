module Main where

fuelNeeded :: Int -> Int
fuelNeeded mass = mass `div` 3 - 2

main :: IO ()
main = interact (show . sum . map (fuelNeeded . read) . lines)

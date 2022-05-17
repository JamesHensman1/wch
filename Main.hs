module Main where

import System.Environment (getArgs)
import System.IO (hPutStrLn, stderr)

main :: IO ()
main = do
  args <- getArgs
  let l = if length args > 0 then Just (length args) else Nothing
  let f = l >> Just (head args)
  wc f 
    where
      wc Nothing = hPutStrLn stderr "wch: No file given wch [file name]"
      wc (Just fname) = (readFile fname) >>= ( putStrLn . (++ " " ++ fname) . (concatMap ( (" " ++) . show . length) ) . (\l -> [map (\c -> [c]) (filter (=='\n') l), words l , map (\c -> [c]) l ]))
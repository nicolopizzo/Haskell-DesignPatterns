import Strategy
import Factory
import Data.Char
import System.IO

main :: IO ()
main = do
    mode <- prompt "What kind of serialization do you want?[Json/plain] "
    let s = serializer mode
        e1 = Employee "Mario" "Rossi"
        e2 = Employee "Luca" "Bianchi"
        t = TeamManager "Luca" "Rossi" "Gruppo 1" [e1, e2]
    putStrLn $ s t


serializer :: [Char] -> Employee -> String
serializer s = case map toLower s of
    "plain" -> repr plain
    "json" -> repr toJSON

prompt :: String -> IO String
prompt s = do
    putStr s
    hFlush stdout
    getLine

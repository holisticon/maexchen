module SimpleBot (
    handler
  , register

  , replyFor -- exposure for testing
  ) where

import Network.Socket hiding (send, recvFrom)
import Network.Socket.ByteString (send, recvFrom)

import Command
import MessageParser

import Data.List (isPrefixOf)
import qualified Data.ByteString.Char8 as BSC
import Data.Char (digitToInt)
import qualified Data.ByteString as BS

import Command
import MessageParser

handler :: Socket -> IO ()
handler sock = do
    (msg,_) <- recvFrom sock 1024
    -- putStrLn $ "< " ++ (BSC.unpack msg)
    print $ parseCommand msg
    let response = replyFor $ parseCommand msg
    BSC.putStrLn response
    res <- if (BS.null response) then return 0 else send sock response
    handler sock

register :: String -> BS.ByteString
register teamname = BSC.pack $ "REGISTER;" ++ teamname

replyFor :: Command -> BS.ByteString
replyFor (RoundStarting token) = BSC.pack $ "JOIN;" ++ token
replyFor (YourTurn token)      = BSC.pack $ "SEE;" ++ token
replyFor (Unknown _)           = BS.empty

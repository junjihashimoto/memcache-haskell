-- Copyright (c) 2013, GREE, Inc. All rights reserved.
-- authors: Kiyoshi Ikehara <kiyoshi.ikehara@gree.net>

{- | Class definitions

This module is mainly for internal use.

-}
module Network.Memcache.Class (Message(..)) where

import Control.Monad.IO.Class
import System.IO
import qualified Data.ByteString.Char8 as BS

class Message a where
  -- parse message header
  parseHeader :: BS.ByteString -> Maybe a

  -- convert a message to chunks
  toChunks :: a -> [BS.ByteString]

  -- receive content of a message after receiving its header
  recvContent :: (MonadIO m) => Handle -> a -> m (Maybe a)

  -- no content (default impl.)
  recvContent _h msg = return $ Just msg



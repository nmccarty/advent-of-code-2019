{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_advent1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/bin"
libdir     = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/lib/x86_64-linux-ghc-8.6.5/advent1-0.1.0.0-54xZDkcgZFB6g2ZLpPShJe-advent1"
dynlibdir  = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/share/x86_64-linux-ghc-8.6.5/advent1-0.1.0.0"
libexecdir = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/libexec/x86_64-linux-ghc-8.6.5/advent1-0.1.0.0"
sysconfdir = "/home/MCCARTY/nathan/Projects/advent/advent1/.stack-work/install/x86_64-linux-tinfo6/858ac86c186937301a113c1d8d86efaed519a2bf264feff54f7c8cc72aa8af73/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "advent1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "advent1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "advent1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "advent1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "advent1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "advent1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

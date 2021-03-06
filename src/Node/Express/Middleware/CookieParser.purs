module Node.Express.Middleware.CookieParser
  ( cookieParser
  ) where

import Control.Monad.Eff.Class (liftEff)
import Data.Function (($))
import Data.Function.Uncurried (Fn3, runFn3)
import Data.Unit (Unit)
import Node.Express.Handler (Handler, HandlerM(..))
import Node.Express.Types (Request, Response, ExpressM)

foreign import _cookieParser :: forall eff. Fn3 Request Response (ExpressM eff Unit) (ExpressM eff Unit)

-- | Handler that parses cookies using 'cookie-parser' middleware.
cookieParser :: forall eff. Handler eff
cookieParser = HandlerM $
  \req res nxt -> liftEff $ runFn3 _cookieParser req res nxt

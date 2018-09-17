module Main where

import Refined
import Data.Typeable (Typeable, typeOf)
import Control.Monad (unless)
import Data.Singletons.Prelude hiding (Not, Or, Elem)
import Data.List (elem)
import Numeric.Natural (Natural)

data Elem (x :: [a]) deriving (Typeable)

instance forall a b (x :: [a]).
  ( Demote a ~ b -- Equality constraint
  , SingI x      -- Implicit sing parameter
  , SingKind a   -- For sing type to base type
  , Typeable a   -- Required by Refined
  , Typeable x   -- Required by Refined
  , Eq b         -- For membership comparison
  ) => Predicate (Elem x) b where
  validate p v = unless (elem v $ fromSing (sing :: Sing x)) $
    throwRefineOtherException (typeOf p) "Elem is not in list"

type MyNum = Refined (Not (Elem '[1, 3, 5])) Natural

main = print (refine 3 :: Either RefineException MyNum)

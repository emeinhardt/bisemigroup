{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.Binoid
  ( Binoid (unit)

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  , Bimonoid ( zero
             , one
             )
  ) where

import Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )
  )
import Data.Bimonoid
  ( Bimonoid ( zero
             , one
             )
  )



{- | A bimonoid @n@ where the additive and multiplicative identity
coincide is a /binoid/.

See e.g.

 - Gazdag & Nemeth 2011, "A Kleene theorem for bisemigroup and binoid languages".
 - Hashiguchi et al 2003, "Regular binoid expressions and regular binoid languages".

An example of a binoid more familiar to typed functional programming are Mokhov's
/united monoids/. See "Data.United" or the @algebraic-graphs@ package. -}
class (Bimonoid n) ⇒ Binoid n where

  -- | The default implementation is @unit ≝ zero@.
  unit ∷ n
  unit = zero

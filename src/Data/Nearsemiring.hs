{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.Nearsemiring
  ( LeftNearsemiring
  , RightNearsemiring

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  , LeftDistributiveProduct
  , RightDistributiveProduct
  , Bimonoid ( zero
             , one
             )
  , LeftAbsorbingProduct ( absorbl )
  , RightAbsorbingProduct ( absorbr )
  ) where

import Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )
  , LeftDistributiveProduct
  , RightDistributiveProduct
  )
import Data.Bimonoid
  ( Bimonoid ( zero
             , one
             )
  , LeftAbsorbingProduct ( absorbl )
  , RightAbsorbingProduct ( absorbr )
  )


{- | A left nearsemiring is

- A bimonoid where addition is not necessarily commutative, multiplication distributes over
   multiplication from the left, and the additive identity is the multiplicative absorbing
   element from the left.

Note that 'LeftAbsorbingProduct' does not enforce that the absorbing element is the additive
identity, but that is the default definition. -}
class ( Bimonoid s
      , LeftDistributiveProduct s
      , LeftAbsorbingProduct s
      ) ⇒ LeftNearsemiring s


{- | A right nearsemiring is

- A bimonoid where addition is not necessarily commutative, multiplication distributes over
   multiplication from the right, and the additive identity is the multiplicative absorbing
   element from the right.

Note that 'RightAbsorbingProduct' does not enforce that the absorbing element is the additive
identity, but that is the default definition. -}
class ( Bimonoid s
      , RightDistributiveProduct s
      , RightAbsorbingProduct s
      ) ⇒ RightNearsemiring s

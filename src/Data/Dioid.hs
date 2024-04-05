{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.Dioid
  ( LeftDioid
  , RightDioid

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  , Bimonoid ( zero
             , one
             )
  , LeftAbsorbingProduct ( absorbl )
  , RightAbsorbingProduct ( absorbr )
  , LeftAbsorbingSum ( absorbl' )
  , RightAbsorbingSum ( absorbr' )
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
  , LeftAbsorbingProduct ( absorbl )
  , RightAbsorbingProduct ( absorbr )
  , LeftAbsorbingSum ( absorbl' )
  , RightAbsorbingSum ( absorbr' )
  )


{- | A (left) dioid over a carrier type @d@ consists of two monoid structures —
addition and multiplication — where

1. The additive identity /0/ is a (left) absorbing element with respect to
   multiplication.

2. The multiplicative identity /1/ is a (left) absorbing element with respect to
   addition.
-}
class ( Bimonoid d
      , LeftAbsorbingProduct d
      , LeftAbsorbingSum d
      )
  ⇒ LeftDioid d where


class ( Bimonoid d
      , RightAbsorbingProduct d
      , RightAbsorbingSum d
      )
  ⇒ RightDioid d where

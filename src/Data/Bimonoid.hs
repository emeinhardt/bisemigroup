{-# OPTIONS_HADDOCK show-extensions #-}
{-# LANGUAGE DefaultSignatures #-}
-- |

module Data.Bimonoid
  ( Bimonoid ( zero
             , one
             )


    -- * Absorption properties
  , LeftAbsorbingProduct ( absorbl )
  , RightAbsorbingProduct ( absorbr )
  , AbsorbingProduct ( absorb )
  , LeftAbsorbingSum ( absorbl' )
  , RightAbsorbingSum ( absorbr' )
  , AbsorbingSum ( absorb' )

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  ) where

import Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )
  )



{- | A bimonoid over a carrier @m@ consists of two monoid structures
over @m@.

No other laws are required to hold.

See e.g.

 - Gazdag & Nemeth 2011, "A Kleene theorem for bisemigroup and binoid languages".
 - Hashiguchi et al 2003, "Regular binoid expressions and regular binoid languages".
-}
class (Bisemigroup m) ⇒ Bimonoid m where
  zero ∷ m
  one  ∷ m


{- | A bisemigroup where there is a distinguished element @z@ that absorbs
(annihilates) all other elements to its right in multiplication is a
/left absorbing element/:

> z * b = z

The default for @absorbl@ (when @b@ is a bimonoid) is 'zero'. -}
class (Bisemigroup b) ⇒ LeftAbsorbingProduct b where
  absorbl ∷ b

  default absorbl ∷ (Bimonoid b) ⇒ b
  absorbl = zero


{- | A bisemigroup where there is a distinguished element @z@ that absorbs
(annihilates) all other elements to its left in multiplication is a
/right absorbing element/:

> b * z = z

The default for @absorbr@ (when @b@ is a bimonoid) is 'zero'. -}
class (Bisemigroup b) ⇒ RightAbsorbingProduct b where
  absorbr ∷ b

  default absorbr ∷ (Bimonoid b) ⇒ b
  absorbr = zero


class ( LeftAbsorbingProduct b
      , RightAbsorbingProduct b
      ) ⇒ AbsorbingProduct b where

  -- | Default definition: @absorb ≝ absorbl@.
  absorb ∷ b
  absorb = absorbl




{- | A bisemigroup where there is a distinguished element @u@ that absorbs
(annihilates) all other elements to its right in addition is a
/left absorbing element/:

> z * b = z

The default for @absorbl'@ (when @b@ is a bimonoid) is 'one'. -}
class (Bisemigroup b) ⇒ LeftAbsorbingSum b where
  absorbl' ∷ b

  default absorbl' ∷ (Bimonoid b) ⇒ b
  absorbl' = one


{- | A bisemigroup where there is a distinguished element @u@ that absorbs
(annihilates) all other elements to its left in addition is a
/right absorbing element/:

> b * z = z

The default for @absorbr'@ (when @b@ is a bimonoid) is 'one'. -}
class (Bisemigroup b) ⇒ RightAbsorbingSum b where
  absorbr' ∷ b

  default absorbr' ∷ (Bimonoid b) ⇒ b
  absorbr' = one


class ( LeftAbsorbingSum b
      , RightAbsorbingSum b
      ) ⇒ AbsorbingSum b where

  -- | Default definition: @absorb' ≝ absorbl'@.
  absorb' ∷ b
  absorb' = absorbl'

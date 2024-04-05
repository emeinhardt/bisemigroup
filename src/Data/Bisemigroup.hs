{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )

    -- * Distributive properties
  , LeftDistributiveSum
  , RightDistributiveSum
  , DistributiveSum
  , LeftDistributiveProduct
  , RightDistributiveProduct
  , DistributiveProduct

    -- * Commutative properties
  , CommutativeSum
  , CommutativeProduct

    -- * Idempotence properties
  , IdempotentSum
  , IdempotentProduct
  ) where

{- | A bisemigroup consists simply of a carrier type @b@
and two (not necessarily distinct) semigroup operations
over @b@.

No other laws are required.

See e.g.

 - Gazdag & Nemeth 2011, "A Kleene theorem for bisemigroup and binoid languages".
 - Hashiguchi et al 2003, "Regular binoid expressions and regular binoid languages".
-}
class Bisemigroup b where

  infixl 6 <+>
  (<+>) ∷ b → b → b

  infixl 7 <.>
  (<.>) ∷ b → b → b



{- | A bisemigroup is a lawful instance of this iff addition
distributes over multiplication from the left:

> a + (b * c) ≡ (a + b) * (a + c)
-}
class (Bisemigroup b) ⇒ LeftDistributiveSum b


{- | A bisemigroup is a lawful instance of this iff addition
distributes over multiplication from the right:

> (b * c) + a ≡ (b + a) * (c + a)
-}
class (Bisemigroup b) ⇒ RightDistributiveSum b


class (LeftDistributiveSum b, RightDistributiveSum b) ⇒ DistributiveSum b



{- | A bisemigroup is a lawful instance of this iff multiplication
distributes over addition from the left:

> a * (b + c) ≡ (a * b) + (a * c)
-}
class (Bisemigroup b) ⇒ LeftDistributiveProduct b


{- | A bisemigroup is a lawful instance of this iff multiplication
distributes over addition from the right:

> (b + c) * a ≡ (b * a) + (c * a)
-}
class (Bisemigroup b) ⇒ RightDistributiveProduct b


class (LeftDistributiveProduct b, RightDistributiveProduct b) ⇒ DistributiveProduct b



{- | A bisemigroup where addition is a commutative monoid. -}
class (Bisemigroup b) ⇒ CommutativeSum b


{- | A bisemigroup where multiplication is a commutative monoid. -}
class (Bisemigroup b) ⇒ CommutativeProduct b



{- | A bisemigroup where addition is idempotent:

> a + a ≡ a
-}
class (Bisemigroup b) ⇒ IdempotentSum b


{- | A bisemigroup where multiplication is idempotent:

> a * a ≡ a
-}
class (Bisemigroup b) ⇒ IdempotentProduct b

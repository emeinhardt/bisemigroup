{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.Semiring
  ( Presemiring
  , Semiring
  , IdempotentSemiring
  , StarSemiring ( star )
  , Kleene

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  , CommutativeSum
  , DistributiveProduct
  , IdempotentSum
  , Bimonoid ( zero
             , one
             )
  , AbsorbingProduct ( absorb )
  ) where

import Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )
  , CommutativeSum
  , DistributiveProduct
  , IdempotentSum
  )
import Data.Bimonoid
  ( Bimonoid ( zero
             , one
             )
  , AbsorbingProduct ( absorb )
  )


{- | A presemiring is a bimonoid where addition is commutative and multiplication
distributes over multiplication from both sides.

See
[Khamis et al. 2024, "Convergence of Datalog over (Pre-)Semirings"](https://arxiv.org/abs/2105.14435).
-}
class ( Bimonoid s
      , CommutativeSum s
      , DistributiveProduct s
      ) ⇒ Presemiring s


{- | A semiring is equivalently

1. A presemiring where the multiplicative two-sided absorbing element is the
   additive identity.

2. A nearsemiring where addition is commutaitve and one-sided properties (multiplicative
   distribution and the multiplicative absorbing element) become two-sided.

Note that 'AbsorbingProduct' does not enforce that the absorbing element is the additive
identity, but that is the default definition. -}
class ( Presemiring s
      , AbsorbingProduct s
      ) ⇒ Semiring s


class (Semiring s, IdempotentSum s) ⇒ IdempotentSemiring s


{- | A star semiring has a unary star operator ("Kleene star") obeying the law:

> star s ≡ one + (s * star s) ≡ one + ((star s) * s)
-}
class (Semiring s) ⇒ StarSemiring s where
  star ∷ s → s


{- | A Kleene algebra is an additively idempotent star semiring where the
following properties hold:

> (one + (k        * star k)) + star k ≡ star k
> (one + ((star k) *      k)) + star k ≡ star k
> (a * b) + b ≡ b `implies` ((star a) *      b) + b ≡ b
> (b * a) + b ≡ b `implies` (b        * star a) + b ≡ b
-}
class (IdempotentSemiring k, StarSemiring k) ⇒ Kleene k

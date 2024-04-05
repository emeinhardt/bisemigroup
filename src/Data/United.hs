{-# OPTIONS_HADDOCK show-extensions #-}
-- |

module Data.United
  ( United

    -- * Re-exports
  , Bisemigroup ( (<+>)
                , (<.>)
                )
  , Bimonoid ( zero
             , one
             )
  , Binoid (unit)
  , CommutativeSum
  , DistributiveProduct
  , IdempotentSum
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
  )

import Data.Binoid
  ( Binoid (unit)
  )






{- | A binoid @n@ where addition is commutative and multiplication distributes
over addition is a /pair of united monoids/.

Properties:

 - Addition defines a commutative idempotent monoid (bounded semilattice).
 - Containment laws:

> a * b ≡ (a * b) + a ≡ (a * b) + b ≡ (a * b) + a + b

See [Mokhov 2022](https://arxiv.org/abs/2202.09230).
-}
class ( Binoid n
      , CommutativeSum n
      , DistributiveProduct n
      , IdempotentSum n
      ) ⇒ United n

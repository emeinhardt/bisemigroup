{-# OPTIONS_HADDOCK show-extensions #-}
{-# LANGUAGE UndecidableInstances #-}
{- | This module provides an orphan 'Num' instance for 'Bimonoid' instances:

- 'fromInteger' defaults to 'zero' for elements that are not additive or
  multiplicative identity elements.
- 'signum' is 'zero' for 'zero' and otherwise returns 'one'.
- 'abs' and 'negate' are both defined as 'id'.
-}

module Data.Bimonoid.Syntax
  (
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



fromIntegerZeroDefault ∷ ∀ b. (Bimonoid b) ⇒ Integer → b
fromIntegerZeroDefault =
  let zero_ = (0 ∷ Integer)
      one_  = (1 ∷ Integer)
      f n
        | n == zero_ = zero
        | n == one_  = one
        | otherwise  = zero
  in f

-- fromIntegerOneDefault ∷ ∀ b. (Bimonoid b) ⇒ Integer → b
-- fromIntegerOneDefault =
--   let zero_ = (0 ∷ Integer)
--       one_  = (1 ∷ Integer)
--       f n
--         | n == zero_ = zero
--         | n == one_  = one
--         | otherwise  = one
--   in f



instance (Eq b, Bimonoid b) ⇒ Num b where
  fromInteger = fromIntegerZeroDefault

  (+) = (<+>)

  (*) = (<.>)

  signum b
    | b == zero = zero
    | otherwise = one

  abs = id

  negate = id

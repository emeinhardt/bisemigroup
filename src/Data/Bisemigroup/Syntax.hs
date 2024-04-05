{-# OPTIONS_HADDOCK show-extensions #-}
{-# LANGUAGE UndecidableInstances #-}
{- | This module provides unicode synonyms for bisemigroup operators.
-}

module Data.Bisemigroup.Syntax
  ( (⋅)
  , (✕)
  , (⊗)
  , (⋄)
  , (⊕)
  ) where

import Data.Bisemigroup
  ( Bisemigroup ( (<+>)
                , (<.>)
                )
  )


infixl 7 ⋅
(⋅) ∷ Bisemigroup b ⇒ b → b → b
(⋅) = (<.>)


infixl 7 ✕
(✕) ∷ Bisemigroup b ⇒ b → b → b
(✕) = (<.>)


infixl 7 ⊗
(⊗) ∷ Bisemigroup b ⇒ b → b → b
(⊗) = (<.>)


infixl 7 ⋄
(⋄) ∷ Bisemigroup b ⇒ b → b → b
(⋄) = (<.>)


infixl 7 ⊕
(⊕) ∷ Bisemigroup b ⇒ b → b → b
(⊕) = (<+>)

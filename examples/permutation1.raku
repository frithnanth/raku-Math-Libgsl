#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 9 Permutations, Paragraph 9.9 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Constants;
use Math::Libgsl::Permutation;

my Math::Libgsl::Permutation $p .= new: :elems(3);
say $p.all while $p.bnext;

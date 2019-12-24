#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 9 Permutations, Paragraph 9.9 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Constants;
use Math::Libgsl::Raw::Permutation :ALL;

my $p = gsl_permutation_alloc(3);
gsl_permutation_init($p);
say $p.data[^3] while gsl_permutation_next($p) == GSL_SUCCESS;
gsl_permutation_free($p);

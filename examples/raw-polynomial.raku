#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 6 Polynomials, Paragraph 6.6 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Raw::Polynomial :complexsolve;

my CArray[num64] $a .= new: -1e0, 0e0, 0e0, 0e0, 0e0, 1e0;
my $z = CArray[num64].allocate: 10;

my gsl_poly_complex_workspace $w = gsl_poly_complex_workspace_alloc($a.elems);
gsl_poly_complex_solve($a, $a.elems, $w, $z);
gsl_poly_complex_workspace_free($w);
printf "z%d = %+.18f %+.18f\n", $_, $z.AT-POS(2 * $_), $z.AT-POS(2 * $_ + 1) for ^5;

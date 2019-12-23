#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 7 Special Functions, Paragraph 7.34 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Constants;
use Math::Libgsl::Raw::Function :bessel, :DEFAULT;

my num64 $x = 5e0;
my num64 $expected = -0.17759677131433830434739701e0;

my num64 $y = gsl_sf_bessel_J0($x);
say "J0(5.0) = $y";
say "exact   = $expected";

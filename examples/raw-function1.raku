#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 7 Special Functions, Paragraph 7.34 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Constants;
use Math::Libgsl::Raw::Function :bessel, :DEFAULT;

my num64 $x = 5e0;
my gsl_sf_result $result .= new;
my num64 $expected = -0.17759677131433830434739701e0;

my int32 $status = gsl_sf_bessel_J0_e($x, $result);
say "status = { gsl-error($status) }";
say "J0(5.0) = { $result.val }";
say "        ± { $result.err }";
say "exact   = $expected";

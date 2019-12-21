#!/usr/bin/env perl6

use Test;
use lib 'lib';
use Math::Libgsl::Elementary :ALL;

subtest {
  is-approx log1p(.01), .009950330853168083, :rel-tol(10⁻¹⁵), 'ln(1+x)';
  is-approx expm1(.01), .010050167084168058, :rel-tol(10⁻¹⁵), 'exp(x)-1';
  ok hypot(3, 4) == 5, '√x²+y²';
  is-approx hypot3(3, 4, 5), 7.07106781186548, :rel-tol(10⁻¹⁴), '√x²+y²+z²';
  is-approx asinh(1), asinh(1), :rel-tol(10⁻¹⁵), 'asinh';
  is-approx acosh(45), acosh(45), :rel-tol(10⁻¹⁵), 'acosh';
  is-approx atanh(.5), atanh(.5), :rel-tol(10⁻¹⁵), 'atanh';
  ok ldexp(3, 3) == 24, '× * 2^e';
  my @res = frexp(2.21);
  ok { @res[0] == .5525e0 && @res[1] == 2 }, 'frexp';
}, 'elementary functions';

subtest {
  ok int-pow(2, 8) == 256, 'x^n with Int n';
  ok uint-pow(2, 8) == 256, 'x^n with UInt n';
  is-approx pow4(3.141e0), 97.335607906161, :rel-tol(10⁻¹⁵), 'x^4';
}, 'small integer powers';

ok fcmp(log1p(.01),  .009950330853168, 10⁻¹⁴) == True, 'fcmp ok';
ok fcmp(log1p(.01), .009950330853168, 10⁻¹⁵) == False, 'fcmp not ok';

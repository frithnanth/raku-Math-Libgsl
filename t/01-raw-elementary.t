#!/usr/bin/env perl6

use Test;
use lib 'lib';
use Math::Libgsl::Raw::Elementary :ALL;
use NativeCall;

subtest {
  ok gsl_isnan(cos ∞) == cos(∞).isNaN, 'gls_isnan';
  ok gsl_isinf(∞) == 1, 'gls_isinf';
  ok gsl_finite(1e0) == 1, 'gls_finite';
}, 'test functions';

subtest {
  is-approx gsl_log1p(10e0⁻²), .009950330853168083, :rel-tol(10⁻¹⁵), 'ln(1+x)';
  is-approx gsl_expm1(10e0⁻²), .010050167084168058, :rel-tol(10⁻¹⁵), 'exp(x)-1';
  ok gsl_hypot(3e0, 4e0) == 5e0, '√x²+y²';
  is-approx gsl_hypot3(3e0, 4e0, 5e0), 7.07106781186548, :rel-tol(10⁻¹⁴), '√x²+y²+z²';
  is-approx gsl_asinh(1e0), asinh(1), :rel-tol(10⁻¹⁵), 'asinh';
  is-approx gsl_acosh(45e0), acosh(45), :rel-tol(10⁻¹⁵), 'acosh';
  is-approx gsl_atanh(0.5e0), atanh(.5), :rel-tol(10⁻¹⁵), 'atanh';
  ok gsl_ldexp(3e0, 3) == 24, '× * 2^e';
  my int32 $e = 0;
  my num64 $f = gsl_frexp(2.21e0, $e);
  ok { $f == .5525e0 && $e == 2 }, 'frexp';
}, 'elementary functions';

subtest {
  my int32  $n = 8;
  my uint32 $m = 8;
  ok gsl_pow_int(2e0, $n) == 256, 'x^n with int32 n';
  ok gsl_pow_uint(2e0, $m) == 256, 'x^n with uint32 n';
  is-approx gsl_pow_4(3.141e0), 97.335607906161, :rel-tol(10⁻¹⁵), 'x^4';
}, 'small integer powers';

ok gsl_fcmp(gsl_log1p(10e0⁻²),  .009950330853168e0, 10e0⁻¹⁴) == 0, 'fcmp ok';
nok gsl_fcmp(gsl_log1p(10e0⁻²), .009950330853168e0, 10e0⁻¹⁵) == 0, 'fcmp not ok';

done-testing;

#!/usr/bin/env perl6

use Test;
use lib 'lib';
use Math::Libgsl::Polynomial :ALL;

subtest {
  my @c = 1, 2, 3;
  ok poly-eval(@c, 10) == 321, 'evaluate real polynomial for real x - Array';
  ok poly-eval((1, 2, 3), 10) == 321, 'evaluate real polynomial for real x - List';
  my @out;
  lives-ok { @out = poly-eval-derivs(10, 3, (1,2,3)) }, 'poly-eval-derivs';
  is-deeply @out, [321e0, 62e0, 6e0], 'evaluate real polynomial and its derivatives for real x';
}, 'evaluate real polynomial';

subtest {
  my Num @xa = 1e0 … 6e0;
  my Num @ya = 1e0, 2e0, 3e0, 2e0, 0e0, 2e0;
  my @x  = 7,;
  my @out = poly-dd(@xa, @ya, @x);
  ok @out[0] == 18, 'evaluate polynomial as divided diferences';
  @out = poly-dd-taylor(@xa, @ya, 2.5);
  is-deeply @out».round(10⁻¹⁴),
    [2.68359375e0, 1.0880208333333332e0, -0.7604166666666666e0, -0.35416666666666663e0, 0.10416666666666666e0,
     0.008333333333333337e0]».round(10⁻¹⁴),
    'Taylor expansion';
  @out = poly-dd-hermite((1.3e0, 1.6e0, 1.9e0),
                         (0.6200860e0, 0.4554022e0, 0.2818186e0),
                         (-0.5220232e0, -0.5698959e0, -0.5811571e0),
                         @x);
  ok @out[0].round(10⁻⁴) == -4.5079, 'evaluate the Hermite polynomial as divided diferences';
}, 'divided difference';

subtest {
  my ($roots, $x0, $x1) = poly-solve-quadratic(1, -2, 1);
  ok $roots == 2, 'two real roots found';
  ok $x0    == 1, 'first root';
  ok $x1    == 1, 'second root';
  my Complex $z0;
  my Complex $z1;
  ($roots, $z0, $z1) = poly-complex-solve-quadratic(1, 1, 1);
  ok $roots == 2, 'two complex roots found';
  is-approx $z0, -0.5 - i * 0.8660254037844386, 10⁻¹⁴, 'first root';
  is-approx $z1, -0.5 + i * 0.8660254037844386, 10⁻¹⁴, 'second root';
}, 'quadratic equation';

subtest {
  my ($roots, $x0, $x1, $x2) = poly-solve-cubic(1, -2, 1);
  ok $roots == 1, 'one root found';
  is-approx $x0, -2.1478990357047874, 10⁻¹⁴, 'real root';
  my Complex $z0;
  my Complex $z1;
  my Complex $z2;
  ($roots, $z0, $z1, $z2) = poly-complex-solve-cubic(1, -2, 1);
  ok $roots == 3, 'three roots found';
  is-approx $z0, -2.1478990357047874 + i * 0, 10⁻¹⁴, 'first root';
  is-approx $z1, 0.5739495178523937 - i * 0.3689894074818041, 10⁻¹⁴, 'second root';
  is-approx $z2, 0.5739495178523937 + i * 0.3689894074818041, 10⁻¹⁴, 'third root';
}, 'cubic equation';

subtest {
  my @roots;
  lives-ok { @roots = poly-complex-solve(-1, 0, 0, 0, 0, 1) }, 'poly-complex-solve';
  is-deeply @roots».round(10⁻¹⁴),
    [-0.8090169943749477 + i * 0.5877852522924734,
     -0.8090169943749477 - i * 0.5877852522924734,
      0.3090169943749475 + i * 0.951056516295153,
      0.3090169943749475 - i * 0.951056516295153,
      0.9999999999999999 + i * 0]».round(10⁻¹⁴),
    'complex polynomial';
}, 'solve complex polynomial';

done-testing;

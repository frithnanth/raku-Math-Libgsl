[![Build Status](https://travis-ci.org/frithnanth/raku-Math-Libgsl.svg?branch=master)](https://travis-ci.org/frithnanth/raku-Math-Libgsl)

NAME
====

Math::Libgsl - An interface to libgsl, the Gnu Scientific Library.

Work In Progress
================

This is a work in progress. The GSL is huge and I will release early and release often while developing the module; I will try to keep the interface as consistent as I can.

This is what's presently available as Raku subs:

<table class="pod-table">
<thead><tr>
<th>C function group</th> <th>Raku subs provided</th>
</tr></thead>
<tbody>
<tr> <td>Mathematical functions</td> <td>23</td> </tr> <tr> <td>Polynomials</td> <td>10</td> </tr> <tr> <td>Special functions</td> <td>515</td> </tr>
</tbody>
</table>

SYNOPSIS
========

```perl6
use Math::Libgsl::Raw::Elementary :ALL;
use Math::Libgsl::Raw::Polynomial :ALL;
use Math::Libgsl::Raw::Function :ALL;

use Math::Libgsl::Constants;
use Math::Libgsl::Exception;
use Math::Libgsl::Elementary :ALL;
use Math::Libgsl::Polynomial :ALL;
use Math::Libgsl::Function :ALL;
```

DESCRIPTION
===========

Math::Libgsl provides an interface to libgsl - the GNU Scientific Library.

This package provides both the low-level interface to the C library (Raw) and a more comfortable interface layer for the Raku programmer.

There are several groups of functions each coming with its own module. To avoid a massive pollution of the namespace each module exports groups of symbols using tags, so the programmer can choose what to import, or import all the tagged symbols using **:ALL**.

Math::Libgsl does nothing so far, it just contains the pod6 documentation.

Math::Libgsl::Elementary makes these tags available:

  * :elem

  * :smallint

  * :approx

Math::Libgsl::Polynomial makes these tags available:

  * :eval

  * :divdiff

  * :quad

  * :cubic

  * :complexsolve

Math::Libgsl::Function makes these tags available:

  * :airy

  * :bessel

  * :coulomb

  * :coupling

  * :dawson

  * :debye

  * :dilog

  * :mult

  * :ellint

  * :ellfun

  * :err

  * :exp

  * :fermidirac

  * :gammabeta

  * :gegen

  * :hermite

  * :hyperg

  * :laguerre

  * :lambert

  * :legendre

  * :log

  * :mathieu

  * :pow

  * :psi

  * :sync

  * :transport

  * :trig

  * :zeta

Math::Libgsl::Elementary
------------------------

### sub log1p(Num(Cool) $x --> Num) is export(:elem)

Computes the value of log(1 + x).

### sub expm1(Num(Cool) $x --> Num) is export(:elem)

Computes the value of exp(x) - 1.

### sub hypot(Num(Cool) $x, Num(Cool) $y --> Num) is export(:elem)

Computes the value of sqrt(x² + y²).

### sub hypot3(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z --> Num) is export(:elem)

Computes the value of sqrt(x² + y² + z²).

### sub asinh(Num(Cool) $x --> Num) is export(:elem)

Computes the value of arcsinh(x).

### sub acosh(Num(Cool) $x --> Num) is export(:elem)

Computes the value of arccosh(x).

### sub atanh(Num(Cool) $x --> Num) is export(:elem)

Computes the value of arctanh(x).

### sub ldexp(Num(Cool) $x, Int $e --> Num) is export(:elem)

Computes the value of x * 2ᵉ.

### sub frexp(Num(Cool) $x --> List) is export(:elem)

Computes the value of f such that x = f * 2ᵉ. It returns a list of two values: f and e.

### sub int-pow(Num(Cool) $x, Int $e --> Num) is export(:smallint)

Computes the value of xᵉ with e ∈ ℤ.

### sub uint-pow(Num(Cool) $x, UInt $e --> Num) is export(:smallint)

Computes the value of xᵉ with e ∈ ℕ.

### sub pow2(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x².

### sub pow3(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x³.

### sub pow4(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁴.

### sub pow5(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁵.

### sub pow6(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁶.

### sub pow7(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁷.

### sub pow8(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁸.

### sub pow9(Num(Cool) $x --> Num) is export(:smallint)

Computes the value of x⁹.

### sub fcmp(Num(Cool) $x, Num(Cool) $y, Num(Cool) $ε --> Bool) is export(:approx)

Determines whether x and y are approximately equal to a relative accuracy ε.

Math::Libgsl::Polynomial
------------------------

### sub poly-eval(Positional $c, Num(Cool) $x --> Num) is export(:eval)

Evaluates a polynomial with real coefficients for the real variable x.

    my @c = 1, 2, 3;
    say poly-eval(@c, 10); # prints 321

### sub poly-eval-derivs(Num(Cool) $x, Int $maxn, Positional $c --> List) is export(:eval)

This function evaluates a polynomial and its derivatives. The output array contains the values of dⁿP(x)/dxⁿ for the specified value of x starting with n = 0.

### sub poly-dd(Positional $xa, Positional $ya, Positional $x --> List) is export(:divdiff)

This function computes a divided-difference representation of the interpolating polynomial for the points (xa, ya) and evaluates the polynomial for each point x.

### sub poly-dd-taylor(Positional $xa, Positional $ya, Num(Cool) $x --> List) is export(:divdiff)

This function converts the divided-difference representation of a polynomial to a Taylor expansion and evaluates the Taylor coefficients about the point x.

### sub poly-dd-hermite(Positional $xa, Positional $ya, Positional $dya, Positional $x --> List) is export(:divdiff)

This function computes a divided-difference representation of the interpolating Hermite polynomial for the points (xa, ya) and evaluates the polynomial for each point x.

### sub poly-solve-quadratic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:quad)

This function finds the real roots of the quadratic equation ax² + bx + c = 0. It returns a list of values: the number of the real roots found and zero, one or two roots; if present the roots are sorted in ascending order.

### sub poly-complex-solve-quadratic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:quad)

This function finds the complex roots of the quadratic equation ax² + bx + c = 0. It returns a list of values: the number of the real roots found and zero, one or two roots. The root are returned as Raku Complex values.

### sub poly-solve-cubic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:cubic)

This function finds the real roots of the cubic equation x³ + ax² + bx + c = 0. It returns a list of values: the number of the real roots found and one or three roots; the roots are sorted in ascending order.

### sub poly-complex-solve-cubic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:cubic)

This function finds the complex roots of the cubic equation x³ + ax² + bx + c = 0. The number of complex roots is returned (always three); the roots are returned in ascending order, sorted first by their real components and then by their imaginary components. The root are returned as Raku Complex values.

### sub poly-complex-solve(*@a --> List) is export(:complexsolve)

This function computes the roots of the general polynomial a₀ + a₁x + a₂x² + … + aₙ₋₁xⁿ⁻¹ The root are returned as Raku Complex values.

Math::Libgsl::Function
----------------------

Throughout this module the subs whose name ends with "-e" return a List of two values: the result and its associated error.

### sub Ai(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Ai-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the Airy function Ai(x) with an accuracy specified by mode.

### sub Bi(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Bi-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the Airy function Bi(x) with an accuracy specified by mode.

### sub Ai-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Ai-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function Ai(x) with an accuracy specified by mode.

### sub Bi-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Bi-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function Bi(x) with an accuracy specified by mode.

### sub Ai-deriv(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Ai-deriv-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function derivative A'i(x) with an accuracy specified by mode.

### sub Bi-deriv(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Bi-deriv-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function derivative B'i(x) with an accuracy specified by mode.

### sub Ai-deriv-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Ai-deriv-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function derivative A'i(x) with an accuracy specified by mode.

### sub Bi-deriv-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy)

### sub Bi-deriv-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy)

These routines compute the scaled value of the Airy function derivative B'i(x) with an accuracy specified by mode.

### sub Ai-zero(UInt $s --> Num) is export(:airy)

### sub Ai-zero-e(UInt $s --> List) is export(:airy)

These routines compute the location of the s-th zero of the Airy function Ai(x).

### sub Bi-zero(UInt $s --> Num) is export(:airy)

### sub Bi-zero-e(UInt $s --> List) is export(:airy)

These routines compute the location of the s-th zero of the Airy function Bi(x).

### sub Ai-deriv-zero(UInt $s --> Num) is export(:airy)

### sub Ai-deriv-zero-e(UInt $s --> List) is export(:airy)

These routines compute the location of the s-th zero of the Airy function derivative A'i(x).

### sub Bi-deriv-zero(UInt $s --> Num) is export(:airy)

### sub Bi-deriv-zero-e(UInt $s --> List) is export(:airy)

These routines compute the location of the s-th zero of the Airy function derivative B'i(x).

### sub J0(Num(Cool) $x --> Num) is export(:bessel)

### sub J0-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular cylindrical Bessel function of zeroth order, J₀(x).

### sub J1(Num(Cool) $x --> Num) is export(:bessel)

### sub J1-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular cylindrical Bessel function of first order, J₁(x).

### sub Jn(Int $n, Num(Cool) $x --> Num) is export(:bessel)

### sub Jn-e(Int $n, Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular cylindrical Bessel function of order n, Jₙ(x).

### sub Jn-array(Int $nmin, Int $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the regular cylindrical Bessel functions Jₙ(x) for n from nmin to nmax inclusive.

### sub Y0(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Y0-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular cylindrical Bessel function of zeroth order, Y₀(x).

### sub Y1(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Y1-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular cylindrical Bessel function of first order, Y₁(x).

### sub Yn(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Yn-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular cylindrical Bessel function of order n, Yₙ(x).

### sub Yn-array(Int $nmin, Int $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the irregular cylindrical Bessel functions Yₙ(x) for n from nmin to nmax inclusive.

### sub I0(Num(Cool) $x --> Num) is export(:bessel)

### sub I0-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular modified cylindrical Bessel function of zeroth order, I₀(x).

### sub I1(Num(Cool) $x --> Num) is export(:bessel)

### sub I1-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular modified cylindrical Bessel function of first order, I₁(x).

### sub In(Int $n, Num(Cool) $x --> Num) is export(:bessel)

### sub In-e(Int $n, Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular modified cylindrical Bessel function of order n, Iₙ(x).

### sub In-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the regular modified cylindrical Bessel functions Iₙ(x) for n from nmin to nmax inclusive.

### sub I0-scaled(Num(Cool) $x --> Num) is export(:bessel)

### sub I0-scaled-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified cylindrical Bessel function of zeroth order exp(−|x|)I₀(x).

### sub I1-scaled(Num(Cool) $x --> Num) is export(:bessel)

### sub I1-scaled-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified cylindrical Bessel function of first order exp(−|x|)I₁(x).

### sub In-scaled(Int $n, Num(Cool) $x --> Num) is export(:bessel)

### sub In-scaled-e(Int $n, Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified cylindrical Bessel function of order n exp(−|x|)Iₙ(x).

### sub In-scaled-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the scaled regular cylindrical Bessel functions exp(−|x|)Iₙ(x) for n from nmin to nmax inclusive.

### sub K0(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub K0-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular modified cylindrical Bessel function of zeroth order, K₀(x).

### sub K1(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub K1-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular modified cylindrical Bessel function of first order, K₁(x).

### sub Kn(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Kn-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular modified cylindrical Bessel function of order n, Kₙ(x).

### sub Kn-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x where * > 0 --> List) is export(:bessel)

This routine computes the values of the irregular modified cylindrical Bessel functions K n (x) for n from nmin to nmax inclusive.

### sub K0-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub K0-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified cylindrical Bessel function of zeroth order exp(x)K₀(x).

### sub K1-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub K1-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified cylindrical Bessel function of first order exp(x)K₁(x).

### sub Kn-scaled(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Kn-scaled-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified cylindrical Bessel function of order n exp(x)Kₙ(x).

### sub Kn-scaled-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x where * > 0 --> List) is export(:bessel)

This routine computes the values of the scaled irregular cylindrical Bessel functions exp(x)Kₙ(x) for n from nmin to nmax inclusive.

### sub j0(Num(Cool) $x --> Num) is export(:bessel)

### sub j0-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular spherical Bessel function of zeroth order, j₀(x).

### sub j1(Num(Cool) $x --> Num) is export(:bessel)

### sub j1-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular spherical Bessel function of first order, j₁(x).

### sub j2(Num(Cool) $x --> Num) is export(:bessel)

### sub j2-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular spherical Bessel function of second order, j₂(x).

### sub jl(UInt $l, Num(Cool) $x where * ≥ 0 --> Num) is export(:bessel)

### sub jl-e(UInt $l, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel)

These routines compute the regular spherical Bessel function of order l, jₗ(x).

### sub jl-array(UInt $lmax, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel)

This routine computes the values of the regular spherical Bessel functions jₗ(x) for l from 0 to lmax inclusive.

### sub jl-steed-array(UInt $lmax, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel)

This routine uses Steed’s method to compute the values of the regular spherical Bessel functions jₗ(x) for l from 0 to lmax inclusive.

### sub y0(Num(Cool) $x --> Num) is export(:bessel)

### sub y0-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the irregular spherical Bessel function of zeroth order, y₀(x).

### sub y1(Num(Cool) $x --> Num) is export(:bessel)

### sub y1-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the irregular spherical Bessel function of first order, y₁(x).

### sub y2(Num(Cool) $x --> Num) is export(:bessel)

### sub y2-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the irregular spherical Bessel function of second order, y₂(x).

### sub yl(UInt $l, Num(Cool) $x --> Num) is export(:bessel)

### sub yl-e(UInt $l, Num(Cool) $x --> List) is export(:bessel)

These routines compute the irregular spherical Bessel function of order l, yₗ(x).

### sub yl-array(UInt $lmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the irregular spherical Bessel functions yₗ(x) for l from 0 to lmax inclusive.

### sub i0-scaled(Num(Cool) $x --> Num) is export(:bessel)

### sub i0-scaled-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified spherical Bessel function of zeroth order.

### sub i1-scaled(Num(Cool) $x --> Num) is export(:bessel)

### sub i1-scaled-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified spherical Bessel function of first order.

### sub i2-scaled(Num(Cool) $x --> Num) is export(:bessel)

### sub i2-scaled-e(Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified spherical Bessel function of second order.

### sub il-scaled(UInt $l, Num(Cool) $x --> Num) is export(:bessel)

### sub il-scaled-e(UInt $l, Num(Cool) $x --> List) is export(:bessel)

These routines compute the scaled regular modified spherical Bessel function of order l.

### sub il-scaled-array(UInt $lmax, Num(Cool) $x --> List) is export(:bessel)

This routine computes the values of the scaled regular modified spherical Bessel functions for l from 0 to lmax inclusive.

### sub k0-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub k0-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified spherical Bessel function of zeroth order.

### sub k1-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub k1-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified spherical Bessel function of first order.

### sub k2-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub k2-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified spherical Bessel function of second order.

### sub kl-scaled(UInt $l, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub kl-scaled-e(UInt $l, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified spherical Bessel function of order l.

### sub kl-scaled-array(UInt $lmax, Num(Cool) $x where * > 0 --> List) is export(:bessel)

This routine computes the values of the scaled irregular modified spherical Bessel functions for l from 0 to lmax inclusive.

### sub Jnu(Num(Cool) $ν, Num(Cool) $x --> Num) is export(:bessel)

### sub Jnu-e(Num(Cool) $ν, Num(Cool) $x --> List) is export(:bessel)

These routines compute the regular cylindrical Bessel function of fractional order ν, Jν(x).

### sub Jnu-sequence(Num(Cool) $ν, UInt $mode, Positional $x --> List) is export(:bessel)

This function computes the regular cylindrical Bessel function of fractional order ν, Jν(x), with an accuracy specified by $mode, evaluated at a series of x values.

### sub Ynu(Num(Cool) $ν, Num(Cool) $x --> Num) is export(:bessel)

### sub Ynu-e(Num(Cool) $ν, Num(Cool) $x --> List) is export(:bessel)

These routines compute the irregular cylindrical Bessel function of fractional order ν, Yν(x).

### sub Inu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0--> Num) is export(:bessel)

### sub Inu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the regular modified Bessel function of fractional order ν, Iν(x).

### sub Inu-scaled(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Inu-scaled-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled regular modified Bessel function of fractional order ν.

### sub Knu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Knu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the irregular modified Bessel function of fractional order ν, Kν(x).

### sub lnKnu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub lnKnu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the logarithm of the irregular modified Bessel function of fractional order ν, ln(Kν(x)).

### sub Knu-scaled(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel)

### sub Knu-scaled-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel)

These routines compute the scaled irregular modified Bessel function of fractional order ν.

### sub J0-zero(UInt $s --> Num) is export(:bessel)

### sub J0-zero-e(UInt $s --> List) is export(:bessel)

These routines compute the location of the s-th positive zero of the Bessel function J₀(x).

### sub J1-zero(UInt $s --> Num) is export(:bessel)

### sub J1-zero-e(UInt $s --> List) is export(:bessel)

These routines compute the location of the s-th positive zero of the Bessel function J₁(x).

### sub Jnu-zero(Num(Cool) $ν where * ≥ 0, UInt $s --> Num) is export(:bessel)

### sub Jnu-zero-e(Num(Cool) $ν where * ≥ 0, UInt $s --> List) is export(:bessel)

These routines compute the location of the s-th positive zero of the Bessel function Jν(x).

### sub clausen(Num(Cool) $x --> Num) is export(:clausen)

### sub clausen-e(Num(Cool) $x --> List) is export(:clausen)

These routines compute the Clausen integral Cl₂(x).

### sub hydrogenic-R1(Num(Cool) $Z, Num(Cool) $r --> Num) is export(:coulomb)

### sub hydrogenic-R1-e(Num(Cool) $Z, Num(Cool) $r --> List) is export(:coulomb)

These √ routines compute the lowest-order normalized hydrogenic bound state radial wavefunction R₁.

### sub hydrogenic-R(Int $n, Int $l, Num(Cool) $Z, Num(Cool) $r --> Num) is export(:coulomb)

### sub hydrogenic-R-e(Int $n, Int $l, Num(Cool) $Z, Num(Cool) $r --> List) is export(:coulomb)

These routines compute the n-th normalized hydrogenic bound state radial wavefunction Rₙ.

### sub coulomb-wave-FG-e(Num(Cool) $eta, Num(Cool) $x where * > 0, Num(Cool) $LF where * > -½, Int $k --> List) is export(:coulomb)

This function computes the Coulomb wave functions Fₗ(η, x), Gₗ₋ₖ(η, x) and their derivatives Fₗ’(η, x), Gₗ₋ₖ’(η, x) with respect to x. It returns a List of Pairs (that can be read as a Hash):

  * :Fval the Fₗ(η, x) value

  * :Ferr the Fₗ(η, x) error

  * :Fpval the Fₗ’(η, x) value

  * :Fperr the Fₗ’(η, x) error

  * :Gval the Gₗ₋ₖ(η, x) value

  * :Gerr the Gₗ₋ₖ(η, x) error

  * :Gpval the Gₗ₋ₖ’(η, x) value

  * :Gperr the Gₗ₋ₖ’(η, x) error

  * :overflow Bool: if an overflow occurred, this is True, otherwise False

  * :expF if an overflow occurred, this is the scaling exponent for Fₗ(η, x)

  * :expG if an overflow occurred, this is the scaling exponent for Gₗ₋ₖ(η, x)

    my %res = coulomb-wave-FG-e(1, 5, 0, 0);
    say %res<Fval>;
    say %res<Fpval>;
    say %res<Gval>;
    say %res<Gpval>;

### sub coulomb-wave-F-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb)

This function computes the Coulomb wave function Fₗ(η, x) for l = lmin … lmin + kmax. It returns a List of Pairs (that can be read as a Hash):

  * :outF array of Fₗ(η, x) values

  * :overflow Bool: if an overflow occurred, this is True, otherwise False

  * :expF if an overflow occurred, this is the scaling exponent for Fₗ(η, x)

### sub coulomb-wave-FG-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb)

This function computes the functions Fₗ(η, x), Gₗ(η, x) for l = lmin … lmin + kmax. It returns a List of Pairs (that can be read as a Hash):

  * :outF array of Fₗ(η, x) values

  * :outG array of Gₗ(η, x) values

  * :overflow Bool: if an overflow occurred, this is True, otherwise False

  * :expF if an overflow occurred, this is the scaling exponent for Fₗ(η, x)

  * :expG if an overflow occurred, this is the scaling exponent for Gₗ₋ₖ(η, x)

### sub coulomb-wave-FGp-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb)

This function computes the functions Fₗ(η, x), Gₗ(η, x) and their derivatives F’ₗ(η, x), G’ₗ(η, x) for l = lmin … lmin + kmax It returns a List of Pairs (that can be read as a Hash):

  * :outF array of Fₗ(η, x) values

  * :outG array of Gₗ(η, x) values

  * :outFp array of Fₗ’(η, x) values

  * :outGp array of Gₗ’(η, x) values

  * :overflow Bool: if an overflow occurred, this is True, otherwise False

  * :expF if an overflow occurred, this is the scaling exponent for Fₗ(η, x)

  * :expG if an overflow occurred, this is the scaling exponent for Gₗ₋ₖ(η, x)

### sub coulomb-wave-sphF-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb)

This function computes the Coulomb wave function divided by the argument Fₗ(η, x)/x for l = lmin… lmin + kmax It returns a List of Pairs (that can be read as a Hash):

  * :outF array of Fₗ(η, x) values

  * :overflow Bool: if an overflow occurred, this is True, otherwise False

  * :expF if an overflow occurred, this is the scaling exponent for Fₗ(η, x)

### sub coulomb-CL-e(Num(Cool) $L where * > -1, Num(Cool) $eta --> List) is export(:coulomb)

This function computes the Coulomb wave function normalization constant Cₗ(η).

### sub coulomb-CL-array(Num(Cool) $lmin where * > -1, UInt $kmax, Num(Cool) $eta --> List) is export(:coulomb)

This function computes the Coulomb wave function normalization constant C L (η) for l = lmin … lmin + kmax.

### sub coupling3j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-ma, Int $two-mb, Int $two-mc --> Num) is export(:coupling)

### sub coupling3j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-ma, Int $two-mb, Int $two-mc --> List) is export(:coupling)

These routines compute the Wigner 3-j coefficient. The arguments are given in half-integer units: two_ja/2, two_ma/2, etc.

### sub coupling6j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf --> Num) is export(:coupling)

### sub coupling6j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf --> List) is export(:coupling)

These routines compute the Wigner 6-j coefficient. The arguments are given in half-integer units: two_ja/2, two_ma/2, etc.

### sub coupling9j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf, Int $two-jg, Int $two-jh, Int $two-ji --> Num) is export(:coupling)

### sub coupling9j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf, Int $two-jg, Int $two-jh, Int $two-ji --> List) is export(:coupling)

These routines compute the Wigner 9-j coefficient. The arguments are given in half-integer units: two_ja/2, two_ma/2, etc.

### sub dawson(Num(Cool) $x --> Num) is export(:dawson)

### sub dawson-e(Num(Cool) $x --> List) is export(:dawson)

These routines compute the value of Dawson’s integral for x.

### sub debye1(Num(Cool) $x --> Num) is export(:debye)

### sub debye1-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₁(x).

### sub debye2(Num(Cool) $x --> Num) is export(:debye)

### sub debye2-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₂(x).

### sub debye3(Num(Cool) $x --> Num) is export(:debye)

### sub debye3-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₃(x).

### sub debye4(Num(Cool) $x --> Num) is export(:debye)

### sub debye4-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₄(x).

### sub debye5(Num(Cool) $x --> Num) is export(:debye)

### sub debye5-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₅(x).

### sub debye6(Num(Cool) $x --> Num) is export(:debye)

### sub debye6-e(Num(Cool) $x --> List) is export(:debye)

These routines compute the first-order Debye function D₆(x).

### sub dilog(Num(Cool) $x --> Num) is export(:dilog)

### sub dilog-e(Num(Cool) $x --> List) is export(:dilog)

These routines compute the dilogarithm for a real argument.

### sub complex-dilog-xy-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:dilog)

### sub complex-dilog-e(Num(Cool) $r, Num(Cool) $θ --> List) is export(:dilog)

This function computes the full complex-valued dilogarithm for the complex argument z = r exp(iθ).

### sub complex-spence-xy-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:dilog)

This function computes the full complex-valued Spence integral. It returns a List: the first element is the value as a Raku’s Complex datatype, the following are the errors on the real and imaginary part.

### sub multiply(Num(Cool) $x, Num(Cool) $y --> Num) is export(:mult)

### sub multiply-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:mult)

These functions multiply x and y, allowing for the propagation of errors.

### sub multiply-err-e(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:mult)

This function multiplies x and y with associated absolute errors dx and dy.

### sub Kcomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub Kcomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the complete elliptic integral K(k) to the accuracy specified by the mode variable mode.

### sub Ecomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub Ecomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the complete elliptic integral E(k) to the accuracy specified by the mode variable mode.

### sub Pcomp(Num(Cool) $k, Num(Cool) $n, UInt $mode --> Num) is export(:ellint)

### sub Pcomp-e(Num(Cool) $k, Num(Cool) $n, UInt $mode --> List) is export(:ellint)

These routines compute the complete elliptic integral Π(k,n) to the accuracy specified by the mode variable mode.

### sub Dcomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub Dcomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the complete elliptic integral D(k) to the accuracy specified by the mode variable mode.

### sub F(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub F-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral F(φ, k) to the accuracy specified by the mode variable mode.

### sub E(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub E-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral E(φ, k) to the accuracy specified by the mode variable mode.

### sub P(Num(Cool) $Φ, Num(Cool) $k, Num(Cool) $n, UInt $mode --> Num) is export(:ellint)

### sub P-e(Num(Cool) $Φ, Num(Cool) $k, Num(Cool) $n, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral P(φ, k) to the accuracy specified by the mode variable mode.

### sub D(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint)

### sub D-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral D(φ, k) to the accuracy specified by the mode variable mode.

### sub RC(Num(Cool) $x, Num(Cool) $y, UInt $mode --> Num) is export(:ellint)

### sub RC-e(Num(Cool) $x, Num(Cool) $y, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral RC(x, y) to the accuracy specified by the mode variable mode.

### sub RD(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> Num) is export(:ellint)

### sub RD-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral RD(x, y, z) to the accuracy specified by the mode variable mode.

### sub RF(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> Num) is export(:ellint)

### sub RF-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral RF(x, y, z) to the accuracy specified by the mode variable mode.

### sub RJ(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, Num(Cool) $p, UInt $mode --> Num) is export(:ellint)

### sub RJ-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, Num(Cool) $p, UInt $mode --> List) is export(:ellint)

These routines compute the incomplete elliptic integral RJ(x, y, z, p) to the accuracy specified by the mode variable mode.

### sub elljac-e(Num(Cool) $u, Num(Cool) $m --> List) is export(:ellfun)

This function computes the Jacobian elliptic functions sn(u|m), cn(u|m), dn(u|m) by descending Landen transformations.

### sub erf(Num(Cool) $x --> Num) is export(:err)

### sub erf-e(Num(Cool) $x --> List) is export(:err)

These routines compute the error function erf(x).

### sub erfc(Num(Cool) $x --> Num) is export(:err)

### sub erfc-e(Num(Cool) $x --> List) is export(:err)

These routines compute the complementary error function erfc(x) = 1 − erf(x).

### sub log-erfc(Num(Cool) $x --> Num) is export(:err)

### sub log-erfc-e(Num(Cool) $x --> List) is export(:err)

These routines compute the logarithm of the complementary error function log(erfc(x)).

### sub erf-Z(Num(Cool) $x --> Num) is export(:err)

### sub erf-Z-e(Num(Cool) $x --> List) is export(:err)

These routines compute the Gaussian probability density function Z(x).

### sub erf-Q(Num(Cool) $x --> Num) is export(:err)

### sub erf-Q-e(Num(Cool) $x --> List) is export(:err)

These routines compute the upper tail of the Gaussian probability function Q(x).

### sub hazard(Num(Cool) $x --> Num) is export(:err)

### sub hazard-e(Num(Cool) $x --> List) is export(:err)

These routines compute the hazard function for the normal distribution.

### sub gexp(Num(Cool) $x --> Num) is export(:exp)

### sub gexp-e(Num(Cool) $x --> List) is export(:exp)

These routines provide an exponential function exp(x) using GSL semantics and error checking.

### sub gexp-e10(Num(Cool) $x --> List) is export(:exp)

This function computes the exponential exp(x) and returns a result with extended range. This function may be useful if the value of exp(x) would overflow the numeric range of double. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub gexp-mult(Num(Cool) $x, Num(Cool) $y --> Num) is export(:exp)

### sub gexp-mult-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:exp)

These routines exponentiate x and multiply by the factor y to return the product y exp(x).

### sub gexp-mult-e10(Num(Cool) $x, Num(Cool) $y --> List) is export(:exp)

This function computes the product y exp(x) and returns a result with extended range. This function may be useful if the value of exp(x) would overflow the numeric range of double. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub gexpm1(Num(Cool) $x --> Num) is export(:exp)

### sub gexpm1-e(Num(Cool) $x --> List) is export(:exp)

These routines compute the quantity exp(x) − 1 using an algorithm that is accurate for small x.

### sub gexprel(Num(Cool) $x --> Num) is export(:exp)

### sub gexprel-e(Num(Cool) $x --> List) is export(:exp)

These routines compute the quantity (exp(x) − 1)/x using an algorithm that is accurate for small x.

### sub gexprel2(Num(Cool) $x --> Num) is export(:exp)

### sub gexprel2-e(Num(Cool) $x --> List) is export(:exp)

These routines compute the quantity 2(exp(x) − 1 − x)/x 2 using an algorithm that is accurate for small x.

### sub gexprel-n(Int $n, Num(Cool) $x --> Num) is export(:exp)

### sub gexprel-n-e(Int $n, Num(Cool) $x --> List) is export(:exp)

These routines compute the N -relative exponential, which is the n-th generalization of the functions gexprel, gexprel2, gexprel-e, and gexprel2-e.

### sub gexp-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:exp)

This function exponentiates x with an associated absolute error dx.

### sub gexp-err-e10(Num(Cool) $x, Num(Cool) $dx --> List) is export(:exp)

This function exponentiates a quantity x with an associated absolute error dx and returns a result with extended range. This function may be useful if the value of exp(x) would overflow the numeric range of double. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub gexp-mult-err-e(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:exp)

This routine computes the product y exp(x) for the quantities x, y with associated absolute errors dx, dy.

### sub gexp-mult-err-e10(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:exp)

This routine computes the product y exp(x) for the quantities x, y with associated absolute errors dx, dy and returns a result with extended range. This function may be useful if the value of exp(x) would overflow the numeric range of double. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub E1(Num(Cool) $x --> Num) is export(:expint)

### sub E1-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the exponential integral E₁(x).

### sub E2(Num(Cool) $x --> Num) is export(:expint)

### sub E2-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the exponential integral E₂(x).

### sub En(Int $n, Num(Cool) $x --> Num) is export(:expint)

### sub En-e(Int $n, Num(Cool) $x --> List) is export(:expint)

These routines compute the exponential integral Eₙ(x) of order n.

### sub Ei(Num(Cool) $x --> Num) is export(:expint)

### sub Ei-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the exponential integral Ei(x).

### sub Shi(Num(Cool) $x --> Num) is export(:expint)

### sub Shi-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the hyperbolic integral Shi(x).

### sub Chi(Num(Cool) $x --> Num) is export(:expint)

### sub Chi-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the hyperbolic integral Chi(x).

### sub expint3(Num(Cool) $x where * ≥ 0 --> Num) is export(:expint)

### sub expint3-e(Num(Cool) $x where * ≥ 0 --> List) is export(:expint)

These routines compute the third-order exponential integral Ei₃(x).

### sub Si(Num(Cool) $x --> Num) is export(:expint)

### sub Si-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the Sine integral Si(x).

### sub Ci(Num(Cool) $x where * > 0 --> Num) is export(:expint)

### sub Ci-e(Num(Cool) $x where * > 0 --> List) is export(:expint)

These routines compute the Cosine integral Ci(x).

### sub atanint(Num(Cool) $x --> Num) is export(:expint)

### sub atanint-e(Num(Cool) $x --> List) is export(:expint)

These routines compute the Arctangent integral.

### sub fd-m1(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd-m1-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral with an index of −1.

### sub fd0(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd0-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral with an index of 0.

### sub fd1(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd1-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral with an index of 1.

### sub fd2(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd2-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral with an index of 2.

### sub fd-int(Int $j, Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd-int-e(Int $j, Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral with an integer index j.

### sub fd-mhalf(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd-mhalf-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral F₋₁/₂(x).

### sub fd-half(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd-half-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral F₁/₂(x).

### sub fd-half3(Num(Cool) $x --> Num) is export(:fermidirac)

### sub fd-half3-e(Num(Cool) $x --> List) is export(:fermidirac)

These routines compute the complete Fermi-Dirac integral F₃/₂(x).

### sub fd-inc0(Num(Cool) $x, Num(Cool) $b --> Num) is export(:fermidirac)

### sub fd-inc0-e(Num(Cool) $x, Num(Cool) $b --> List) is export(:fermidirac)

These routines compute the incomplete Fermi-Dirac integral with an index of zero, F₀(x, b).

### sub gamma(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta)

### sub gamma-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta)

These routines compute the Gamma function Γ(x).

### sub lngamma(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta)

### sub lngamma-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta)

These routines compute the logarithm of the Gamma function, log(Γ(x)).

### sub lngamma-sgn-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta)

This routine computes the sign of the gamma function and the logarithm of its magnitude. It returns three numbers: the value, its associated error, and the sign.

### sub gammastar(Num(Cool) $x where * > 0 --> Num) is export(:gammabeta)

### sub gammastar-e(Num(Cool) $x where * > 0 --> List) is export(:gammabeta)

These routines compute the regulated Gamma Function Γ*(x).

### sub gammainv(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta)

### sub gammainv-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta)

These routines compute the reciprocal of the gamma function, 1/Γ(x) using the real Lanczos method.

### sub lngamma-complex-e(Num(Cool) $zr where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) }, Num(Cool) $zi where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta)

This routine computes log(Γ(z)) for complex z = zᵣ + izᵢ. The returned parameters are lnr = log |Γ(z)|, its error, arg = arg(Γ(z)) in (−π, π], and its error.

### sub fact(UInt $n where * ≤ GSL_SF_FACT_NMAX --> Num) is export(:gammabeta)

### sub fact-e(UInt $n where * ≤ GSL_SF_FACT_NMAX --> List) is export(:gammabeta)

These routines compute the factorial n!.

### sub doublefact(UInt $n where * ≤ GSL_SF_DOUBLEFACT_NMAX --> Num) is export(:gammabeta)

### sub doublefact-e(UInt $n where * ≤ GSL_SF_DOUBLEFACT_NMAX --> List) is export(:gammabeta)

These routines compute the double factorial n!! = n(n − 2)(n − 4)…

### sub lnfact(UInt $n --> Num) is export(:gammabeta)

### sub lnfact-e(UInt $n --> List) is export(:gammabeta)

These routines compute the logarithm of the factorial of n, log(n!).

### sub lndoublefact(UInt $n --> Num) is export(:gammabeta)

### sub lndoublefact-e(UInt $n --> List) is export(:gammabeta)

These routines compute the logarithm of the double factorial of n, log(n!!).

### sub choose(UInt $n, UInt $m --> Num) is export(:gammabeta)

### sub choose-e(UInt $n, UInt $m --> List) is export(:gammabeta)o

These routines compute the combinatorial factor n choose m = n!/(m!(n − m)!).

### sub lnchoose(UInt $n, UInt $m --> Num) is export(:gammabeta)

### sub lnchoose-e(UInt $n, UInt $m --> List) is export(:gammabeta)

These routines compute the logarithm of n choose m.

### sub taylorcoeff(UInt $n, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta)

### sub taylorcoeff-e(UInt $n, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta)

These routines compute the Taylor coefficient xⁿ/n!.

### sub poch(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta)

### sub poch-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta)

These routines compute the Pochhammer symbol (a)ₓ = Γ(a + x)/Γ(a).

### sub lnpoch(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta)

### sub lnpoch-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta)

These routines compute the Pochhammer symbol log((a)ₓ) = log(Γ(a + x)/Γ(a)).

### sub lnpoch-sgn-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta)

These routines compute the sign of the Pochhammer symbol and the logarithm of its magnitude. It returns three numbers: the value, its associated error, and the sign.

### sub pochrel(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta)

### sub pochrel-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta)

These routines compute the relative Pochhammer symbol ((a)ₓ − 1)/x

### sub gamma-inc(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta)

### sub gamma-inc-e(Num(Cool) $a, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta)

These functions compute the unnormalized incomplete Gamma Function Γ(a, x).

### sub gamma-inc-Q(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta)

### sub gamma-inc-Q-e(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta)

These routines compute the normalized incomplete Gamma Function Q(a, x) = 1/Γ(a).

### sub gamma-inc-P(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta)

### sub gamma-inc-P-e(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta)

These routines compute the complementary normalized incomplete Gamma Function P (a, x).

### sub beta(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> Num) is export(:gammabeta)

### sub beta-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> List) is export(:gammabeta)

These routines compute the Beta Function, B(a, b).

### sub lnbeta(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> Num) is export(:gammabeta)

### sub lnbeta-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> List) is export(:gammabeta)

These routines compute the logarithm of the Beta Function, log(B(a, b)).

### sub beta-inc(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0, Num(Cool) $x where 0 ≤ * ≤ 1 --> Num) is export(:gammabeta)

### sub beta-inc-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0, Num(Cool) $x where 0 ≤ * ≤ 1 --> List) is export(:gammabeta)

These routines compute the normalized incomplete Beta function I x (a, b).

### sub gegenpoly1(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen)

### sub gegenpoly1-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen)

### sub gegenpoly2(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen)

### sub gegenpoly2-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen)

### sub gegenpoly3(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen)

### sub gegenpoly3-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen)

These functions evaluate the Gegenbauer polynomials Cₙλ(x) using explicit representations for n = 1, 2, 3.

### sub gegenpolyn(UInt $n, Num(Cool) $lambda where * > -½, Num(Cool) $x --> Num) is export(:gegen)

### sub gegenpolyn-e(UInt $n, Num(Cool) $lambda where * > -½, Num(Cool) $x --> List) is export(:gegen)

These functions evaluate the Gegenbauer polynomials Cₙλ(x) for a specific value of n, λ, x.

### sub gegenpoly-array(UInt $nmax, Num(Cool) $lambda where * > -½, Num(Cool) $x --> List) is export(:gegen)

This function computes an array of Gegenbauer polynomials Cₙλ(x) for n = 0, 1, 2 … $nmax.

### sub hermite(Int $n, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-e(Int $n, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the physicist Hermite polynomial H n (x) of order n at position x.

### sub hermite-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates all physicist Hermite polynomials H n up to order nmax at position x.

### sub hermite-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite)

### sub hermite-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite)

These routines evaluate the series Σ aⱼHⱼ(x) for j = 0 … n.

### sub hermite-prob(Int $n, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-prob-e(Int $n, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the probabilist Hermite polynomial He n (x) of order n at position x.

### sub hermite-prob-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates all probabilist Hermite polynomials Heₙ(x) up to order nmax at position x.

### sub hermite-prob-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite)

### sub hermite-prob-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite)

These routines evaluate the series Σ aⱼHeⱼ(x) for j = 0 … n.

### sub hermite-der(Int $n, Int $m, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-der-e(Int $n, Int $m, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the m-th derivative of the physicist Hermite polynomial Hₙ(x) of order n at position x.

### sub hermite-array-der(Int $m, Int $nmax, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates the m-th derivative of all physicist Hermite polynomials Hₙ(x) from orders 0 … nmax at position x.

### sub hermite-der-array(Int $mmax, Int $n, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates all derivative orders from 0 … mmax of the physicist Hermite polynomial of order n, Hₙ, at position x.

### sub hermite-prob-der(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-prob-der-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the m-th derivative of the probabilist Hermite polynomial Heₙ(x) of order n at position x.

### sub hermite-prob-array-der(Int $m, Int $nmax, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates the m-th derivative of all probabilist Hermite polynomials Heₙ(x) from orders 0 … nmax at position x.

### sub hermite-prob-der-array(Int $mmax, Int $n, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates all derivative orders from 0 … mmax of the probabilist Hermite polynomial of order n, Heₙ, at position x.

### sub hermite-func(Int $n, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-func-e(Int $n, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the Hermite function ψₙ(x) of order n at position x.

### sub hermite-func-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite)

This routine evaluates all Hermite functions ψₙ(x) for orders n = 0 … nmax at position x.

### sub hermite-func-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite)

### sub hermite-func-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite)

These routines evaluate the series Σ aⱼψⱼ(x) for j = 0 … n.

### sub hermite-func-der(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hermite)

### sub hermite-func-der-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hermite)

These routines evaluate the m-th derivative of the Hermite function ψₙ(x) of order n at position x.

### sub hermite-zero(Int $n, Int $s --> Num) is export(:hermite)

### sub hermite-zero-e(Int $n, Int $s --> List) is export(:hermite)

These routines evaluate the s-th zero of the physicist Hermite polynomial Hₙ(x) of order n.

### sub hermite-prob-zero(Int $n, Int $s --> Num) is export(:hermite)

### sub hermite-prob-zero-e(Int $n, Int $s --> List) is export(:hermite)

These routines evaluate the s-th zero of the probabilist Hermite polynomial Heₙ(x) of order n.

### sub hermite-func-zero(Int $n, Int $s --> Num) is export(:hermite)

### sub hermite-func-zero-e(Int $n, Int $s --> List) is export(:hermite)

These routines evaluate the s-th zero of the Hermite function ψₙ(x) of order n.

### sub F01(Num(Cool) $c, Num(Cool) $x --> Num) is export(:hyperg)

### sub F01-e(Num(Cool) $c, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the hypergeometric function ₀F₁(c, x).

### sub F11(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg)

### sub F11-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the confluent hypergeometric function ₁F₁(a, b, x).

### sub F11-int(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hyperg)

### sub F11-int-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the confluent hypergeometric function ₁F₁(m, n, x) for integer parameters m, n.

### sub U(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg)

### sub U-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the confluent hypergeometric function U(a, b, x).

### sub U-e10(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg)

This routine computes the confluent hypergeometric function U(a, b, x) and returns a result with extended range. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub U-int(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hyperg)

### sub U-int-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the confluent hypergeometric function U(m, n, x) for integer parameters m, n.

### sub U-int-e10(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg)

This routine computes the confluent hypergeometric function U(m, n, x) for integer parameters m, n and returns a result with extended range. It returns a list of three numbers: the value, the error, and the scaling exponent.

### sub F21(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x --> Num) is export(:hyperg)

### sub F21-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the Gauss hypergeometric function ₂F₁(a, b, c, x).

### sub F21-conj(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg)

### sub F21-conj-e(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg)

These routines compute the Gauss hypergeometric function ₂F₁(aᵣ + iaᵢ, aᵣ − iaᵢ, c, x).

### sub F21-renorm(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg)

### sub F21-renorm-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg)

These routines compute the renormalized Gauss hypergeometric function ₂F₁(a, b, c, x)/Γ(c).

### sub F21-conj-renorm(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg)

### sub F21-conj-renorm-e(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg)

These routines compute the renormalized Gauss hypergeometric function ₂F₁(aᵣ + iaᵢ, aᵣ − iaᵢ, c, x)/Γ(c).

### sub F20(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg)

### sub F20-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg)

These routines compute the hypergeometric function ₂F₀(a, b, x).

### sub laguerre1(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre)

### sub laguerre1-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre)

### sub laguerre2(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre)

### sub laguerre2-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre)

### sub laguerre3(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre)

### sub laguerre3-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre)

These routines evaluate the generalized Laguerre polynomials L₁a(x), L₂a(x), L₃a(x) using explicit representations.

### sub laguerre-n(UInt $n, Num(Cool) $a where * > -1, Num(Cool) $x --> Num) is export(:laguerre)

### sub laguerre-n-e(UInt $n, Num(Cool) $a where * > -1, Num(Cool) $x --> List) is export(:laguerre)

These routines evaluate the generalized Laguerre polynomials Lₙa(x).

### sub lambert-W0(Num(Cool) $x --> Num) is export(:lambert)

### sub lambert-W0-e(Num(Cool) $x --> List) is export(:lambert)

These compute the principal branch of the Lambert W function, W₀(x).

### sub lambert-Wm1(Num(Cool) $x --> Num) is export(:lambert)

### sub lambert-Wm1-e(Num(Cool) $x --> List) is export(:lambert)

These compute the principal branch of the Lambert W function, W₋₁(x).

### sub legendre-P1(Num(Cool) $x --> Num) is export(:legendre)

### sub legendre-P1-e(Num(Cool) $x --> List) is export(:legendre)

### sub legendre-P2(Num(Cool) $x --> Num) is export(:legendre)

### sub legendre-P2-e(Num(Cool) $x --> List) is export(:legendre)

### sub legendre-P3(Num(Cool) $x --> Num) is export(:legendre)

### sub legendre-P3-e(Num(Cool) $x --> List) is export(:legendre)

These functions evaluate the Legendre polynomials Pₗ(x) using explicit representations for l = 1, 2, 3.

### sub legendre-Pl(UInt $l, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre)

### sub legendre-Pl-e(UInt $l, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

These functions evaluate the Legendre polynomial Pₗ(x) for a specific value of l, x.

### sub legendre-Pl-array(UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-Pl-deriv-array(UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

These functions compute arrays of Legendre polynomials Pₗ(x) and derivatives dPₗ(x)/dx for l = 0 … lmax.

### sub legendre-Q0(Num(Cool) $x where

### sub legendre-Q0-e(Num(Cool) $x where

These routines compute the Legendre function Q₀(x).

### sub legendre-Q1(Num(Cool) $x where

### sub legendre-Q1-e(Num(Cool) $x where

These routines compute the Legendre function Q₁(x).

### sub legendre-Ql(UInt $l, Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> Num) is export(:legendre)

### sub legendre-Ql-e(UInt $l, Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> List) is export(:legendre)

These routines compute the Legendre function Qₗ(x).

### sub legendre-array-index(UInt $l, UInt $n --> UInt) is export(:legendre)

This function returns the index into the result array, corresponding to Pⁿₗ(x), P’ⁿₗ, or P”ⁿₗ(x).

### sub legendre-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre)

These functions calculate all normalized associated Legendre polynomials. The parameter norm specifies the normalization to be used.

### sub legendre-deriv-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-deriv-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre)

These functions calculate all normalized associated Legendre functions and their first derivatives up to degree lmax. The parameter norm specifies the normalization to be used. They return a List of Pairs (that can be read as a Hash):

  * :out array of Pⁿₗ(x) values

  * :derout array of dPⁿₗ(x)/dx values

### sub legendre-deriv-alt-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-deriv-alt-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre)

These functions calculate all normalized associated Legendre functions and their (alternate) first derivatives up to degree lmax. The parameter norm specifies the normalization to be used. To include or exclude the Condon-Shortley phase factor of (−1)ⁿ, set the parameter csphase to either −1 or 1 respectively. They return a List of Pairs (that can be read as a Hash):

  * :out array of Pⁿₗ(x) values

  * :derout array of dPⁿₗ(x)/dx values

### sub legendre-deriv2-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-deriv2-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre)

These functions calculate all normalized associated Legendre functions and their first and second derivatives up to degree lmax. The parameter norm specifies the normalization to be used. They return a List of Pairs (that can be read as a Hash):

  * :out array of Pⁿₗ(x) values

  * :derout array of dPⁿₗ(x)/dx values

  * :derout2 array of d²Pⁿₗ(x)/d²x values

### sub legendre-deriv2-alt-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

### sub legendre-deriv2-alt-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre)

These functions calculate all normalized associated Legendre functions and their (alternate) first and second derivatives up to degree lmax. The parameter norm specifies the normalization to be used. To include or exclude the Condon-Shortley phase factor of (−1)ⁿ, set the parameter csphase to either −1 or 1 respectively. They return a List of Pairs (that can be read as a Hash):

  * :out array of normalized Pⁿₗ(x) values

  * :derout array of dPⁿₗ(cos(θ))/dθ values

  * :derout2 array of d²Pⁿₗ(cos(θ))/d²θ values

### sub legendre-Plm(UInt $l, UInt $n, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre)

### sub legendre-Plm-e(UInt $l, UInt $n, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

These routines compute the associated Legendre polynomial Pⁿₗ(x).

### sub legendre-sphPlm(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre)

### sub legendre-sphPlm-e(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre)

These routines compute the normalized associated Legendre polynomial.

### sub conicalP-half(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP-half-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the irregular Spherical Conical Function.

### sub conicalP-mhalf(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP-mhalf-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the regular Spherical Conical Function.

### sub conicalP0(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP0-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the conical function P⁰.

### sub conicalP1(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP1-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the conical function P¹.

### sub conicalP-sph-reg(Int $l where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP-sph-reg-e(Int $l where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the Regular Spherical Conical Function.

### sub conicalP-cyl-reg(Int $m where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre)

### sub conicalP-cyl-reg-e(Int $m where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre)

These routines compute the Regular Cylindrical Conical Function.

### sub legendre-H3d0(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre)

### sub legendre-H3d0-e(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre)

These routines compute the zeroth radial eigenfunction of the Laplacian on the 3-dimensional hyperbolic space.

### sub legendre-H3d1(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre)

### sub legendre-H3d1-e(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre)

These routines compute the first radial eigenfunction of the Laplacian on the 3-dimensional hyperbolic space.

### sub legendre-H3d(UInt $l, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre)

### sub legendre-H3d-e(UInt $l, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre)

These routines compute the l-th radial eigenfunction of the Laplacian on the 3-dimensional hyperbolic space.

### sub legendre-H3d-array(UInt $lmax, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre)

This function computes an array of radial eigenfunctions.

### sub gsl-log(Num(Cool) $x where * > 0 --> Num) is export(:log)

### sub gsl-log-e(Num(Cool) $x where * > 0 --> List) is export(:log)

These routines compute the logarithm of x.

### sub gsl-log-abs(Num(Cool) $x where * ≠ 0 --> Num) is export(:log)

### sub gsl-log-abs-e(Num(Cool) $x where * ≠ 0 --> List) is export(:log)

These routines compute the logarithm of the magnitude of x.

### sub gsl-log-complex-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:log)

This routine computes the complex logarithm of z = zᵣ + izᵢ. The returned parameters are the radial part, its error, θ in the range [−π, π], and its error.

### sub gsl-log1plusx(Num(Cool) $x where * > -1 --> Num) is export(:log)

### sub gsl-log1plusx-e(Num(Cool) $x where * > -1 --> List) is export(:log)

These routines compute log(1 + x).

### sub gsl-log1plusx-mx(Num(Cool) $x where * > -1 --> Num) is export(:log)

### sub gsl-log1plusx-mx-e(Num(Cool) $x where * > -1 --> List) is export(:log)

These routines compute log(1 + x) − x.

### sub mathieu-a(Int $n, Num(Cool) $q --> Num) is export(:mathieu)

### sub mathieu-a-e(Int $n, Num(Cool) $q --> List) is export(:mathieu)

### sub mathieu-b(Int $n, Num(Cool) $q --> Num) is export(:mathieu)

### sub mathieu-b-e(Int $n, Num(Cool) $q --> List) is export(:mathieu)

These routines compute the characteristic values aₙ(q), bₙ(q) of the Mathieu functions ceₙ(q, x) and seₙ(q, x), respectively.

### sub mathieu-a-array(Int $order-min, Int $order-max, Num(Cool) $q --> List) is export(:mathieu)

### sub mathieu-b-array(Int $order-min, Int $order-max, Num(Cool) $q --> List) is export(:mathieu)

These routines compute a series of Mathieu characteristic values aₙ(q), bₙ(q) for n from order_min to order_max inclusive.

### sub mathieu-ce(Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu)

### sub mathieu-ce-e(Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

### sub mathieu-se(Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu)

### sub mathieu-se-e(Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

These routines compute the angular Mathieu functions ceₙ(q, x) and seₙ(q, x), respectively.

### sub mathieu-ce-array(Int $order-min, Int $order-max, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

### sub mathieu-se-array(Int $order-min, Int $order-max, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

These routines compute a series of the angular Mathieu functions ceₙ(q, x) and seₙ(q, x) of order n from nmin to nmax inclusive.

### sub mathieu-Mc(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu)

### sub mathieu-Mc-e(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

### sub mathieu-Ms(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu)

### sub mathieu-Ms-e(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

These routines compute the radial j-th kind Mathieu functions Mcₙ(q, x) and Msₙ(q, x) of order n.

### sub mathieu-Mc-array(Int $j where * == 1|2, Int $nmin, Int $nmax, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

### sub mathieu-Ms-array(Int $j where * == 1|2, Int $nmin, Int $nmax, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu)

These routines compute a series of the radial Mathieu functions of kind j, with order from nmin to nmax inclusive.

### sub pow-int(Num(Cool) $x, Int $n --> Num) is export(:pow)

### sub pow-int-e(Num(Cool) $x, Int $n --> List) is export(:pow)

These routines compute the power xⁿ for integer n.

### sub psi-int(UInt $n where * > 0 --> Num) is export(:psi)

### sub psi-int-e(UInt $n where * > 0 --> List) is export(:psi)

These routines compute the digamma function ψ(n) for positive integer n.

### sub psi(Num(Cool) $x where * ≠ 0 --> Num) is export(:psi)

### sub psi-e(Num(Cool) $x where * ≠ 0 --> List) is export(:psi)

These routines compute the digamma function ψ(x) for general x.

### sub psi1piy(Num(Cool) $y --> Num) is export(:psi)

### sub psi1piy-e(Num(Cool) $y --> List) is export(:psi)

These routines compute the real part of the digamma function on the line 1 + iy.

### sub psi1-int(UInt $n where * > 0 --> Num) is export(:psi)

### sub psi1-int-e(UInt $n where * > 0 --> List) is export(:psi)

These routines compute the Trigamma function ψ’(n) for positive integer n.

### sub psi1(Num(Cool) $x --> Num) is export(:psi)

### sub psi1-e(Num(Cool) $x --> List) is export(:psi)

These routines compute the Trigamma function ψ’(x) for general x.

### sub psin(UInt $n, Num(Cool) $x where * > 0 --> Num) is export(:psi)

### sub psin-e(UInt $n, Num(Cool) $x where * > 0 --> List) is export(:psi)

These routines compute the polygamma function ψ⁽ⁿ⁾(x).

### sub synchrotron1(Num(Cool) $x where * ≥ 0 --> Num) is export(:sync)

### sub synchrotron1-e(Num(Cool) $x where * ≥ 0 --> List) is export(:sync)

These routines compute the first synchrotron function.

### sub synchrotron2(Num(Cool) $x where * ≥ 0 --> Num) is export(:sync)

### sub synchrotron2-e(Num(Cool) $x where * ≥ 0 --> List) is export(:sync)

These routines compute the second synchrotron function.

### sub transport2(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport)

### sub transport2-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport)

These routines compute the transport function J(2, x).

### sub transport3(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport)

### sub transport3-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport)

These routines compute the transport function J(3, x).

### sub transport4(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport)

### sub transport4-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport)

These routines compute the transport function J(4, x).

### sub transport5(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport)

### sub transport5-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport)

These routines compute the transport function J(5, x).

### sub gsl-sin(Num(Cool) $x --> Num) is export(:trig)

### sub gsl-sin-e(Num(Cool) $x --> List) is export(:trig)

These routines compute the sine function sin(x).

### sub gsl-cos(Num(Cool) $x --> Num) is export(:trig)

### sub gsl-cos-e(Num(Cool) $x --> List) is export(:trig)

These routines compute the cosine function cos(x).

### sub gsl-hypot(Num(Cool) $x, Num(Cool) $y --> Num) is export(:trig)

### sub gsl-hypot-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:trig)

These routines compute the hypotenuse function.

### sub gsl-sinc(Num(Cool) $x --> Num) is export(:trig)

### sub gsl-sinc-e(Num(Cool) $x --> List) is export(:trig)

These routines compute sinc(x) = sin(πx)/(πx).

### sub gsl-complex-sin-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig)

This function computes the complex sine.

### sub gsl-complex-cos-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig)

This function computes the complex cosine.

### sub gsl-complex-logsin-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig)

This function computes the logarithm of the complex sine.

### sub gsl-lnsinh(Num(Cool) $x where * > 0 --> Num) is export(:trig)

### sub gsl-lnsinh-e(Num(Cool) $x where * > 0 --> List) is export(:trig)

These routines compute log(sinh(x)).

### sub gsl-lncosh(Num(Cool) $x --> Num) is export(:trig)

### sub gsl-lncosh-e(Num(Cool) $x --> List) is export(:trig)

These routines compute log(cosinh(x)).

### sub polar-to-rect(Num(Cool) $r, Num(Cool) $θ where -π ≤ * ≤ π --> List) is export(:trig)

This function converts the polar coordinates (r, θ) to rectilinear coordinates (x, y).

### sub rect-to-polar(Num(Cool) $x, Num(Cool) $y --> List) is export(:trig)

This function converts the rectilinear coordinates (x, y) to polar coordinates (r, θ).

### sub angle-restrict-symm(Num(Cool) $θ --> Num) is export(:trig)

### sub angle-restrict-symm-e(Num(Cool) $θ --> Num) is export(:trig)

These routines force the angle θ to lie in the range (−π, π].

### sub angle-restrict-pos(Num(Cool) $θ --> Num) is export(:trig)

### sub angle-restrict-pos-e(Num(Cool) $θ --> Num) is export(:trig)

These routines force the angle θ to lie in the range [0, 2π).

### sub gsl-sin-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:trig)

This routine computes the sine of an angle x with an associated absolute error dx, sin(x ± dx).

### sub gsl-cos-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:trig)

This routine computes the cosine of an angle x with an associated absolute error dx, cosin(x ± dx).

### sub zeta-int(Int $n where * ≠ 1 --> Num) is export(:zeta)

### sub zeta-int-e(Int $n where * ≠ 1 --> List) is export(:zeta)

These routines compute the Riemann zeta function ζ(n).

### sub zeta(Num(Cool) $s where * ≠ 1 --> Num) is export(:zeta)

### sub zeta-e(Num(Cool) $s where * ≠ 1 --> List) is export(:zeta)

These routines compute the Riemann zeta function ζ(s) for arbitrary s.

### sub zetam1-int(Int $n where * ≠ 1 --> Num) is export(:zeta)

### sub zetam1-int-e(Int $n where * ≠ 1 --> List) is export(:zeta)

These routines compute ζ(n) − 1 for integer n.

### sub zetam1(Num(Cool) $s where * ≠ 1 --> Num) is export(:zeta)

### sub zetam1-e(Num(Cool) $s where * ≠ 1 --> List) is export(:zeta)

These routines compute ζ(s) − 1 for arbitrary s.

### sub hzeta(Num(Cool) $s where * > 1, Num(Cool) $q where * > 0 --> Num) is export(:zeta)

### sub hzeta-e(Num(Cool) $s where * > 1, Num(Cool) $q where * > 0 --> List) is export(:zeta)

These routines compute the Hurwitz zeta function ζ(s, q).

### sub eta-int(Int $n --> Num) is export(:zeta)

### sub eta-int-e(Int $n --> List) is export(:zeta)

These routines compute the eta function η(n) for integer n.

### sub eta(Num(Cool) $s --> Num) is export(:zeta)

### sub eta-e(Num(Cool) $s --> List) is export(:zeta)

These routines compute the eta function η(s) for arbitrary s.

C Library Documentation
=======================

For more details on libgsl see [https://www.gnu.org/software/gsl/](https://www.gnu.org/software/gsl/). The excellent C Library manual is available here [https://www.gnu.org/software/gsl/doc/html/index.html](https://www.gnu.org/software/gsl/doc/html/index.html), or here [https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf](https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf) in PDF format.

Prerequisites
=============

This module requires the libgsl library to be installed. Please follow the instructions below based on your platform:

Debian Linux
------------

    sudo apt-get install libgsl23

Installation
============

To install it using zef (a module management tool):

    $ zef install Math::Libgsl

AUTHOR
======

Fernando Santagata <nando.santagata@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.


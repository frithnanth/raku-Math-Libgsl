use v6;

unit module Math::Libgsl::Raw::Complex:ver<0.0.3>:auth<cpan:FRITH>;

use NativeCall;
use LibraryMake;

constant GSLHELPER = %?RESOURCES<libraries/gslhelper>.absolute;

constant LIB  = ('gsl', v23);

class gsl_complex is repr('CStruct') is export {
  HAS num64 @.dat[2] is CArray;
}

class gsl_complex_float is repr('CStruct') is export {
  HAS num32 @.dat[2] is CArray;
}

# Representation
sub alloc_gsl_complex(--> gsl_complex) is native(GSLHELPER) is export { * }
sub free_gsl_complex(gsl_complex $c) is native(GSLHELPER) is export { * }
sub mgsl_complex_rect(num64 $x, num64 $y, gsl_complex $c) is native(GSLHELPER) is export { * }
sub mgsl_complex_polar(num64 $r, num64 $theta, gsl_complex $c) is native(GSLHELPER) is export { * }
# Properties
sub mgsl_complex_arg(gsl_complex $a --> num64) is native(GSLHELPER) is export(:prop) { * }
sub mgsl_complex_abs(gsl_complex $a --> num64) is native(GSLHELPER) is export(:prop) { * }
sub mgsl_complex_abs2(gsl_complex $a --> num64) is native(GSLHELPER) is export(:prop) { * }
sub mgsl_complex_logabs(gsl_complex $a --> num64) is native(GSLHELPER) is export(:prop) { * }
# Arithmetic operators
sub mgsl_complex_add(gsl_complex $a, gsl_complex $b, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_sub(gsl_complex $a, gsl_complex $b, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_mul(gsl_complex $a, gsl_complex $b, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_div(gsl_complex $a, gsl_complex $b, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_add_real(gsl_complex $a, num64 $x, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_sub_real(gsl_complex $a, num64 $x, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_mul_real(gsl_complex $a, num64 $x, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_div_real(gsl_complex $a, num64 $x, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_add_imag(gsl_complex $a, num64 $y, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_sub_imag(gsl_complex $a, num64 $y, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_mul_imag(gsl_complex $a, num64 $y, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_div_imag(gsl_complex $a, num64 $y, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_conjugate(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_inverse(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
sub mgsl_complex_negative(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:arith) { * }
# Elementary Complex Functions
sub mgsl_complex_sqrt(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_sqrt_real(num64 $x, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_pow(gsl_complex $z, gsl_complex $a, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_pow_real(gsl_complex $z, num64 $a, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_exp(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_log(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_log10(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
sub mgsl_complex_log_b(gsl_complex $z, gsl_complex $b, gsl_complex $res) is native(GSLHELPER) is export(:elem) { * }
# Complex Trigonometric Functions
sub mgsl_complex_sin(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
sub mgsl_complex_cos(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
sub mgsl_complex_tan(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
sub mgsl_complex_sec(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
sub mgsl_complex_csc(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
sub mgsl_complex_cot(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:trig) { * }
# Inverse Complex Trigonometric Functions
sub mgsl_complex_arcsin(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arcsin_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arccos(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arccos_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arctan(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arcsec(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arcsec_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arccsc(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arccsc_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
sub mgsl_complex_arccot(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invtrig) { * }
# Complex Hyperbolic Functions
sub mgsl_complex_sinh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
sub mgsl_complex_cosh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
sub mgsl_complex_tanh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
sub mgsl_complex_sech(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
sub mgsl_complex_csch(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
sub mgsl_complex_coth(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:hyperb) { * }
# Inverse Complex Hyperbolic Functions
sub mgsl_complex_arcsinh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arccosh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arccosh_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arctanh(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arctanh_real(num64 $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arcsech(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arccsch(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }
sub mgsl_complex_arccoth(gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:invhyperb) { * }

use v6;

unit module Math::Libgsl::Raw::Polynomial:ver<0.0.4>:auth<cpan:FRITH>;

use NativeCall;
use LibraryMake;
use Math::Libgsl::Raw::Complex;

constant GSLHELPER = %?RESOURCES<libraries/gslhelper>.absolute;

constant LIB  = ('gsl', v23);

# Polynomial evaluation
sub gsl_poly_eval(CArray[num64] $c, int32 $length, num64 $x --> num64) is native(LIB) is export(:eval) { * }
sub mgsl_poly_complex_eval(CArray[num64] $c, int32 $length, gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:eval) { * }
sub mgsl_complex_poly_complex_eval(CArray[gsl_complex] $c, size_t $len, gsl_complex $z, gsl_complex $res) is native(GSLHELPER) is export(:eval) { * }
sub gsl_poly_eval_derivs(CArray[num64] $c, size_t $lenc, num64 $x, CArray[num64] $res, size_t $lenres --> int32) is native(LIB) is export(:eval) { * }
# Divided difference representation of polynomials
sub gsl_poly_dd_init(CArray[num64] $dd, CArray[num64] $xa, CArray[num64] $ya, size_t $size --> int32) is native(LIB) is export(:divdiff) { * }
sub gsl_poly_dd_eval(CArray[num64] $dd, CArray[num64] $xa, size_t $size, num64 $x --> num64) is native(LIB) is export(:divdiff) { * }
sub gsl_poly_dd_taylor(CArray[num64] $c, num64 $xp, CArray[num64] $dd, CArray[num64] $xa, size_t $size, CArray[num64] $w --> int32) is native(LIB) is export(:divdiff) { * }
sub gsl_poly_dd_hermite_init(CArray[num64] $dd, CArray[num64] $za, CArray[num64] $xa, CArray[num64] $ya, CArray[num64] $dya, size_t $size --> int32) is native(LIB) is export(:divdiff) { * }
# Quadratic equations
sub gsl_poly_solve_quadratic(num64 $a, num64 $b, num64 $c, num64 $x0 is rw, num64 $x1 is rw --> int32) is native(LIB) is export(:quad) { * }
sub gsl_poly_complex_solve_quadratic(num64 $a, num64 $b, num64 $c, gsl_complex $z0 is rw, gsl_complex $z1 is rw --> int32) is native(LIB) is export(:quad) { * }
# Cubic equations
sub gsl_poly_solve_cubic(num64 $a, num64 $b, num64 $c, num64 $x0 is rw, num64 $x1 is rw, num64 $x2 is rw --> int32) is native(LIB) is export(:cubic) { * }
sub gsl_poly_complex_solve_cubic(num64 $a, num64 $b, num64 $c, gsl_complex $z0 is rw, gsl_complex $z1, gsl_complex $z2 is rw --> int32) is native(LIB) is export(:cubic) { * }
# General polynomial equations
class gsl_poly_complex_workspace is repr('CStruct') is export(:complexsolve) {
  has size_t  $.nc;
  has Pointer $.matrix;
}
sub gsl_poly_complex_workspace_alloc(size_t $n --> gsl_poly_complex_workspace) is native(LIB) is export(:complexsolve) { * }
sub gsl_poly_complex_workspace_free(gsl_poly_complex_workspace $w) is native(LIB) is export(:complexsolve) { * }
sub gsl_poly_complex_solve(CArray[num64] $a, size_t $n, gsl_poly_complex_workspace $w, CArray[num64] $z --> int32) is native(LIB) is export(:complexsolve) { * }

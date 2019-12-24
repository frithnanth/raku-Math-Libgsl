use v6.c;

unit module Math::Libgsl::Raw::Elementary:ver<0.0.2>:auth<cpan:FRITH>;

use NativeCall;

constant LIB  = ('gsl', v23);

# Test functions
sub gsl_isnan(num64 $x --> int32) is native(LIB) is export(:test) { * }
sub gsl_isinf(num64 $x --> int32) is native(LIB) is export(:test) { * }
sub gsl_finite(num64 $x --> int32) is native(LIB) is export(:test) { * }
# Elementary functions
sub gsl_log1p(num64 $x --> num64) is native(LIB) is export(:elem) { * }
sub gsl_expm1(num64 $x --> num64) is native(LIB) is export(:elem) { * }
sub gsl_hypot(num64 $x, num64 $y --> num64) is native(LIB) is export(:elem) { * }
sub gsl_hypot3(num64 $x, num64 $y, num64 $z --> num64) is native(LIB) is export(:elem) { * }
sub gsl_asinh(num64 $x --> num64) is native(LIB) is export(:elem) { * }
sub gsl_acosh(num64 $x --> num64) is native(LIB) is export(:elem) { * }
sub gsl_atanh(num64 $x --> num64) is native(LIB) is export(:elem) { * }
sub gsl_ldexp(num64 $x, int32 $e --> num64) is native(LIB) is export(:elem) { * }
sub gsl_frexp(num64 $x, int32 $e is rw --> num64) is native(LIB) is export(:elem) { * }
# Small integer powers
sub gsl_pow_int(num64 $x, int32 $n --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_uint(num64 $x, uint32 $n --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_2(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_3(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_4(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_5(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_6(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_7(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_8(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
sub gsl_pow_9(num64 $x --> num64) is native(LIB) is export(:smallint) { * }
# Approximate Comparison of Floating Point Numbers
sub gsl_fcmp(num64 $x, num64 $y, num64 $ε --> int32) is native(LIB) is export(:approx) { * }

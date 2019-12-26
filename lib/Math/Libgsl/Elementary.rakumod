use v6;

unit module Math::Libgsl::Elementary:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Elementary :ALL;

# Elementary functions
sub log1p(Num(Cool) $x --> Num) is export(:elem) { gsl_log1p($x) }
sub expm1(Num(Cool) $x --> Num) is export(:elem) { gsl_expm1($x) }
sub hypot(Num(Cool) $x, Num(Cool) $y --> Num) is export(:elem) { gsl_hypot($x, $y) }
sub hypot3(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z --> Num) is export(:elem) { gsl_hypot3($x, $y, $z) }
sub asinh(Num(Cool) $x --> Num) is export(:elem) { gsl_asinh($x) }
sub acosh(Num(Cool) $x --> Num) is export(:elem) { gsl_acosh($x) }
sub atanh(Num(Cool) $x --> Num) is export(:elem) { gsl_atanh($x) }
sub ldexp(Num(Cool) $x, Int $e --> Num) is export(:elem) { gsl_ldexp($x, $e) }
sub frexp(Num(Cool) $x --> List) is export(:elem) { my int32 $e = 0; my $f = gsl_frexp($x, $e); $f, $e }
# Small integer powers
sub int-pow(Num(Cool) $x, Int $e --> Num) is export(:smallint) { gsl_pow_int($x, $e) }
sub uint-pow(Num(Cool) $x, UInt $e --> Num) is export(:smallint) { gsl_pow_uint($x, $e) }
sub pow2(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_2($x) }
sub pow3(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_3($x) }
sub pow4(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_4($x) }
sub pow5(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_5($x) }
sub pow6(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_6($x) }
sub pow7(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_7($x) }
sub pow8(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_8($x) }
sub pow9(Num(Cool) $x --> Num) is export(:smallint) { gsl_pow_9($x) }
# Approximate Comparison of Floating Point Numbers
sub fcmp(Num(Cool) $x, Num(Cool) $y, Num(Cool) $ε --> Bool) is export(:approx) { gsl_fcmp($x, $y, $ε) == 0 ?? True !! False }

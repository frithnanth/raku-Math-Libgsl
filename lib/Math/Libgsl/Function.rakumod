use v6.c;

unit module Math::Libgsl::Function:ver<0.0.1>:auth<cpan:FRITH>;

use NativeCall;
use Math::Libgsl::Raw::Function :ALL;
use Math::Libgsl::Exception;
use Math::Libgsl::Constants;

# Airy Functions
sub Ai(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Ai($x, $mode);
}
sub Ai-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Ai_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Bi($x, $mode);
}
sub Bi-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Bi_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Ai-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Ai_scaled($x, $mode);
}
sub Ai-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Ai_scaled_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Bi_scaled($x, $mode);
}
sub Bi-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Bi_scaled_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Derivatives of Airy Functions
sub Ai-deriv(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Ai_deriv($x, $mode);
}
sub Ai-deriv-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Ai_deriv_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi-deriv(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Bi_deriv($x, $mode);
}
sub Bi-deriv-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Bi_deriv_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Ai-deriv-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Ai_deriv_scaled($x, $mode);
}
sub Ai-deriv-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Ai_deriv_scaled_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi-deriv-scaled(Num(Cool) $x, UInt $mode --> Num) is export(:airy) {
  gsl_sf_airy_Bi_deriv_scaled($x, $mode);
}
sub Bi-deriv-scaled-e(Num(Cool) $x, UInt $mode --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_Bi_deriv_scaled_e($x, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Zeros of Airy Functions
sub Ai-zero(UInt $s --> Num) is export(:airy) {
  gsl_sf_airy_zero_Ai($s);
}
sub Ai-zero-e(UInt $s --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_zero_Ai_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi-zero(UInt $s --> Num) is export(:airy) {
  gsl_sf_airy_zero_Bi($s);
}
sub Bi-zero-e(UInt $s --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_zero_Bi_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Zeros of Derivatives of Airy Functions
sub Ai-deriv-zero(UInt $s --> Num) is export(:airy) {
  gsl_sf_airy_zero_Ai_deriv($s);
}
sub Ai-deriv-zero-e(UInt $s --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_zero_Ai_deriv_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Bi-deriv-zero(UInt $s --> Num) is export(:airy) {
  gsl_sf_airy_zero_Bi_deriv($s);
}
sub Bi-deriv-zero-e(UInt $s --> List) is export(:airy) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_airy_zero_Bi_deriv_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Regular Cylindrical Bessel Functions
sub J0(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_J0($x);
}
sub J0-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_J0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub J1(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_J1($x);
}
sub J1-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_J1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Jn(Int $n, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_Jn($n, $x);
}
sub Jn-e(Int $n, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Jn_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Jn-array(Int $nmin, Int $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_Jn_array($nmin, $nmax, $x, $out);
  return $out.list;
}
sub Y0(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Y0($x);
}
sub Y0-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Y0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Y1(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Y1($x);
}
sub Y1-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Y1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Yn(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Yn($n, $x);
}
sub Yn-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Yn_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Yn-array(Int $nmin, Int $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_Yn_array($nmin, $nmax, $x, $out);
  return $out.list;
}
# Regular Modified Cylindrical Bessel Functions
sub I0(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_I0($x);
}
sub I0-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_I0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub I1(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_I1($x);
}
sub I1-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_I1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub In(Int $n, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_In($n, $x);
}
sub In-e(Int $n, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_In_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub In-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_In_array($nmin, $nmax, $x, $out);
  return $out.list;
}
sub I0-scaled(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_I0_scaled($x);
}
sub I0-scaled-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_I0_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub I1-scaled(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_I1_scaled($x);
}
sub I1-scaled-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_I1_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub In-scaled(Int $n, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_In_scaled($n, $x);
}
sub In-scaled-e(Int $n, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_In_scaled_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub In-scaled-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_In_scaled_array($nmin, $nmax, $x, $out);
  return $out.list;
}
sub K0(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_K0($x);
}
sub K0-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_K0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub K1(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_K1($x);
}
sub K1-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_K1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Kn(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Kn($n, $x);
}
sub Kn-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Kn_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Kn-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_Kn_array($nmin, $nmax, $x, $out);
  return $out.list;
}
sub K0-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_K0_scaled($x);
}
sub K0-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_K0_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub K1-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_K1_scaled($x);
}
sub K1-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_K1_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Kn-scaled(Int $n, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Kn_scaled($n, $x);
}
sub Kn-scaled-e(Int $n, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Kn_scaled_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Kn-scaled-array(UInt $nmin, UInt $nmax where $nmin < $nmax, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  gsl_sf_bessel_Kn_scaled_array($nmin, $nmax, $x, $out);
  return $out.list;
}
sub j0(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_j0($x);
}
sub j0-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_j0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub j1(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_j1($x);
}
sub j1-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_j1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub j2(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_j2($x);
}
sub j2-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_j2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub jl(UInt $l, Num(Cool) $x where * ≥ 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_jl($l, $x);
}
sub jl-e(UInt $l, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_jl_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub jl-array(UInt $lmax, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $lmax + 1;
  gsl_sf_bessel_jl_array($lmax, $x, $out);
  return $out.list;
}
sub jl-steed-array(UInt $lmax, Num(Cool) $x where * ≥ 0 --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $lmax + 1;
  gsl_sf_bessel_jl_steed_array($lmax, $x, $out);
  return $out.list;
}
# Irregular Spherical Bessel Functions
sub y0(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_y0($x);
}
sub y0-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_y0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub y1(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_y1($x);
}
sub y1-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_y1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub y2(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_y2($x);
}
sub y2-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_y2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub yl(UInt $l, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_yl($l, $x);
}
sub yl-e(UInt $l, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_yl_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub yl-array(UInt $lmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $lmax + 1;
  gsl_sf_bessel_yl_array($lmax, $x, $out);
  return $out.list;
}
# Regular Modified Spherical Bessel Functions
sub i0-scaled(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_i0_scaled($x);
}
sub i0-scaled-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_i0_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub i1-scaled(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_i1_scaled($x);
}
sub i1-scaled-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_i1_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub i2-scaled(Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_i2_scaled($x);
}
sub i2-scaled-e(Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_i2_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub il-scaled(UInt $l, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_il_scaled($l, $x);
}
sub il-scaled-e(UInt $l, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_il_scaled_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub il-scaled-array(UInt $lmax, Num(Cool) $x --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $lmax + 1;
  gsl_sf_bessel_il_scaled_array($lmax, $x, $out);
  return $out.list;
}
# Irregular Modified Spherical Bessel Functions
sub k0-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_k0_scaled($x);
}
sub k0-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_k0_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub k1-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_k1_scaled($x);
}
sub k1-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_k1_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub k2-scaled(Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_k2_scaled($x);
}
sub k2-scaled-e(Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_k2_scaled_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub kl-scaled(UInt $l, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_kl_scaled($l, $x);
}
sub kl-scaled-e(UInt $l, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_kl_scaled_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub kl-scaled-array(UInt $lmax, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my $out = CArray[num64].allocate: $lmax + 1;
  gsl_sf_bessel_kl_scaled_array($lmax, $x, $out);
  return $out.list;
}
# Regular Bessel Function—Fractional Order
sub Jnu(Num(Cool) $ν, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_Jnu($ν.Num, $x);
}
sub Jnu-e(Num(Cool) $ν, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Jnu_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Jnu-sequence(Num(Cool) $ν, UInt $mode, Positional $x --> List) is export(:bessel) {
  my CArray[num64] $v .= new: $x».Num;
  my $ret = gsl_sf_bessel_sequence_Jnu_e($ν, $mode, $v.elems, $v);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $v.list;
}
# Irregular Bessel Function—Fractional Order
sub Ynu(Num(Cool) $ν, Num(Cool) $x --> Num) is export(:bessel) {
  gsl_sf_bessel_Ynu($ν.Num, $x);
}
sub Ynu-e(Num(Cool) $ν, Num(Cool) $x --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Ynu_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Regular Modified Bessel Functions—Fractional Order
sub Inu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0--> Num) is export(:bessel) {
  gsl_sf_bessel_Inu($ν.Num, $x);
}
sub Inu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Inu_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Inu-scaled(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Inu_scaled($ν.Num, $x);
}
sub Inu-scaled-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Inu_scaled_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Irregular Modified Bessel Functions—Fractional Order
sub Knu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Knu($ν.Num, $x);
}
sub Knu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Knu_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnKnu(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_lnKnu($ν.Num, $x);
}
sub lnKnu-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_lnKnu_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Knu-scaled(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> Num) is export(:bessel) {
  gsl_sf_bessel_Knu_scaled($ν.Num, $x);
}
sub Knu-scaled-e(Num(Cool) $ν where * > 0, Num(Cool) $x where * > 0 --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_Knu_scaled_e($ν.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Zeros of Regular Bessel Functions
sub J0-zero(UInt $s --> Num) is export(:bessel) {
  gsl_sf_bessel_zero_J0($s);
}
sub J0-zero-e(UInt $s --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_zero_J0_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub J1-zero(UInt $s --> Num) is export(:bessel) {
  gsl_sf_bessel_zero_J1($s);
}
sub J1-zero-e(UInt $s --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_zero_J1_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Jnu-zero(Num(Cool) $ν where * ≥ 0, UInt $s --> Num) is export(:bessel) {
  gsl_sf_bessel_zero_Jnu($ν, $s);
}
sub Jnu-zero-e(Num(Cool) $ν where * ≥ 0, UInt $s --> List) is export(:bessel) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_bessel_zero_Jnu_e($ν, $s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Clausen integral
sub clausen(Num(Cool) $x --> Num) is export(:clausen) {
  gsl_sf_clausen($x);
}
sub clausen-e(Num(Cool) $x --> List) is export(:clausen) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_clausen_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Coulomb functions
# Coulomb Normalized Hydrogenic Bound States
sub hydrogenic-R1(Num(Cool) $Z, Num(Cool) $r --> Num) is export(:coulomb) {
  gsl_sf_hydrogenicR_1($Z.Num, $r);
}
sub hydrogenic-R1-e(Num(Cool) $Z, Num(Cool) $r --> List) is export(:coulomb) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hydrogenicR_1_e($Z.Num, $r, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hydrogenic-R(Int $n, Int $l, Num(Cool) $Z, Num(Cool) $r --> Num) is export(:coulomb) {
  gsl_sf_hydrogenicR($n, $l, $Z.Num, $r);
}
sub hydrogenic-R-e(Int $n, Int $l, Num(Cool) $Z, Num(Cool) $r --> List) is export(:coulomb) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hydrogenicR_e($n, $l, $Z.Num, $r, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Coulomb Wave Functions
sub coulomb-wave-FG-e(Num(Cool) $eta, Num(Cool) $x where * > 0, Num(Cool) $LF where * > -½, Int $k --> List) is export(:coulomb) {
  my gsl_sf_result $F  .= new;
  my gsl_sf_result $Fp .= new;
  my gsl_sf_result $G  .= new;
  my gsl_sf_result $Gp .= new;
  my num64 ($expF, $expG);
  my $ret = gsl_sf_coulomb_wave_FG_e($eta.Num, $x.Num, $LF, $k, $F, $Fp, $G, $Gp, $expF, $expG);
  my $overflow = $ret == GSL_EOVRFLW ?? True !! False;
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EOVRFLW;
  return :Fval($F.val), :Ferr($F.err), :Fpval($Fp.val), :Fperr($Fp.err), :Gval($G.val), :Gerr($G.err), :Gpval($Gp.val), :Gperr($Gp.err), :$overflow, :$expF, :$expG;
}
sub coulomb-wave-F-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb) {
  my num64 $expF;
  my $outF = CArray[num64].allocate: $kmax + 1;
  my $ret  = gsl_sf_coulomb_wave_F_array($lmin.Num, $kmax, $eta.Num, $x, $outF, $expF);
  my $overflow = $ret == GSL_EOVRFLW ?? True !! False;
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EOVRFLW;
  return :$overflow, :$expF, :outF($outF.list);
}
sub coulomb-wave-FG-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb) {
  my num64 ($expF, $expG);
  my $outF = CArray[num64].allocate: $kmax + 1;
  my $outG = CArray[num64].allocate: $kmax + 1;
  my $ret = gsl_sf_coulomb_wave_FG_array($lmin.Num, $kmax, $eta.Num, $x, $outF, $outG, $expF, $expG);
  my $overflow = $ret == GSL_EOVRFLW ?? True !! False;
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EOVRFLW;
  return :$overflow, :$expF, :$expG, :outF($outF.list), :outG($outG.list);
}
sub coulomb-wave-FGp-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb) {
  my num64 ($expF, $expG);
  my $outF  = CArray[num64].allocate: $kmax + 1;
  my $outG  = CArray[num64].allocate: $kmax + 1;
  my $outFp = CArray[num64].allocate: $kmax + 1;
  my $outGp = CArray[num64].allocate: $kmax + 1;
  my $ret = gsl_sf_coulomb_wave_FGp_array($lmin.Num, $kmax, $eta.Num, $x, $outF, $outFp, $outG, $outGp, $expF, $expG);
  my $overflow = $ret == GSL_EOVRFLW ?? True !! False;
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EOVRFLW;
  return :$overflow, :$expF, :$expG, :outF($outF.list), :outG($outG.list), :outFp($outFp.list), :outGp($outGp.list);
}
sub coulomb-wave-sphF-array(Num(Cool) $lmin, UInt $kmax, Num(Cool) $eta, Num(Cool) $x where * > 0 --> List) is export(:coulomb) {
  my num64 $expF;
  my $outF  = CArray[num64].allocate: $kmax + 1;
  my $ret = gsl_sf_coulomb_wave_sphF_array($lmin.Num, $kmax, $eta.Num, $x, $outF, $expF);
  my $overflow = $ret == GSL_EOVRFLW ?? True !! False;
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EOVRFLW;
  return :$overflow, :$expF, :outF($outF.list);
}
# Coulomb Wave Function Normalization Constant
sub coulomb-CL-e(Num(Cool) $L where * > -1, Num(Cool) $eta --> List) is export(:coulomb) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_coulomb_CL_e($L.Num, $eta, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub coulomb-CL-array(Num(Cool) $lmin where * > -1, UInt $kmax, Num(Cool) $eta --> List) is export(:coulomb) {
  my $out = CArray[num64].allocate: $kmax + 1;
  my $ret = gsl_sf_coulomb_CL_array($lmin.Num, $kmax, $eta, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
# Coupling Coefficients
sub coupling3j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-ma, Int $two-mb, Int $two-mc --> Num) is export(:coupling) {
  gsl_sf_coupling_3j($two-ja, $two-jb, $two-jc, $two-ma, $two-mb, $two-mc);
}
sub coupling3j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-ma, Int $two-mb, Int $two-mc --> List) is export(:coupling) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_coupling_3j_e($two-ja, $two-jb, $two-jc, $two-ma, $two-mb, $two-mc, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub coupling6j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf --> Num) is export(:coupling) {
  gsl_sf_coupling_6j($two-ja, $two-jb, $two-jc, $two-jd, $two-je, $two-jf);
}
sub coupling6j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf --> List) is export(:coupling) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_coupling_6j_e($two-ja, $two-jb, $two-jc, $two-jd, $two-je, $two-jf, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub coupling9j(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf, Int $two-jg, Int $two-jh, Int $two-ji --> Num) is export(:coupling) {
  gsl_sf_coupling_9j($two-ja, $two-jb, $two-jc, $two-jd, $two-je, $two-jf, $two-jg, $two-jh, $two-ji);
}
sub coupling9j-e(Int $two-ja, Int $two-jb, Int $two-jc, Int $two-jd, Int $two-je, Int $two-jf, Int $two-jg, Int $two-jh, Int $two-ji --> List) is export(:coupling) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_coupling_9j_e($two-ja, $two-jb, $two-jc, $two-jd, $two-je, $two-jf, $two-jg, $two-jh, $two-ji, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Dawson Function
sub dawson(Num(Cool) $x --> Num) is export(:dawson) {
  gsl_sf_dawson($x);
}
sub dawson-e(Num(Cool) $x --> List) is export(:dawson) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_dawson_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Debye Functions
sub debye1(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_1($x);
}
sub debye1-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub debye2(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_2($x);
}
sub debye2-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub debye3(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_3($x);
}
sub debye3-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_3_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub debye4(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_4($x);
}
sub debye4-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_4_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub debye5(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_5($x);
}
sub debye5-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_5_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub debye6(Num(Cool) $x --> Num) is export(:debye) {
  gsl_sf_debye_6($x);
}
sub debye6-e(Num(Cool) $x --> List) is export(:debye) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_debye_6_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Dilogarithms
sub dilog(Num(Cool) $x --> Num) is export(:dilog) {
  gsl_sf_dilog($x);
}
sub dilog-e(Num(Cool) $x --> List) is export(:dilog) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_dilog_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub complex-dilog-xy-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:dilog) {
  my gsl_sf_result $re .= new;
  my gsl_sf_result $im .= new;
  my $ret = gsl_sf_complex_dilog_xy_e($x.Num, $y, $re, $im);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $re.val + i * $im.val, $re.err, $im.err;
}
sub complex-dilog-e(Num(Cool) $r, Num(Cool) $θ --> List) is export(:dilog) {
  my gsl_sf_result $re .= new;
  my gsl_sf_result $im .= new;
  my $ret = gsl_sf_complex_dilog_e($r.Num, $θ, $re, $im);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $re.val + i * $im.val, $re.err, $im.err;
}
sub complex-spence-xy-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:dilog) {
  my gsl_sf_result $re .= new;
  my gsl_sf_result $im .= new;
  my $ret = gsl_sf_complex_spence_xy_e($x.Num, $y, $re, $im);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $re.val + i * $im.val, $re.err, $im.err;
}
# Multiplication with propagation of errors
sub multiply(Num(Cool) $x, Num(Cool) $y --> Num) is export(:mult) {
  gsl_sf_multiply($x.Num, $y);
}
sub multiply-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:mult) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_multiply_e($x.Num, $y, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub multiply-err-e(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:mult) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_multiply_err_e($x.Num, $dx.Num, $y.Num, $dy, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Elliptic Integrals
# Legendre complete
sub Kcomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_Kcomp($k, $mode);
}
sub Kcomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_Kcomp_e($k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Ecomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_Ecomp($k, $mode);
}
sub Ecomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_Ecomp_e($k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Pcomp(Num(Cool) $k, Num(Cool) $n, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_Pcomp($k.Num, $n, $mode);
}
sub Pcomp-e(Num(Cool) $k, Num(Cool) $n, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_Pcomp_e($k.Num, $n, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Dcomp(Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_Dcomp($k, $mode);
}
sub Dcomp-e(Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_Dcomp_e($k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Legendre incomplete
sub F(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_F($Φ.Num, $k, $mode);
}
sub F-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_F_e($Φ.Num, $k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub E(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_E($Φ.Num, $k, $mode);
}
sub E-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_E_e($Φ.Num, $k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub P(Num(Cool) $Φ, Num(Cool) $k, Num(Cool) $n, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_P($Φ.Num, $k.Num, $n, $mode);
}
sub P-e(Num(Cool) $Φ, Num(Cool) $k, Num(Cool) $n, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_P_e($Φ.Num, $k.Num, $n, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub D(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_D($Φ.Num, $k, $mode);
}
sub D-e(Num(Cool) $Φ, Num(Cool) $k, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_D_e($Φ.Num, $k, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Carlson forms
sub RC(Num(Cool) $x, Num(Cool) $y, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_RC($x.Num, $y, $mode);
}
sub RC-e(Num(Cool) $x, Num(Cool) $y, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_RC_e($x.Num, $y, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub RD(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_RD($x.Num, $y.Num, $z, $mode);
}
sub RD-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_RD_e($x.Num, $y.Num, $z, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub RF(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_RF($x.Num, $y.Num, $z, $mode);
}
sub RF-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_RF_e($x.Num, $y.Num, $z, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub RJ(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, Num(Cool) $p, UInt $mode --> Num) is export(:ellint) {
  gsl_sf_ellint_RJ($x.Num, $y.Num, $z.Num, $p, $mode);
}
sub RJ-e(Num(Cool) $x, Num(Cool) $y, Num(Cool) $z, Num(Cool) $p, UInt $mode --> List) is export(:ellint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_ellint_RJ_e($x.Num, $y.Num, $z.Num, $p, $mode, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Elliptic Functions (Jacobi)
sub elljac-e(Num(Cool) $u, Num(Cool) $m --> List) is export(:ellfun) {
  my num64 ($sn, $cn, $dn);
  my $ret = gsl_sf_elljac_e($u.Num, $m, $sn, $cn, $dn);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $sn, $cn, $dn;
}
# Error Functions
sub erf(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_erf($x);
}
sub erf-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_erf_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub erfc(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_erfc($x);
}
sub erfc-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_erfc_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub log-erfc(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_log_erfc($x);
}
sub log-erfc-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_log_erfc_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub erf-Z(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_erf_Z($x);
}
sub erf-Z-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_erf_Z_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub erf-Q(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_erf_Q($x);
}
sub erf-Q-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_erf_Q_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hazard(Num(Cool) $x --> Num) is export(:err) {
  gsl_sf_hazard($x);
}
sub hazard-e(Num(Cool) $x --> List) is export(:err) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hazard_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Exponential Functions
sub gexp(Num(Cool) $x --> Num) is export(:exp) {
  gsl_sf_exp($x);
}
sub gexp-e(Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exp_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexp-e10(Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_exp_e10_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
sub gexp-mult(Num(Cool) $x, Num(Cool) $y --> Num) is export(:exp) {
  gsl_sf_exp_mult($x.Num, $y);
}
sub gexp-mult-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exp_mult_e($x.Num, $y, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexp-mult-e10(Num(Cool) $x, Num(Cool) $y --> List) is export(:exp) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_exp_mult_e10_e($x.Num, $y, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
# Relative Exponential Functions
sub gexpm1(Num(Cool) $x --> Num) is export(:exp) {
  gsl_sf_expm1($x);
}
sub gexpm1-e(Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expm1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexprel(Num(Cool) $x --> Num) is export(:exp) {
  gsl_sf_exprel($x);
}
sub gexprel-e(Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exprel_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexprel2(Num(Cool) $x --> Num) is export(:exp) {
  gsl_sf_exprel_2($x);
}
sub gexprel2-e(Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exprel_2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexprel-n(Int $n, Num(Cool) $x --> Num) is export(:exp) {
  gsl_sf_exprel_n($n, $x);
}
sub gexprel-n-e(Int $n, Num(Cool) $x --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exprel_n_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Exponentiation With Error Estimate
sub gexp-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exp_err_e($x.Num, $dx, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexp-err-e10(Num(Cool) $x, Num(Cool) $dx --> List) is export(:exp) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_exp_err_e10_e($x.Num, $dx, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
sub gexp-mult-err-e(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:exp) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_exp_mult_err_e($x.Num, $dx.Num, $y.Num, $dy, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gexp-mult-err-e10(Num(Cool) $x, Num(Cool) $dx, Num(Cool) $y, Num(Cool) $dy --> List) is export(:exp) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_exp_mult_err_e10_e($x.Num, $dx.Num, $y.Num, $dy, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
# Exponential Integrals
sub E1(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_expint_E1($x);
}
sub E1-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expint_E1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub E2(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_expint_E2($x);
}
sub E2-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expint_E2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub En(Int $n, Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_expint_En($n, $x);
}
sub En-e(Int $n, Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expint_En_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Ei(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_expint_Ei($x);
}
sub Ei-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expint_Ei_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Shi(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_Shi($x);
}
sub Shi-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_Shi_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Chi(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_Chi($x);
}
sub Chi-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_Chi_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub expint3(Num(Cool) $x where * ≥ 0 --> Num) is export(:expint) {
  gsl_sf_expint_3($x);
}
sub expint3-e(Num(Cool) $x where * ≥ 0 --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_expint_3_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Si(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_Si($x);
}
sub Si-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_Si_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub Ci(Num(Cool) $x where * > 0 --> Num) is export(:expint) {
  gsl_sf_Ci($x);
}
sub Ci-e(Num(Cool) $x where * > 0 --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_Ci_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub atanint(Num(Cool) $x --> Num) is export(:expint) {
  gsl_sf_atanint($x);
}
sub atanint-e(Num(Cool) $x --> List) is export(:expint) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_atanint_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Complete Fermi-Dirac Integrals
sub fd-m1(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_m1($x);
}
sub fd-m1-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_m1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd0(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_0($x);
}
sub fd0-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd1(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_1($x);
}
sub fd1-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd2(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_2($x);
}
sub fd2-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd-int(Int $j, Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_int($j, $x);
}
sub fd-int-e(Int $j, Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_int_e($j, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd-mhalf(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_mhalf($x);
}
sub fd-mhalf-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_mhalf_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd-half(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_half($x);
}
sub fd-half-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_half_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub fd-half3(Num(Cool) $x --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_3half($x);
}
sub fd-half3-e(Num(Cool) $x --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_3half_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Incomplete Fermi-Dirac Integrals
sub fd-inc0(Num(Cool) $x, Num(Cool) $b --> Num) is export(:fermidirac) {
  gsl_sf_fermi_dirac_inc_0($x.Num, $b);
}
sub fd-inc0-e(Num(Cool) $x, Num(Cool) $b --> List) is export(:fermidirac) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fermi_dirac_inc_0_e($x.Num, $b, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Gamma and Beta Functions
# Gamma Functions
sub gamma(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta) {
  gsl_sf_gamma($x);
}
sub gamma-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gamma_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lngamma(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta) {
  gsl_sf_lngamma($x);
}
sub lngamma-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lngamma_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lngamma-sgn-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my num64 $sgn;
  my $ret = gsl_sf_lngamma_sgn_e($x, $res, $sgn);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $sgn;
}
sub gammastar(Num(Cool) $x where * > 0 --> Num) is export(:gammabeta) {
  gsl_sf_gammastar($x);
}
sub gammastar-e(Num(Cool) $x where * > 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gammastar_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gammainv(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> Num) is export(:gammabeta) {
  gsl_sf_gammainv($x);
}
sub gammainv-e(Num(Cool) $x where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gammainv_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lngamma-complex-e(Num(Cool) $zr where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) }, Num(Cool) $zi where { $_ > 0 || ($_ < 0 && $_ ≠ $_.Int) } --> List) is export(:gammabeta) {
  my gsl_sf_result $lnr .= new;
  my gsl_sf_result $arg .= new;
  my $ret = gsl_sf_lngamma_complex_e($zr.Num, $zi, $lnr, $arg);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $lnr.val, $lnr.err, $arg.val, $arg.err;
}
# Factorials
sub fact(UInt $n where * ≤ GSL_SF_FACT_NMAX --> Num) is export(:gammabeta) {
  gsl_sf_fact($n);
}
sub fact-e(UInt $n where * ≤ GSL_SF_FACT_NMAX --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_fact_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub doublefact(UInt $n where * ≤ GSL_SF_DOUBLEFACT_NMAX --> Num) is export(:gammabeta) {
  gsl_sf_doublefact($n);
}
sub doublefact-e(UInt $n where * ≤ GSL_SF_DOUBLEFACT_NMAX --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_doublefact_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnfact(UInt $n --> Num) is export(:gammabeta) {
  gsl_sf_lnfact($n);
}
sub lnfact-e(UInt $n --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lnfact_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lndoublefact(UInt $n --> Num) is export(:gammabeta) {
  gsl_sf_lndoublefact($n);
}
sub lndoublefact-e(UInt $n --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lndoublefact_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub choose(UInt $n, UInt $m --> Num) is export(:gammabeta) {
  gsl_sf_choose($n, $m);
}
sub choose-e(UInt $n, UInt $m --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_choose_e($n, $m, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnchoose(UInt $n, UInt $m --> Num) is export(:gammabeta) {
  gsl_sf_lnchoose($n, $m);
}
sub lnchoose-e(UInt $n, UInt $m --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lnchoose_e($n, $m, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub taylorcoeff(UInt $n, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta) {
  gsl_sf_taylorcoeff($n, $x);
}
sub taylorcoeff-e(UInt $n, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_taylorcoeff_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Pochhammer Symbol
sub poch(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta) {
  gsl_sf_poch($a.Num, $x);
}
sub poch-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_poch_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnpoch(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta) {
  gsl_sf_lnpoch($a.Num, $x);
}
sub lnpoch-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lnpoch_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnpoch-sgn-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my num64 $sgn;
  my $ret = gsl_sf_lnpoch_sgn_e($a.Num, $x, $res, $sgn);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $sgn;
}
sub pochrel(Num(Cool) $a, Num(Cool) $x --> Num) is export(:gammabeta) {
  gsl_sf_pochrel($a.Num, $x);
}
sub pochrel-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_pochrel_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Incomplete Gamma Functions
sub gamma-inc(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta) {
  gsl_sf_gamma_inc($a.Num, $x);
}
sub gamma-inc-e(Num(Cool) $a, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gamma_inc_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gamma-inc-Q(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta) {
  gsl_sf_gamma_inc_Q($a.Num, $x);
}
sub gamma-inc-Q-e(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gamma_inc_Q_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gamma-inc-P(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> Num) is export(:gammabeta) {
  gsl_sf_gamma_inc_P($a.Num, $x);
}
sub gamma-inc-P-e(Num(Cool) $a where * > 0, Num(Cool) $x where * ≥ 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gamma_inc_P_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Beta Functions
sub beta(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> Num) is export(:gammabeta) {
  gsl_sf_beta($a.Num, $b);
}
sub beta-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_beta_e($a.Num, $b, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lnbeta(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> Num) is export(:gammabeta) {
  gsl_sf_lnbeta($a.Num, $b);
}
sub lnbeta-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lnbeta_e($a.Num, $b, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Incomplete Beta Functions
sub beta-inc(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0, Num(Cool) $x where 0 ≤ * ≤ 1 --> Num) is export(:gammabeta) {
  gsl_sf_beta_inc($a.Num, $b.Num, $x);
}
sub beta-inc-e(Num(Cool) $a where * > 0, Num(Cool) $b where * > 0, Num(Cool) $x where 0 ≤ * ≤ 1 --> List) is export(:gammabeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_beta_inc_e($a.Num, $b.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Gegenbauer Functions
sub gegenpoly1(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen) {
  gsl_sf_gegenpoly_1($lambda.Num, $x);
}
sub gegenpoly1-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gegenpoly_1_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gegenpoly2(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen) {
  gsl_sf_gegenpoly_2($lambda.Num, $x);
}
sub gegenpoly2-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gegenpoly_2_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gegenpoly3(Num(Cool) $lambda, Num(Cool) $x --> Num) is export(:gegen) {
  gsl_sf_gegenpoly_3($lambda.Num, $x);
}
sub gegenpoly3-e(Num(Cool) $lambda, Num(Cool) $x --> List) is export(:gegen) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gegenpoly_3_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gegenpolyn(UInt $n, Num(Cool) $lambda where * > -½, Num(Cool) $x --> Num) is export(:gegen) {
  gsl_sf_gegenpoly_n($n, $lambda.Num, $x);
}
sub gegenpolyn-e(UInt $n, Num(Cool) $lambda where * > -½, Num(Cool) $x --> List) is export(:gegen) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_gegenpoly_n_e($n, $lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gegenpoly-array(UInt $nmax, Num(Cool) $lambda where * > -½, Num(Cool) $x --> List) is export(:gegen) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_gegenpoly_array($nmax, $lambda.Num, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
# Hermite Polynomials and Functions
# Hermite Polynomials
sub hermite(Int $n, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_phys($n, $x);
}
sub hermite-e(Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_phys_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_hermite_phys_array($nmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite) {
  my CArray[num64] $a .= new: @a».Num;
  gsl_sf_hermite_phys_series($n, $x, $a);
}
sub hermite-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my CArray[num64] $a .= new: @a».Num;
  my $ret = gsl_sf_hermite_phys_series_e($n, $x, $a, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-prob(Int $n, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_prob($n, $x);
}
sub hermite-prob-e(Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_prob_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-prob-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_hermite_prob_array($nmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-prob-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite) {
  my CArray[num64] $a .= new: @a».Num;
  gsl_sf_hermite_prob_series($n, $x, $a);
}
sub hermite-prob-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my CArray[num64] $a .= new: @a».Num;
  my $ret = gsl_sf_hermite_prob_series_e($n, $x, $a, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Derivatives of Hermite Polynomials
sub hermite-der(Int $n, Int $m, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_phys_der($n, $m, $x);
}
sub hermite-der-e(Int $n, Int $m, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_phys_der_e($n, $m, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-array-der(Int $m, Int $nmax, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_hermite_phys_array_der($m, $nmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-der-array(Int $mmax, Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $mmax + 1;
  my $ret = gsl_sf_hermite_phys_der_array($mmax, $n, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-prob-der(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_prob_der($m, $n, $x);
}
sub hermite-prob-der-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_prob_der_e($m, $n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-prob-array-der(Int $m, Int $nmax, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_hermite_prob_array_der($m, $nmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-prob-der-array(Int $mmax, Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $mmax + 1;
  my $ret = gsl_sf_hermite_prob_der_array($mmax, $n, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
# Hermite Functions
sub hermite-func(Int $n, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_func($n, $x);
}
sub hermite-func-e(Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_func_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-func-array(Int $nmax, Num(Cool) $x --> List) is export(:hermite) {
  my $out = CArray[num64].allocate: $nmax + 1;
  my $ret = gsl_sf_hermite_func_array($nmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub hermite-func-series(Int $n, Num(Cool) $x, *@a --> Num) is export(:hermite) {
  my CArray[num64] $a .= new: @a».Num;
  gsl_sf_hermite_func_series($n, $x, $a);
}
sub hermite-func-series-e(Int $n, Num(Cool) $x, *@a --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my CArray[num64] $a .= new: @a».Num;
  my $ret = gsl_sf_hermite_func_series_e($n, $x, $a, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Derivatives of Hermite Functions
sub hermite-func-der(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hermite) {
  gsl_sf_hermite_func_der($m, $n, $x);
}
sub hermite-func-der-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_func_der_e($m, $n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Zeros of Hermite Polynomials and Hermite Functions
sub hermite-zero(Int $n, Int $s --> Num) is export(:hermite) {
  gsl_sf_hermite_phys_zero($n, $s);
}
sub hermite-zero-e(Int $n, Int $s --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_phys_zero_e($n, $s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-prob-zero(Int $n, Int $s --> Num) is export(:hermite) {
  gsl_sf_hermite_prob_zero($n, $s);
}
sub hermite-prob-zero-e(Int $n, Int $s --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_prob_zero_e($n, $s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub hermite-func-zero(Int $n, Int $s --> Num) is export(:hermite) {
  gsl_sf_hermite_func_zero($n, $s);
}
sub hermite-func-zero-e(Int $n, Int $s --> List) is export(:hermite) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hermite_func_zero_e($n, $s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Hypergeometric Functions
sub F01(Num(Cool) $c, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_0F1($c.Num, $x);
}
sub F01-e(Num(Cool) $c, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_0F1_e($c.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub F11(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_1F1($a.Num, $b.Num, $x);
}
sub F11-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_1F1_e($a.Num, $b.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub F11-int(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_1F1_int($m, $n, $x);
}
sub F11-int-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_1F1_int_e($m, $n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub U(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_U($a.Num, $b.Num, $x);
}
sub U-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_U_e($a.Num, $b.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub U-e10(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_hyperg_U_e10_e($a.Num, $b.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
sub U-int(Int $m, Int $n, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_U_int($m, $n, $x);
}
sub U-int-e(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_U_int_e($m, $n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub U-int-e10(Int $m, Int $n, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result_e10 $res .= new;
  my $ret = gsl_sf_hyperg_U_int_e10_e($m, $n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err, $res.e10;
}
sub F21(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_2F1($a.Num, $b.Num, $c.Num, $x);
}
sub F21-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_2F1_e($a.Num, $b.Num, $c.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EMAXITER;
  return $res.val, $res.err;
}
sub F21-conj(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg) {
  gsl_sf_hyperg_2F1_conj($aR.Num, $aI.Num, $c.Num, $x);
}
sub F21-conj-e(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_2F1_conj_e($aR.Num, $aI.Num, $c.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub F21-renorm(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg) {
  gsl_sf_hyperg_2F1_renorm($a.Num, $b.Num, $c.Num, $x);
}
sub F21-renorm-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_2F1_renorm_e($a.Num, $b.Num, $c.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub F21-conj-renorm(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> Num) is export(:hyperg) {
  gsl_sf_hyperg_2F1_conj_renorm($aR.Num, $aI.Num, $c.Num, $x);
}
sub F21-conj-renorm-e(Num(Cool) $aR, Num(Cool) $aI, Num(Cool) $c, Num(Cool) $x where -1 < * < 1 --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_2F1_conj_renorm_e($aR.Num, $aI.Num, $c.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub F20(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> Num) is export(:hyperg) {
  gsl_sf_hyperg_2F0($a.Num, $b.Num, $x);
}
sub F20-e(Num(Cool) $a, Num(Cool) $b, Num(Cool) $x --> List) is export(:hyperg) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hyperg_2F0_e($a.Num, $b.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0 && $ret ≠ GSL_EMAXITER;
  return $res.val, $res.err;
}
# Laguerre Functions
sub laguerre1(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre) {
  gsl_sf_laguerre_1($a.Num, $x);
}
sub laguerre1-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_laguerre_1_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub laguerre2(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre) {
  gsl_sf_laguerre_2($a.Num, $x);
}
sub laguerre2-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_laguerre_2_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub laguerre3(Num(Cool) $a, Num(Cool) $x --> Num) is export(:laguerre) {
  gsl_sf_laguerre_3($a.Num, $x);
}
sub laguerre3-e(Num(Cool) $a, Num(Cool) $x --> List) is export(:laguerre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_laguerre_3_e($a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub laguerre-n(UInt $n, Num(Cool) $a where * > -1, Num(Cool) $x --> Num) is export(:laguerre) {
  gsl_sf_laguerre_n($n, $a.Num, $x);
}
sub laguerre-n-e(UInt $n, Num(Cool) $a where * > -1, Num(Cool) $x --> List) is export(:laguerre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_laguerre_n_e($n, $a.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Lambert W Functions
sub lambert-W0(Num(Cool) $x --> Num) is export(:lambert) {
  gsl_sf_lambert_W0($x);
}
sub lambert-W0-e(Num(Cool) $x --> List) is export(:lambert) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lambert_W0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub lambert-Wm1(Num(Cool) $x --> Num) is export(:lambert) {
  gsl_sf_lambert_Wm1($x);
}
sub lambert-Wm1-e(Num(Cool) $x --> List) is export(:lambert) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lambert_Wm1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Legendre Functions and Spherical Harmonics
# Legendre Polynomials
sub legendre-P1(Num(Cool) $x --> Num) is export(:legendre) {
  gsl_sf_legendre_P1($x);
}
sub legendre-P1-e(Num(Cool) $x --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_P1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-P2(Num(Cool) $x --> Num) is export(:legendre) {
  gsl_sf_legendre_P2($x);
}
sub legendre-P2-e(Num(Cool) $x --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_P2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-P3(Num(Cool) $x --> Num) is export(:legendre) {
  gsl_sf_legendre_P3($x);
}
sub legendre-P3-e(Num(Cool) $x --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_P3_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-Pl(UInt $l, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre) {
  gsl_sf_legendre_Pl($l, $x);
}
sub legendre-Pl-e(UInt $l, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_Pl_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-Pl-array(UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: $lmax + 1;
  my $ret = gsl_sf_legendre_Pl_array($lmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub legendre-Pl-deriv-array(UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: $lmax + 1;
  my $derout = CArray[num64].allocate: $lmax + 1;
  my $ret = gsl_sf_legendre_Pl_deriv_array($lmax, $x, $out, $derout);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list);
}
sub legendre-Q0(Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> Num) is export(:legendre) {
  gsl_sf_legendre_Q0($x);
}
sub legendre-Q0-e(Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_Q0_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-Q1(Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> Num) is export(:legendre) {
  gsl_sf_legendre_Q1($x);
}
sub legendre-Q1-e(Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_Q1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-Ql(UInt $l, Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> Num) is export(:legendre) {
  gsl_sf_legendre_Ql($l, $x);
}
sub legendre-Ql-e(UInt $l, Num(Cool) $x where { $_ > -1 && $_ ≠ 1 } --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_Ql_e($l, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Associated Legendre Polynomials and Spherical Harmonics
sub legendre-array-index(UInt $l, UInt $m --> UInt) is export(:legendre) {
  return gsl_sf_legendre_array_index($l, $m);
}
sub legendre-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_array($norm, $lmax, $x, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub legendre-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_array_e($norm, $lmax, $x, $csphase, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
sub legendre-deriv-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv_array($norm, $lmax, $x, $out, $derout);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list);
}
sub legendre-deriv-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv_array_e($norm, $lmax, $x, $csphase, $out, $derout);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list);
}
sub legendre-deriv-alt-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv_alt_array($norm, $lmax, $x, $out, $derout);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list);
}
sub legendre-deriv-alt-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv_alt_array_e($norm, $lmax, $x, $csphase, $out, $derout);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list);
}
sub legendre-deriv2-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout2 = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv2_array($norm, $lmax, $x, $out, $derout, $derout2);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list), :derout2($derout2.list);
}
sub legendre-deriv2-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout2 = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv2_array_e($norm, $lmax, $x, $csphase, $out, $derout, $derout2);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list), :derout2($derout2.list);
}
sub legendre-deriv2-alt-array(Int $norm, size_t $lmax where * ≤ 150, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout2 = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv2_alt_array($norm, $lmax, $x, $out, $derout, $derout2);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list), :derout2($derout2.list);
}
sub legendre-deriv2-alt-array-e(Int $norm, UInt $lmax, Num(Cool) $x where -1 ≤ * ≤ 1, Num(Cool) $csphase where * == 1|-1 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $derout2 = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_deriv2_alt_array_e($norm, $lmax, $x, $csphase, $out, $derout, $derout2);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return :out($out.list), :derout($derout.list), :derout2($derout2.list);
}
sub legendre-Plm(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre) {
  die 'l must be ≥ m' if $l < $m;
  gsl_sf_legendre_Plm($l, $m, $x);
}
sub legendre-Plm-e(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  die 'l must be ≥ m' if $l < $m;
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_Plm_e($l, $m, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-sphPlm(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> Num) is export(:legendre) {
  die 'l must be ≥ m' if $l < $m;
  gsl_sf_legendre_sphPlm($l, $m, $x);
}
sub legendre-sphPlm-e(UInt $l, UInt $m, Num(Cool) $x where -1 ≤ * ≤ 1 --> List) is export(:legendre) {
  die 'l must be ≥ m' if $l < $m;
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_sphPlm_e($l, $m, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Conical Functions
sub conicalP-half(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_half($lambda.Num, $x);
}
sub conicalP-half-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_half_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub conicalP-mhalf(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_mhalf($lambda.Num, $x);
}
sub conicalP-mhalf-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_mhalf_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub conicalP0(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_0($lambda.Num, $x);
}
sub conicalP0-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_0_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub conicalP1(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_1($lambda.Num, $x);
}
sub conicalP1-e(Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_1_e($lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub conicalP-sph-reg(Int $l where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_sph_reg($l, $lambda.Num, $x);
}
sub conicalP-sph-reg-e(Int $l where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_sph_reg_e($l, $lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub conicalP-cyl-reg(Int $m where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> Num) is export(:legendre) {
  gsl_sf_conicalP_cyl_reg($m, $lambda.Num, $x);
}
sub conicalP-cyl-reg-e(Int $m where * ≥ -1, Num(Cool) $lambda, Num(Cool) $x where * > -1 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_conicalP_cyl_reg_e($m, $lambda.Num, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Radial Functions for Hyperbolic Space
sub legendre-H3d0(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre) {
  gsl_sf_legendre_H3d_0($lambda.Num, $eta);
}
sub legendre-H3d0-e(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_H3d_0_e($lambda.Num, $eta, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-H3d1(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre) {
  gsl_sf_legendre_H3d_1($lambda.Num, $eta);
}
sub legendre-H3d1-e(Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_H3d_1_e($lambda.Num, $eta, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-H3d(UInt $l, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> Num) is export(:legendre) {
  gsl_sf_legendre_H3d($l, $lambda.Num, $eta);
}
sub legendre-H3d-e(UInt $l, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_legendre_H3d_e($l, $lambda.Num, $eta, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub legendre-H3d-array(UInt $lmax, Num(Cool) $lambda, Num(Cool) $eta where * ≥ 0 --> List) is export(:legendre) {
  my $out = CArray[num64].allocate: gsl_sf_legendre_array_n($lmax);
  my $ret = gsl_sf_legendre_H3d_array($lmax, $lambda.Num, $eta, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $out.list;
}
# Logarithm and Related Functions
sub gsl-log(Num(Cool) $x where * > 0 --> Num) is export(:log) {
  gsl_sf_log($x);
}
sub gsl-log-e(Num(Cool) $x where * > 0 --> List) is export(:log) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_log_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-log-abs(Num(Cool) $x where * ≠ 0 --> Num) is export(:log) {
  gsl_sf_log_abs($x);
}
sub gsl-log-abs-e(Num(Cool) $x where * ≠ 0 --> List) is export(:log) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_log_abs_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-log-complex-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:log) {
  my gsl_sf_result $lnr .= new;
  my gsl_sf_result $θ .= new;
  my $ret = gsl_sf_complex_log_e($zr.Num, $zi, $lnr, $θ);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $lnr.val, $lnr.err, $θ.val, $θ.err;
}
sub gsl-log1plusx(Num(Cool) $x where * > -1 --> Num) is export(:log) {
  gsl_sf_log_1plusx($x);
}
sub gsl-log1plusx-e(Num(Cool) $x where * > -1 --> List) is export(:log) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_log_1plusx_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-log1plusx-mx(Num(Cool) $x where * > -1 --> Num) is export(:log) {
  gsl_sf_log_1plusx_mx($x);
}
sub gsl-log1plusx-mx-e(Num(Cool) $x where * > -1 --> List) is export(:log) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_log_1plusx_mx_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Mathieu Functions
# Mathieu Function Workspace
sub mathieu-a(Int $n, Num(Cool) $q --> Num) is export(:mathieu) {
  gsl_sf_mathieu_a($n, $q);
}
sub mathieu-a-e(Int $n, Num(Cool) $q --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_a_e($n, $q, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-b(Int $n, Num(Cool) $q --> Num) is export(:mathieu) {
  gsl_sf_mathieu_b($n, $q);
}
sub mathieu-b-e(Int $n, Num(Cool) $q --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_b_e($n, $q, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-a-array(Int $order-min, Int $order-max, Num(Cool) $q --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($order-max - $order-min + 1, $q);
  my $out = CArray[num64].allocate: $order-max - $order-min + 1;
  my $ret = gsl_sf_mathieu_a_array($order-min, $order-max, $q, $work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
sub mathieu-b-array(Int $order-min, Int $order-max, Num(Cool) $q --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($order-max - $order-min + 1, $q);
  my $out = CArray[num64].allocate: $order-max - $order-min + 1;
  my $ret = gsl_sf_mathieu_b_array($order-min, $order-max, $q, $work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
# Angular Mathieu Functions
sub mathieu-ce(Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu) {
  gsl_sf_mathieu_ce($n, $q, $x);
}
sub mathieu-ce-e(Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_ce_e($n, $q, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-se(Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu) {
  gsl_sf_mathieu_se($n, $q, $x);
}
sub mathieu-se-e(Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_se_e($n, $q, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-ce-array(Int $order-min, Int $order-max, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($order-max - $order-min + 1, $q);
  my $out = CArray[num64].allocate: $order-max - $order-min + 1;
  my $ret = gsl_sf_mathieu_ce_array($order-min, $order-max, $q, $x,$work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
sub mathieu-se-array(Int $order-min, Int $order-max, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($order-max - $order-min + 1, $q);
  my $out = CArray[num64].allocate: $order-max - $order-min + 1;
  my $ret = gsl_sf_mathieu_se_array($order-min, $order-max, $q, $x,$work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
# Radial Mathieu Functions
sub mathieu-Mc(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu) {
  gsl_sf_mathieu_Mc($j, $n, $q, $x);
}
sub mathieu-Mc-e(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_Mc_e($j, $n, $q, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-Ms(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> Num) is export(:mathieu) {
  gsl_sf_mathieu_Ms($j, $n, $q, $x);
}
sub mathieu-Ms-e(Int $j where * == 1|2, Int $n, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_mathieu_Ms_e($j, $n, $q, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub mathieu-Mc-array(Int $j where * == 1|2, Int $nmin, Int $nmax, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($nmax - $nmin + 1, $q);
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  my $ret = gsl_sf_mathieu_Mc_array($j, $nmin, $nmax, $q, $x, $work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
sub mathieu-Ms-array(Int $j where * == 1|2, Int $nmin, Int $nmax, Num(Cool) $q, Num(Cool) $x --> List) is export(:mathieu) {
  my gsl_sf_mathieu_workspace $work = gsl_sf_mathieu_alloc($nmax - $nmin + 1, $q);
  my $out = CArray[num64].allocate: $nmax - $nmin + 1;
  my $ret = gsl_sf_mathieu_Ms_array($j, $nmin, $nmax, $q, $x, $work, $out);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  gsl_sf_mathieu_free($work);
  return $out.list;
}
# Power Function
sub pow-int(Num(Cool) $x, Int $n --> Num) is export(:pow) {
  gsl_sf_pow_int($x, $n);
}
sub pow-int-e(Num(Cool) $x, Int $n --> List) is export(:pow) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_pow_int_e($x, $n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Psi (Digamma) Function
# Digamma Function
sub psi-int(UInt $n where * > 0 --> Num) is export(:psi) {
  gsl_sf_psi_int($n);
}
sub psi-int-e(UInt $n where * > 0 --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_int_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub psi(Num(Cool) $x where * ≠ 0 --> Num) is export(:psi) {
  gsl_sf_psi($x);
}
sub psi-e(Num(Cool) $x where * ≠ 0 --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub psi1piy(Num(Cool) $y --> Num) is export(:psi) {
  gsl_sf_psi_1piy($y);
}
sub psi1piy-e(Num(Cool) $y --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_1piy_e($y, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Trigamma Function
sub psi1-int(UInt $n where * > 0 --> Num) is export(:psi) {
  gsl_sf_psi_1_int($n);
}
sub psi1-int-e(UInt $n where * > 0 --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_1_int_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub psi1(Num(Cool) $x --> Num) is export(:psi) {
  gsl_sf_psi_1($x);
}
sub psi1-e(Num(Cool) $x --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Polygamma Function
sub psin(UInt $n, Num(Cool) $x where * > 0 --> Num) is export(:psi) {
  gsl_sf_psi_n($n, $x);
}
sub psin-e(UInt $n, Num(Cool) $x where * > 0 --> List) is export(:psi) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_psi_n_e($n, $x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Synchrotron Functions
sub synchrotron1(Num(Cool) $x where * ≥ 0 --> Num) is export(:sync) {
  gsl_sf_synchrotron_1($x);
}
sub synchrotron1-e(Num(Cool) $x where * ≥ 0 --> List) is export(:sync) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_synchrotron_1_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub synchrotron2(Num(Cool) $x where * ≥ 0 --> Num) is export(:sync) {
  gsl_sf_synchrotron_2($x);
}
sub synchrotron2-e(Num(Cool) $x where * ≥ 0 --> List) is export(:sync) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_synchrotron_2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Transport Functions
sub transport2(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport) {
  gsl_sf_transport_2($x);
}
sub transport2-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_transport_2_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub transport3(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport) {
  gsl_sf_transport_3($x);
}
sub transport3-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_transport_3_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub transport4(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport) {
  gsl_sf_transport_4($x);
}
sub transport4-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_transport_4_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub transport5(Num(Cool) $x where * ≥ 0 --> Num) is export(:transport) {
  gsl_sf_transport_5($x);
}
sub transport5-e(Num(Cool) $x where * ≥ 0 --> List) is export(:transport) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_transport_5_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Trigonometric Functions
# Circular Trigonometric Functions
sub gsl-sin(Num(Cool) $x --> Num) is export(:trig) {
  gsl_sf_sin($x);
}
sub gsl-sin-e(Num(Cool) $x --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_sin_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-cos(Num(Cool) $x --> Num) is export(:trig) {
  gsl_sf_cos($x);
}
sub gsl-cos-e(Num(Cool) $x --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_cos_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-hypot(Num(Cool) $x, Num(Cool) $y --> Num) is export(:trig) {
  gsl_sf_hypot($x, $y);
}
sub gsl-hypot-e(Num(Cool) $x, Num(Cool) $y --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hypot_e($x, $y, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-sinc(Num(Cool) $x --> Num) is export(:trig) {
  gsl_sf_sinc($x);
}
sub gsl-sinc-e(Num(Cool) $x --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_sinc_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Trigonometric Functions for Complex Arguments
sub gsl-complex-sin-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig) {
  my gsl_sf_result $szr .= new;
  my gsl_sf_result $szi .= new;
  my $ret = gsl_sf_complex_sin_e($zr, $zi, $szr, $szi);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $szr.val, $szr.err, $szi.val, $szi.err;
}
sub gsl-complex-cos-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig) {
  my gsl_sf_result $czr .= new;
  my gsl_sf_result $czi .= new;
  my $ret = gsl_sf_complex_cos_e($zr, $zi, $czr, $czi);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $czr.val, $czr.err, $czi.val, $czi.err;
}
sub gsl-complex-logsin-e(Num(Cool) $zr, Num(Cool) $zi --> List) is export(:trig) {
  my gsl_sf_result $lszr .= new;
  my gsl_sf_result $lszi .= new;
  my $ret = gsl_sf_complex_logsin_e($zr, $zi, $lszr, $lszi);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $lszr.val, $lszr.err, $lszi.val, $lszi.err;
}
# Hyperbolic Trigonometric Functions
sub gsl-lnsinh(Num(Cool) $x where * > 0 --> Num) is export(:trig) {
  gsl_sf_lnsinh($x);
}
sub gsl-lnsinh-e(Num(Cool) $x where * > 0 --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lnsinh_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-lncosh(Num(Cool) $x --> Num) is export(:trig) {
  gsl_sf_lncosh($x);
}
sub gsl-lncosh-e(Num(Cool) $x --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_lncosh_e($x, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Conversion Functions
sub polar-to-rect(Num(Cool) $r, Num(Cool) $θ where -π ≤ * ≤ π --> List) is export(:trig) {
  my gsl_sf_result $x .= new;
  my gsl_sf_result $y .= new;
  my $ret = gsl_sf_polar_to_rect($r, $θ, $x, $y);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $x.val, $x.err, $y.val, $y.err;
}
sub rect-to-polar(Num(Cool) $x, Num(Cool) $y --> List) is export(:trig) {
  my gsl_sf_result $r .= new;
  my gsl_sf_result $θ .= new;
  my $ret = gsl_sf_rect_to_polar($x, $y, $r, $θ);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $r.val, $r.err, $θ.val, $θ.err;
}
# Restriction Functions
sub angle-restrict-symm(Num(Cool) $θ --> Num) is export(:trig) {
  gsl_sf_angle_restrict_symm($θ);
}
sub angle-restrict-symm-e(Num(Cool) $θ --> Num) is export(:trig) {
  my num64 $t = $θ;
  my $ret = gsl_sf_angle_restrict_symm_e($t);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $t;
}
sub angle-restrict-pos(Num(Cool) $θ --> Num) is export(:trig) {
  gsl_sf_angle_restrict_pos($θ);
}
sub angle-restrict-pos-e(Num(Cool) $θ --> Num) is export(:trig) {
  my num64 $t = $θ;
  my $ret = gsl_sf_angle_restrict_pos_e($t);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $t;
}
sub gsl-sin-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_sin_err_e($x, $dx, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub gsl-cos-err-e(Num(Cool) $x, Num(Cool) $dx --> List) is export(:trig) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_cos_err_e($x, $dx, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Zeta Functions
# Riemann Zeta Function
sub zeta-int(Int $n where * ≠ 1 --> Num) is export(:zeta) {
  gsl_sf_zeta_int($n);
}
sub zeta-int-e(Int $n where * ≠ 1 --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_zeta_int_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub zeta(Num(Cool) $s where * ≠ 1 --> Num) is export(:zeta) {
  gsl_sf_zeta($s);
}
sub zeta-e(Num(Cool) $s where * ≠ 1 --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_zeta_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Riemann Zeta Function Minus One
sub zetam1-int(Int $n where * ≠ 1 --> Num) is export(:zeta) {
  gsl_sf_zetam1_int($n);
}
sub zetam1-int-e(Int $n where * ≠ 1 --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_zetam1_int_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub zetam1(Num(Cool) $s where * ≠ 1 --> Num) is export(:zeta) {
  gsl_sf_zetam1($s);
}
sub zetam1-e(Num(Cool) $s where * ≠ 1 --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_zetam1_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Hurwitz Zeta Function
sub hzeta(Num(Cool) $s where * > 1, Num(Cool) $q where * > 0 --> Num) is export(:zeta) {
  gsl_sf_hzeta($s, $q);
}
sub hzeta-e(Num(Cool) $s where * > 1, Num(Cool) $q where * > 0 --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_hzeta_e($s, $q, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
# Eta Function
sub eta-int(Int $n --> Num) is export(:zeta) {
  gsl_sf_eta_int($n);
}
sub eta-int-e(Int $n --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_eta_int_e($n, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}
sub eta(Num(Cool) $s --> Num) is export(:zeta) {
  gsl_sf_eta($s);
}
sub eta-e(Num(Cool) $s --> List) is export(:zeta) {
  my gsl_sf_result $res .= new;
  my $ret = gsl_sf_eta_e($s, $res);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  return $res.val, $res.err;
}

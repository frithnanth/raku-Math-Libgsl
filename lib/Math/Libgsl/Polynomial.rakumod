use v6.c;

unit module Math::Libgsl::Polynomial:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Polynomial :ALL;
use Math::Libgsl::Exception;
use Math::Libgsl::Raw::Complex;
use NativeCall;

# Polynomial evaluation
sub poly-eval(Positional $c, Num(Cool) $x --> Num) is export(:eval) {
  my CArray[num64] $in .= new: $c».Num;
  gsl_poly_eval($in, $c.elems, $x)
}
sub poly-eval-derivs(Num(Cool) $x, Int $maxk, Positional $c --> List) is export(:eval) {
  my CArray[num64] $in  .= new: $c».Num;
  my $out = CArray[num64].allocate: $maxk;
  my $res = gsl_poly_eval_derivs($in, $in.elems, $x, $out, $maxk);
  fail X::Libgsl.new: errno => $res if $res > 0;
  return $out.list;
}
# Divided difference representation of polynomials
sub poly-dd(Positional $xa, Positional $ya, Positional $x --> List) is export(:divdiff) {
  my CArray[num64] $inx .= new: $xa».Num;
  my CArray[num64] $iny .= new: $ya».Num;
  my $dd = CArray[num64].allocate: $inx.elems;
  my $res = gsl_poly_dd_init($dd, $inx, $iny, $inx.elems);
  fail X::Libgsl.new: errno => $res if $res > 0;
  my @out;
  for $x.list».Num -> $val {
    @out.push: gsl_poly_dd_eval($dd, $inx, $inx.elems, $val);
  }
  return @out;
}
sub poly-dd-taylor(Positional $xa, Positional $ya, Num(Cool) $x --> List) is export(:divdiff) {
  my CArray[num64] $inx .= new: $xa».Num;
  my CArray[num64] $iny .= new: $ya».Num;
  my $dd = CArray[num64].allocate: $inx.elems;
  my $res = gsl_poly_dd_init($dd, $inx, $iny, $inx.elems);
  fail X::Libgsl.new: errno => $res if $res > 0;
  my $c = CArray[num64].allocate: $inx.elems;
  my $w = CArray[num64].allocate: $inx.elems;
  $res = gsl_poly_dd_taylor($c, $x, $dd, $inx, $inx.elems, $w);
  fail X::Libgsl.new: errno => $res if $res > 0;
  return $c.list;
}
sub poly-dd-hermite(Positional $xa, Positional $ya, Positional $dya, Positional $x --> List) is export(:divdiff) {
  my CArray[num64] $inx  .= new: $xa».Num;
  my CArray[num64] $iny  .= new: $ya».Num;
  my CArray[num64] $indy .= new: $dya».Num;
  my $dd = CArray[num64].allocate: $xa.elems * 2;
  my $za = CArray[num64].allocate: $xa.elems * 2;
  my $res = gsl_poly_dd_hermite_init($dd, $za, $inx, $iny, $indy, $inx.elems);
  fail X::Libgsl.new: errno => $res if $res > 0;
  my @out;
  for $x.list».Num -> $val {
    @out.push: gsl_poly_dd_eval($dd, $za, $za.elems, $val);
  }
  return @out;
}
# Quadratic equations
sub poly-solve-quadratic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:quad) {
  my num64 $x0;
  my num64 $x1;
  my $ret = gsl_poly_solve_quadratic($a, $b, $c, $x0, $x1);
  return $ret, $x0, $x1;
}
sub poly-complex-solve-quadratic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:quad) {
  my gsl_complex $z0 = alloc_gsl_complex;
  my gsl_complex $z1 = alloc_gsl_complex;
  my $ret = gsl_poly_complex_solve_quadratic($a, $b, $c, $z0, $z1);
  my Complex $root0 = $z0.dat[0] + i * $z0.dat[1];
  my Complex $root1 = $z1.dat[0] + i * $z1.dat[1];
  return $ret, $root0, $root1;
}
# Cubic equations
sub poly-solve-cubic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:cubic) {
  my num64 $x0;
  my num64 $x1;
  my num64 $x2;
  my $ret = gsl_poly_solve_cubic($a, $b, $c, $x0, $x1, $x2);
  return $ret, $x0, $x1, $x2;
}
sub poly-complex-solve-cubic(Num(Cool) $a, Num(Cool) $b, Num(Cool) $c --> List) is export(:cubic) {
  my gsl_complex $z0 = alloc_gsl_complex;
  my gsl_complex $z1 = alloc_gsl_complex;
  my gsl_complex $z2 = alloc_gsl_complex;
  my $ret = gsl_poly_complex_solve_cubic($a, $b, $c, $z0, $z1, $z2);
  my Complex $root0 = $z0.dat[0] + i * $z0.dat[1];
  my Complex $root1 = $z1.dat[0] + i * $z1.dat[1];
  my Complex $root2 = $z2.dat[0] + i * $z2.dat[1];
  return $ret, $root0, $root1, $root2;
}
# General polynomial equations
sub poly-complex-solve(*@a --> List) is export(:complexsolve) {
  my CArray[num64] $ina .= new: @a».Num;
  my $z = CArray[num64].allocate(($ina.elems - 1) * 2);
  my gsl_poly_complex_workspace $w = gsl_poly_complex_workspace_alloc($ina.elems);
  my $ret = gsl_poly_complex_solve($ina, $ina.elems, $w, $z);
  fail X::Libgsl.new: errno => $ret if $ret > 0;
  my @out;
  for $z.list -> $re, $im {
    @out.push: $re + i * $im;
  }
  return @out;
}

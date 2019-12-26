use v6;

unit class Math::Libgsl::Permutation:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Permutation :ALL;
use Math::Libgsl::Exception;
use Math::Libgsl::Constants;
use NativeCall;

has gsl_permutation $.p;

multi method new(Int $elems!) { self.bless(:$elems) }

multi method new(Int :$elems!) { self.bless(:$elems) }

submethod BUILD(:$elems!) { $!p = gsl_permutation_calloc($elems) }

submethod DESTROY { gsl_permutation_free($!p) }

method init { gsl_permutation_init($!p); self }

method copy($src! where * ~~ Math::Libgsl::Permutation) { gsl_permutation_memcpy($!p, $src.p); self }

method get(Int $elem! --> Int)
{
  fail X::Libgsl.new: errno => GSL_EINVAL, error => 'Index out of range' if $elem > $!p.size - 1;
  gsl_permutation_get($!p, $elem)
}

method all(--> Seq) { $!p.data[^$.size] }

method swap(Int $elem1!, Int $elem2!)
{
  fail X::Libgsl.new: errno => GSL_EINVAL, error => 'Index out of range' if $!p.size ≤ $elem1|$elem2;
  my $ret = gsl_permutation_swap($!p, $elem1, $elem2);
  fail X::Libgsl.new: errno => $ret, error => "Can't get next permutation" if $ret ≠ GSL_SUCCESS;
  self
}

method size(--> Int) { gsl_permutation_size($!p) }

method is-valid(--> Bool) { gsl_permutation_valid($!p) == GSL_SUCCESS ?? True !! False }

method reverse { gsl_permutation_reverse($!p); self }

method inverse($dst! where * ~~ Math::Libgsl::Permutation) { gsl_permutation_inverse($dst.p, $!p); self }

method next
{
  my $ret = gsl_permutation_next($!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't get next permutation" if $ret ≠ GSL_SUCCESS;
  self
}

method prev
{
  my $ret = gsl_permutation_prev($!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't get previous permutation" if $ret ≠ GSL_SUCCESS;
  self
}

method bnext(--> Bool) { gsl_permutation_next($!p) == GSL_SUCCESS ?? True !! False }

method bprev(--> Bool) { gsl_permutation_prev($!p) == GSL_SUCCESS ?? True !! False }

method permute(@data!, Int $stride! --> List)
{
  my CArray[num64] $data .= new: @data».Num;
  my $ret = gsl_permute($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-inverse(@data!, Int $stride! --> List)
{
  my CArray[num64] $data .= new: @data».Num;
  my $ret = gsl_permute_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method multiply($dst! where * ~~ Math::Libgsl::Permutation, $p2! where * ~~ Math::Libgsl::Permutation)
{
  my $ret = gsl_permutation_mul($dst.p, $!p, $p2.p);
  fail X::Libgsl.new: errno => $ret, error => "Can't multiply" if $ret ≠ GSL_SUCCESS;
  self
}

method to-canonical($dst! where * ~~ Math::Libgsl::Permutation)
{
  my $ret = gsl_permutation_linear_to_canonical($dst.p, $!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't transform to canonical" if $ret ≠ GSL_SUCCESS;
  self
}

method to-linear($dst! where * ~~ Math::Libgsl::Permutation)
{
  my $ret = gsl_permutation_canonical_to_linear($dst.p, $!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't transform to linear" if $ret ≠ GSL_SUCCESS;
  self
}

method inversions(--> Int) { gsl_permutation_inversions($!p) }

method linear-cycles(--> Int) { gsl_permutation_linear_cycles($!p) }

method canonical-cycles(--> Int) { gsl_permutation_canonical_cycles($!p) }

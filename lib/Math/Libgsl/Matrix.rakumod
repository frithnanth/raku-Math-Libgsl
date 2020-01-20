use v6;

unit class Math::Libgsl::Matrix:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Complex :ALL;
use Math::Libgsl::Raw::Matrix :ALL;
use Math::Libgsl::Exception;
use Math::Libgsl::Constants;
use Math::Libgsl::Vector;
use NativeCall;

class MView {
  has gsl_matrix_view $.view;
  submethod BUILD { $!view = alloc_gsl_matrix_view }
  submethod DESTROY { free_gsl_matrix_view($!view) }
}

has gsl_matrix $.matrix;

multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
multi method new(gsl_matrix :$matrix!) { self.bless(:$matrix) }

submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix :$matrix?) {
  $!matrix = gsl_matrix_calloc($size1, $size2) if $size1.defined && $size2.defined;
  $!matrix = $matrix with $matrix;
}

submethod DESTROY {
  gsl_matrix_free($!matrix);
}
# Accessors
method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
  gsl_matrix_get($!matrix, $i, $j)
}
method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
  gsl_matrix_get(self.matrix, $i, $j)
}
method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
  gsl_matrix_set($!matrix, $i, $j, $x); self
}
method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
  gsl_matrix_set(self.matrix, $i, $j, $x)
}
method setall(Num(Cool) $x!) { gsl_matrix_set_all($!matrix, $x); self }
method zero() { gsl_matrix_set_zero($!matrix); self }
method identity() { gsl_matrix_set_identity($!matrix); self }
# IO
method write(Str $filename!) {
  my $ret = mgsl_matrix_fwrite($filename, $!matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
  self
}
method read(Str $filename!) {
  my $ret = mgsl_matrix_fread($filename, $!matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
  self
}
method printf(Str $filename!, Str $format!) {
  my $ret = mgsl_matrix_fprintf($filename, $!matrix, $format);
  fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
  self
}
method scanf(Str $filename!) {
  my $ret = mgsl_matrix_fscanf($filename, $!matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
  self
}
# View
#method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
#  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
#    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
#  my Math::Libgsl::Matrix::MView $mv .= new;
#  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
#}
#sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
#  my Math::Libgsl::Matrix::MView $mv .= new;
#  my CArray[num64] $a .= new: @array.Array».Num;
#  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
#}
#sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
#  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
#  my Math::Libgsl::Matrix::MView $mv .= new;
#  my CArray[num64] $a .= new: @array.Array».Num;
#  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
#}
#sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
#  my Math::Libgsl::Matrix::MView $mv .= new;
#  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_view_vector($mv.view, $v.vector, $n1, $n2);
#}
#sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
#  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
#  my Math::Libgsl::Matrix::MView $mv .= new;
#  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_view_vector_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
#}
#method row-view(size_t $i where * < $!matrix.size1) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_row($vv.view, $!matrix, $i);
#}
#method col-view(size_t $j where * < $!matrix.size2) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_column($vv.view, $!matrix, $j);
#}
#method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_subrow($vv.view, $!matrix, $i, $offset, $n);
#}
#method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_subcolumn($vv.view, $!matrix, $j, $offset, $n);
#}
#method diagonal-view() {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_diagonal($vv.view, $!matrix);
#}
#method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_subdiagonal($vv.view, $!matrix, $k);
#}
#method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
#  my Math::Libgsl::Vector::VView $vv .= new;
#  Math::Libgsl::Vector.new: vector => mgsl_matrix_superdiagonal($vv.view, $!matrix, $k);
#}
# Copying matrices
method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_memcpy($!matrix, $src.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
  self
}
method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_swap($!matrix, $src.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
  self
}
# Rows and columns
method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
  my gsl_vector $v = gsl_vector_calloc($!matrix.size2);
  my $ret = gsl_matrix_get_row($v, $!matrix, $i);
  fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
  gather take gsl_vector_get($v, $_) for ^$!matrix.size2;
}
method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
  my gsl_vector $v = gsl_vector_calloc($!matrix.size1);
  my $ret = gsl_matrix_get_col($v, $!matrix, $j);
  fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
  gather take gsl_vector_get($v, $_) for ^$!matrix.size1;
}
multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
  my gsl_vector $v = gsl_vector_calloc($!matrix.size2);
  gsl_vector_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
  my $ret = gsl_matrix_set_row($!matrix, $i, $v);
  fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
  self
}
multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
  my $ret = gsl_matrix_set_row($!matrix, $i, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
  self
}
multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
  my gsl_vector $v = gsl_vector_calloc($!matrix.size1);
  gsl_vector_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
  my $ret = gsl_matrix_set_col($!matrix, $j, $v);
  fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
  self
}
multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
  my $ret = gsl_matrix_set_col($!matrix, $j, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
  self
}
# Exchanging rows and columns
method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
  my $ret = gsl_matrix_swap_rows($!matrix, $i, $j);
  fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
  self
}
method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
  my $ret = gsl_matrix_swap_columns($!matrix, $i, $j);
  fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
  self
}
method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
  fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
  my $ret = gsl_matrix_swap_rowcol($!matrix, $i, $j);
  fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
  self
}
method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
  my $ret = gsl_matrix_transpose_memcpy($!matrix, $src.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
  self
}
method transpose() {
  fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
  my $ret = gsl_matrix_transpose($!matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
  self
}
# Matrix operations
method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_add($!matrix, $b.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
  self
}
method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_sub($!matrix, $b.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
  self
}
method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_mul_elements($!matrix, $b.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
  self
}
method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
  my $ret = gsl_matrix_div_elements($!matrix, $b.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
  self
}
method scale(Num(Cool) $x) {
  my $ret = gsl_matrix_scale($!matrix, $x);
  fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
  self
}
method add-constant(Num(Cool) $x) {
  my $ret = gsl_matrix_add_constant($!matrix, $x);
  fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
  self
}
# Finding maximum and minimum elements of matrices
method max(--> Num) { gsl_matrix_max($!matrix) }
method min(--> Num) { gsl_matrix_min($!matrix) }
method minmax(--> List) {
  my num64 ($min, $max);
  gsl_matrix_minmax($!matrix, $min, $max);
  return $min, $max;
}
method max-index(--> List) {
  my size_t ($imax, $jmax);
  gsl_matrix_max_index($!matrix, $imax, $jmax);
  return $imax, $jmax;
}
method min-index(--> List) {
  my size_t ($imin, $jmin);
  gsl_matrix_min_index($!matrix, $imin, $jmin);
  return $imin, $jmin;
}
method minmax-index(--> List) {
  my size_t ($imin, $jmin, $imax, $jmax);
  gsl_matrix_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
  return $imin, $jmin, $imax, $jmax;
}
# Matrix properties
method is-null(--> Bool)   { gsl_matrix_isnull($!matrix)   ?? True !! False }
method is-pos(--> Bool)    { gsl_matrix_ispos($!matrix)    ?? True !! False }
method is-neg(--> Bool)    { gsl_matrix_isneg($!matrix)    ?? True !! False }
method is-nonneg(--> Bool) { gsl_matrix_isnonneg($!matrix) ?? True !! False }
method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_equal($!matrix, $b.matrix) ?? True !! False }

class Num32 {
  class MView {
    has gsl_matrix_float_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_float_view }
    submethod DESTROY { free_gsl_matrix_float_view($!view) }
  }

  has gsl_matrix_float $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_float :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_float :$matrix?) {
    $!matrix = gsl_matrix_float_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_float_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_float_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_float_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_float_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_float_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_float_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_float_set_zero($!matrix); self }
  method identity() { gsl_matrix_float_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_float_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_float_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_float_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_float_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_float_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_float_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_float_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_float_view_vector_float($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_float_view_vector_float_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_float_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_float $v = gsl_vector_float_calloc($!matrix.size2);
    my $ret = gsl_matrix_float_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_float_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_float $v = gsl_vector_float_calloc($!matrix.size1);
    my $ret = gsl_matrix_float_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_float_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_float $v = gsl_vector_float_calloc($!matrix.size2);
    gsl_vector_float_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_float_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_float_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_float $v = gsl_vector_float_calloc($!matrix.size1);
    gsl_vector_float_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_float_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_float_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_float_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_float_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_float_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_float_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_float_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_float_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_float_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_float_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_float_max($!matrix) }
  method min(--> Num) { gsl_matrix_float_min($!matrix) }
  method minmax(--> List) {
    my num32 ($min, $max);
    gsl_matrix_float_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_float_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_float_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_float_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_float_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_float_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_float_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_float_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_float_equal($!matrix, $b.matrix) ?? True !! False }
}

class Int32 {
  class MView {
    has gsl_matrix_int_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_int_view }
    submethod DESTROY { free_gsl_matrix_int_view($!view) }
  }

  has gsl_matrix_int $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_int :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_int :$matrix?) {
    $!matrix = gsl_matrix_int_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_int_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_int_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_int_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_int_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_int_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_int_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_int_set_zero($!matrix); self }
  method identity() { gsl_matrix_int_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_int_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_int_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_int_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_int_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_int_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_int_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_int_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_int_view_vector_int($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_int_view_vector_int_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_int_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_int $v = gsl_vector_int_calloc($!matrix.size2);
    my $ret = gsl_matrix_int_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_int_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_int $v = gsl_vector_int_calloc($!matrix.size1);
    my $ret = gsl_matrix_int_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_int_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_int $v = gsl_vector_int_calloc($!matrix.size2);
    gsl_vector_int_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_int_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_int_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_int $v = gsl_vector_int_calloc($!matrix.size1);
    gsl_vector_int_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_int_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_int_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_int_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_int_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_int_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_int_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_int_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_int_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_int_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_int_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_int_max($!matrix) }
  method min(--> Num) { gsl_matrix_int_min($!matrix) }
  method minmax(--> List) {
    my int32 ($min, $max);
    gsl_matrix_int_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_int_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_int_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_int_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_int_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_int_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_int_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_int_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_int_equal($!matrix, $b.matrix) ?? True !! False }
}

class UInt32 {
  class MView {
    has gsl_matrix_uint_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_uint_view }
    submethod DESTROY { free_gsl_matrix_uint_view($!view) }
  }

  has gsl_matrix_uint $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_uint :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_uint :$matrix?) {
    $!matrix = gsl_matrix_uint_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_uint_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_uint_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_uint_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_uint_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_uint_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_uint_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_uint_set_zero($!matrix); self }
  method identity() { gsl_matrix_uint_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_uint_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_uint_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_uint_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_uint_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uint_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uint_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uint_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uint_view_vector_uint($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uint_view_vector_uint_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uint_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_uint $v = gsl_vector_uint_calloc($!matrix.size2);
    my $ret = gsl_matrix_uint_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_uint_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_uint $v = gsl_vector_uint_calloc($!matrix.size1);
    my $ret = gsl_matrix_uint_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_uint_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_uint $v = gsl_vector_uint_calloc($!matrix.size2);
    gsl_vector_uint_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_uint_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_uint_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_uint $v = gsl_vector_uint_calloc($!matrix.size1);
    gsl_vector_uint_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_uint_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_uint_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_uint_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_uint_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_uint_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_uint_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_uint_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uint_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_uint_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_uint_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_uint_max($!matrix) }
  method min(--> Num) { gsl_matrix_uint_min($!matrix) }
  method minmax(--> List) {
    my uint32 ($min, $max);
    gsl_matrix_uint_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_uint_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_uint_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_uint_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_uint_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_uint_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_uint_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_uint_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_uint_equal($!matrix, $b.matrix) ?? True !! False }
}

class Int64 {
  class MView {
    has gsl_matrix_long_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_long_view }
    submethod DESTROY { free_gsl_matrix_long_view($!view) }
  }

  has gsl_matrix_long $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_long :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_long :$matrix?) {
    $!matrix = gsl_matrix_long_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_long_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_long_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_long_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_long_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_long_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_long_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_long_set_zero($!matrix); self }
  method identity() { gsl_matrix_long_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_long_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_long_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_long_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_long_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_long_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_long_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_long_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_long_view_vector_long($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_long_view_vector_long_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_long_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_long $v = gsl_vector_long_calloc($!matrix.size2);
    my $ret = gsl_matrix_long_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_long_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_long $v = gsl_vector_long_calloc($!matrix.size1);
    my $ret = gsl_matrix_long_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_long_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_long $v = gsl_vector_long_calloc($!matrix.size2);
    gsl_vector_long_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_long_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_long_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_long $v = gsl_vector_long_calloc($!matrix.size1);
    gsl_vector_long_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_long_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_long_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_long_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_long_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_long_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_long_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_long_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_long_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_long_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_long_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_long_max($!matrix) }
  method min(--> Num) { gsl_matrix_long_min($!matrix) }
  method minmax(--> List) {
    my int64 ($min, $max);
    gsl_matrix_long_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_long_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_long_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_long_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_long_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_long_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_long_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_long_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_long_equal($!matrix, $b.matrix) ?? True !! False }
}

class UInt64 {
  class MView {
    has gsl_matrix_ulong_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_ulong_view }
    submethod DESTROY { free_gsl_matrix_ulong_view($!view) }
  }

  has gsl_matrix_ulong $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_ulong :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_ulong :$matrix?) {
    $!matrix = gsl_matrix_ulong_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_ulong_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_ulong_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_ulong_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_ulong_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_ulong_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_ulong_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_ulong_set_zero($!matrix); self }
  method identity() { gsl_matrix_ulong_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_ulong_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_ulong_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_ulong_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_ulong_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ulong_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ulong_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ulong_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ulong_view_vector_ulong($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ulong_view_vector_ulong_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ulong_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_ulong $v = gsl_vector_ulong_calloc($!matrix.size2);
    my $ret = gsl_matrix_ulong_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_ulong_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_ulong $v = gsl_vector_ulong_calloc($!matrix.size1);
    my $ret = gsl_matrix_ulong_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_ulong_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_ulong $v = gsl_vector_ulong_calloc($!matrix.size2);
    gsl_vector_ulong_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_ulong_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_ulong_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_ulong $v = gsl_vector_ulong_calloc($!matrix.size1);
    gsl_vector_ulong_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_ulong_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_ulong_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_ulong_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_ulong_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_ulong_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_ulong_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_ulong_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ulong_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_ulong_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_ulong_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_ulong_max($!matrix) }
  method min(--> Num) { gsl_matrix_ulong_min($!matrix) }
  method minmax(--> List) {
    my uint64 ($min, $max);
    gsl_matrix_ulong_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_ulong_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_ulong_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_ulong_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_ulong_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_ulong_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_ulong_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_ulong_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_ulong_equal($!matrix, $b.matrix) ?? True !! False }
}

class Int16 {
  class MView {
    has gsl_matrix_short_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_short_view }
    submethod DESTROY { free_gsl_matrix_short_view($!view) }
  }

  has gsl_matrix_short $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_short :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_short :$matrix?) {
    $!matrix = gsl_matrix_short_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_short_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_short_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_short_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_short_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_short_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_short_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_short_set_zero($!matrix); self }
  method identity() { gsl_matrix_short_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_short_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_short_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_short_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_short_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_short_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int16] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_short_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int16] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_short_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_short_view_vector_short($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_short_view_vector_short_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_short_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_short $v = gsl_vector_short_calloc($!matrix.size2);
    my $ret = gsl_matrix_short_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_short_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_short $v = gsl_vector_short_calloc($!matrix.size1);
    my $ret = gsl_matrix_short_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_short_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_short $v = gsl_vector_short_calloc($!matrix.size2);
    gsl_vector_short_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_short_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_short_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_short $v = gsl_vector_short_calloc($!matrix.size1);
    gsl_vector_short_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_short_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_short_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_short_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_short_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_short_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_short_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_short_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_short_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_short_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_short_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_short_max($!matrix) }
  method min(--> Num) { gsl_matrix_short_min($!matrix) }
  method minmax(--> List) {
    my int16 ($min, $max);
    gsl_matrix_short_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_short_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_short_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_short_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_short_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_short_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_short_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_short_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_short_equal($!matrix, $b.matrix) ?? True !! False }
}

class UInt16 {
  class MView {
    has gsl_matrix_ushort_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_ushort_view }
    submethod DESTROY { free_gsl_matrix_ushort_view($!view) }
  }

  has gsl_matrix_ushort $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_ushort :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_ushort :$matrix?) {
    $!matrix = gsl_matrix_ushort_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_ushort_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_ushort_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_ushort_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_ushort_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_ushort_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_ushort_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_ushort_set_zero($!matrix); self }
  method identity() { gsl_matrix_ushort_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_ushort_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_ushort_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_ushort_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_ushort_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ushort_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint16] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ushort_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint16] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ushort_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ushort_view_vector_ushort($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_ushort_view_vector_ushort_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_ushort_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_ushort $v = gsl_vector_ushort_calloc($!matrix.size2);
    my $ret = gsl_matrix_ushort_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_ushort_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_ushort $v = gsl_vector_ushort_calloc($!matrix.size1);
    my $ret = gsl_matrix_ushort_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_ushort_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_ushort $v = gsl_vector_ushort_calloc($!matrix.size2);
    gsl_vector_ushort_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_ushort_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_ushort_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_ushort $v = gsl_vector_ushort_calloc($!matrix.size1);
    gsl_vector_ushort_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_ushort_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_ushort_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_ushort_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_ushort_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_ushort_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_ushort_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_ushort_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_ushort_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_ushort_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_ushort_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_ushort_max($!matrix) }
  method min(--> Num) { gsl_matrix_ushort_min($!matrix) }
  method minmax(--> List) {
    my uint16 ($min, $max);
    gsl_matrix_ushort_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_ushort_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_ushort_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_ushort_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_ushort_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_ushort_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_ushort_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_ushort_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_ushort_equal($!matrix, $b.matrix) ?? True !! False }
}

class Int8 {
  class MView {
    has gsl_matrix_char_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_char_view }
    submethod DESTROY { free_gsl_matrix_char_view($!view) }
  }

  has gsl_matrix_char $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_char :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_char :$matrix?) {
    $!matrix = gsl_matrix_char_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_char_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_char_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_char_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_char_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_char_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_char_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_char_set_zero($!matrix); self }
  method identity() { gsl_matrix_char_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_char_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_char_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_char_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_char_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_char_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int8] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_char_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[int8] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_char_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_char_view_vector_char($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_char_view_vector_char_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_char_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_char $v = gsl_vector_char_calloc($!matrix.size2);
    my $ret = gsl_matrix_char_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_char_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_char $v = gsl_vector_char_calloc($!matrix.size1);
    my $ret = gsl_matrix_char_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_char_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_char $v = gsl_vector_char_calloc($!matrix.size2);
    gsl_vector_char_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_char_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_char_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_char $v = gsl_vector_char_calloc($!matrix.size1);
    gsl_vector_char_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_char_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_char_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_char_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_char_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_char_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_char_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_char_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_char_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_char_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_char_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_char_max($!matrix) }
  method min(--> Num) { gsl_matrix_char_min($!matrix) }
  method minmax(--> List) {
    my int8 ($min, $max);
    gsl_matrix_char_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_char_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_char_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_char_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_char_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_char_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_char_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_char_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_char_equal($!matrix, $b.matrix) ?? True !! False }
}

class UInt8 {
  class MView {
    has gsl_matrix_uchar_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_uchar_view }
    submethod DESTROY { free_gsl_matrix_uchar_view($!view) }
  }

  has gsl_matrix_uchar $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_uchar :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_uchar :$matrix?) {
    $!matrix = gsl_matrix_uchar_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_uchar_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_uchar_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    gsl_matrix_uchar_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_uchar_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    gsl_matrix_uchar_set(self.matrix, $i, $j, $x)
  }
  method setall(Num(Cool) $x!) { gsl_matrix_uchar_set_all($!matrix, $x); self }
  method zero() { gsl_matrix_uchar_set_zero($!matrix); self }
  method identity() { gsl_matrix_uchar_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_uchar_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_uchar_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_uchar_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_uchar_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uchar_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint8] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uchar_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[uint8] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uchar_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uchar_view_vector_uchar($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_uchar_view_vector_uchar_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_uchar_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_uchar $v = gsl_vector_uchar_calloc($!matrix.size2);
    my $ret = gsl_matrix_uchar_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_uchar_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_uchar $v = gsl_vector_uchar_calloc($!matrix.size1);
    my $ret = gsl_matrix_uchar_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take gsl_vector_uchar_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_uchar $v = gsl_vector_uchar_calloc($!matrix.size2);
    gsl_vector_uchar_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_uchar_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_uchar_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_uchar $v = gsl_vector_uchar_calloc($!matrix.size1);
    gsl_vector_uchar_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_uchar_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_uchar_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_uchar_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_uchar_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_uchar_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_uchar_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_uchar_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_uchar_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_uchar_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_uchar_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_uchar_max($!matrix) }
  method min(--> Num) { gsl_matrix_uchar_min($!matrix) }
  method minmax(--> List) {
    my uint8 ($min, $max);
    gsl_matrix_uchar_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_uchar_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_uchar_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_uchar_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_uchar_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_uchar_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_uchar_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_uchar_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_uchar_equal($!matrix, $b.matrix) ?? True !! False }
}

class Complex64 {
  class MView {
    has gsl_matrix_complex_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_complex_view }
    submethod DESTROY { free_gsl_matrix_complex_view($!view) }
  }

  has gsl_matrix_complex $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_complex :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_complex :$matrix?) {
    $!matrix = gsl_matrix_complex_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_complex_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    mgsl_matrix_complex_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    mgsl_matrix_complex_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    mgsl_matrix_complex_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    mgsl_matrix_complex_set(self.matrix, $i, $j, $x)
  }
  method setall(Complex(Cool) $x!) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_matrix_complex_set_all($!matrix, $c);
    free_gsl_complex($c);
    self
  }
  method zero() { gsl_matrix_complex_set_zero($!matrix); self }
  method identity() { gsl_matrix_complex_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_complex_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_complex_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_complex_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_complex_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num64] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_view_vector_complex($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_view_vector_complex_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_complex $v = gsl_vector_complex_calloc($!matrix.size2);
    my $ret = gsl_matrix_complex_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take mgsl_vector_complex_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_complex $v = gsl_vector_complex_calloc($!matrix.size1);
    my $ret = gsl_matrix_complex_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take mgsl_vector_complex_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_complex $v = gsl_vector_complex_calloc($!matrix.size2);
    mgsl_vector_complex_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_complex_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_complex_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_complex $v = gsl_vector_complex_calloc($!matrix.size1);
    mgsl_vector_complex_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_complex_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_complex_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_complex_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_complex_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_complex_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_complex_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_complex_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_complex_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_complex_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_complex_max($!matrix) }
  method min(--> Num) { gsl_matrix_complex_min($!matrix) }
  method minmax(--> List) {
    my num64 ($min, $max);
    gsl_matrix_complex_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_complex_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_complex_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_complex_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_complex_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_complex_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_complex_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_complex_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_complex_equal($!matrix, $b.matrix) ?? True !! False }
}

class Complex32 {
  class MView {
    has gsl_matrix_complex_float_view $.view;
    submethod BUILD { $!view = alloc_gsl_matrix_complex_float_view }
    submethod DESTROY { free_gsl_matrix_complex_float_view($!view) }
  }

  has gsl_matrix_complex_float $.matrix;

  multi method new(Int $size1!, Int $size2!)   { self.bless(:$size1, :$size2) }
  multi method new(Int :$size1!, Int :$size2!) { self.bless(:$size1, :$size2) }
  multi method new(gsl_matrix_complex_float :$matrix!) { self.bless(:$matrix) }

  submethod BUILD(Int :$size1?, Int :$size2?, gsl_matrix_complex_float :$matrix?) {
    $!matrix = gsl_matrix_complex_float_calloc($size1, $size2) if $size1.defined && $size2.defined;
    $!matrix = $matrix with $matrix;
  }

  submethod DESTROY {
    gsl_matrix_complex_float_free($!matrix);
  }
  # Accessors
  method get(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    mgsl_matrix_complex_float_get($!matrix, $i, $j)
  }
  method AT-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2 --> Num) {
    mgsl_matrix_complex_float_get(self.matrix, $i, $j)
  }
  method set(Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    mgsl_matrix_complex_float_set($!matrix, $i, $j, $x); self
  }
  method ASSIGN-POS(Math::Libgsl::Matrix:D: Int:D $i! where * < $!matrix.size1, Int:D $j! where * < $!matrix.size2, Num(Cool) $x!) {
    mgsl_matrix_complex_float_set(self.matrix, $i, $j, $x)
  }
  method setall(Complex(Cool) $x!) {
    my $c = alloc_gsl_complex_float;
    #mgsl_complex_float_rect($x.re, $x.im, $c); # doesn't exist!
    $c.dat[0] = $x.re;
    $c.dat[1] = $x.im;
    mgsl_matrix_complex_float_set_all($!matrix, $c);
    free_gsl_complex_float($c);
    self
  }
  method zero() { gsl_matrix_complex_float_set_zero($!matrix); self }
  method identity() { gsl_matrix_complex_float_set_identity($!matrix); self }
  # IO
  method write(Str $filename!) {
    my $ret = mgsl_matrix_complex_float_fwrite($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't write the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method read(Str $filename!) {
    my $ret = mgsl_matrix_complex_float_fread($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't read the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method printf(Str $filename!, Str $format!) {
    my $ret = mgsl_matrix_complex_float_fprintf($filename, $!matrix, $format);
    fail X::Libgsl.new: errno => $ret, error => "Can't print the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scanf(Str $filename!) {
    my $ret = mgsl_matrix_complex_float_fscanf($filename, $!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't scan the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  # View
  #method submatrix(size_t $k1 where * < $!matrix.size1, size_t $k2 where * < $!matrix.size2, size_t $n1, size_t $n2) {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "Submatrix indices out of bound"
  #    if $k1 + $n1 > $!matrix.size1 || $k2 + $n2 > $!matrix.size2;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_float_submatrix($mv.view, $!matrix, $k1, $k2, $n1, $n2);
  #}
  #sub mat-view-array(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_float_view_array($mv.view, $a, @array.shape[0], @array.shape[1]);
  #}
  #sub mat-view-array-tda(@array where { @array ~~ Array && @array.shape[0] ~~ UInt }, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $tda < @array.shape[1];
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  my CArray[num32] $a .= new: @array.Array».Num;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_float_view_array_with_tda($mv.view, $a, @array.shape[0], @array.shape[1], $tda);
  #}
  #sub mat-view-vector(Math::Libgsl::Vector $v, size_t $n1, size_t $n2) is export {
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_float_view_vector_complex_float($mv.view, $v.vector, $n1, $n2);
  #}
  #sub mat-view-vector-tda(Math::Libgsl::Vector $v, size_t $n1, size_t $n2, size_t $tda) is export {
  #  fail X::Libgsl.new: errno => GSL_EDOM, error => "tda out of bound" if $n2 > $tda ;
  #  my Math::Libgsl::Matrix::MView $mv .= new;
  #  Math::Libgsl::Matrix.new: matrix => mgsl_matrix_complex_float_view_vector_complex_float_with_tda($mv.view, $v.vector, $n1, $n2, $tda);
  #}
  #method row-view(size_t $i where * < $!matrix.size1) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_row($vv.view, $!matrix, $i);
  #}
  #method col-view(size_t $j where * < $!matrix.size2) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_column($vv.view, $!matrix, $j);
  #}
  #method subrow-view(size_t $i where * < $!matrix.size1, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_subrow($vv.view, $!matrix, $i, $offset, $n);
  #}
  #method subcol-view(size_t $j where * < $!matrix.size2, size_t $offset, size_t $n) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_subcolumn($vv.view, $!matrix, $j, $offset, $n);
  #}
  #method diagonal-view() {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_diagonal($vv.view, $!matrix);
  #}
  #method subdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_subdiagonal($vv.view, $!matrix, $k);
  #}
  #method superdiagonal-view(size_t $k where * < min($!matrix.size1, $!matrix.size2)) {
  #  my Math::Libgsl::Vector::VView $vv .= new;
  #  Math::Libgsl::Vector.new: vector => mgsl_matrix_complex_float_superdiagonal($vv.view, $!matrix, $k);
  #}
  # Copying matrices
  method copy(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy the matrix" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_swap($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap the matrices" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Rows and columns
  method get-row(Int:D $i where * < $!matrix.size1 --> Seq) {
    my gsl_vector_complex_float $v = gsl_vector_complex_float_calloc($!matrix.size2);
    my $ret = gsl_matrix_complex_float_get_row($v, $!matrix, $i);
    fail X::Libgsl.new: errno => $ret, error => "Can't get row" if $ret ≠ GSL_SUCCESS;
    gather take mgsl_vector_complex_float_get($v, $_) for ^$!matrix.size2;
  }
  method get-col(Int:D $j where * < $!matrix.size2 --> Seq) {
    my gsl_vector_complex_float $v = gsl_vector_complex_float_calloc($!matrix.size1);
    my $ret = gsl_matrix_complex_float_get_col($v, $!matrix, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't get col" if $ret ≠ GSL_SUCCESS;
    gather take mgsl_vector_complex_float_get($v, $_) for ^$!matrix.size1;
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, @row where *.elems == $!matrix.size2) {
    my gsl_vector_complex_float $v = gsl_vector_complex_float_calloc($!matrix.size2);
    mgsl_vector_complex_float_set($v, $_, @row[$_].Num) for ^$!matrix.size2;
    my $ret = gsl_matrix_complex_float_set_row($!matrix, $i, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-row(Int:D $i where * ≤ $!matrix.size1, Math::Libgsl::Vector $v where .vector.size == $!matrix.size2) {
    my $ret = gsl_matrix_complex_float_set_row($!matrix, $i, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set row" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, @col where *.elems == $!matrix.size1) {
    my gsl_vector_complex_float $v = gsl_vector_complex_float_calloc($!matrix.size1);
    mgsl_vector_complex_float_set($v, $_, @col[$_].Num) for ^$!matrix.size1;
    my $ret = gsl_matrix_complex_float_set_col($!matrix, $j, $v);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  multi method set-col(Int:D $j where * ≤ $!matrix.size2, Math::Libgsl::Vector $v where .vector.size == $!matrix.size1) {
    my $ret = gsl_matrix_complex_float_set_col($!matrix, $j, $v.vector);
    fail X::Libgsl.new: errno => $ret, error => "Can't set col" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Exchanging rows and columns
  method swap-rows(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    my $ret = gsl_matrix_complex_float_swap_rows($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap rows" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-cols(Int:D $i where * ≤ $!matrix.size2, Int:D $j where * ≤ $!matrix.size2) {
    my $ret = gsl_matrix_complex_float_swap_columns($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap columns" if $ret ≠ GSL_SUCCESS;
    self
  }
  method swap-rowcol(Int:D $i where * ≤ $!matrix.size1, Int:D $j where * ≤ $!matrix.size1) {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_complex_float_swap_rowcol($!matrix, $i, $j);
    fail X::Libgsl.new: errno => $ret, error => "Can't swap row & column" if $ret ≠ GSL_SUCCESS;
    self
  }
  method copy-transpose(Math::Libgsl::Matrix $src where $!matrix.size1 == .matrix.size2 && $!matrix.size2 == .matrix.size1) {
    my $ret = gsl_matrix_complex_float_transpose_memcpy($!matrix, $src.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't copy and transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  method transpose() {
    fail X::Libgsl.new: errno => GSL_ENOTSQR, error => "Not a square matrix" if $!matrix.size1 ≠ $!matrix.size2;
    my $ret = gsl_matrix_complex_float_transpose($!matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't transpose" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Matrix operations
  method add(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_add($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't add" if $ret ≠ GSL_SUCCESS;
    self
  }
  method sub(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_sub($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't sub" if $ret ≠ GSL_SUCCESS;
    self
  }
  method mul(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_mul_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't mul" if $ret ≠ GSL_SUCCESS;
    self
  }
  method div(Math::Libgsl::Matrix $b where $!matrix.size1 == .matrix.size1 && $!matrix.size2 == .matrix.size2) {
    my $ret = gsl_matrix_complex_float_div_elements($!matrix, $b.matrix);
    fail X::Libgsl.new: errno => $ret, error => "Can't div" if $ret ≠ GSL_SUCCESS;
    self
  }
  method scale(Num(Cool) $x) {
    my $ret = gsl_matrix_complex_float_scale($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't scale" if $ret ≠ GSL_SUCCESS;
    self
  }
  method add-constant(Num(Cool) $x) {
    my $ret = gsl_matrix_complex_float_add_constant($!matrix, $x);
    fail X::Libgsl.new: errno => $ret, error => "Can't add constant" if $ret ≠ GSL_SUCCESS;
    self
  }
  # Finding maximum and minimum elements of matrices
  method max(--> Num) { gsl_matrix_complex_float_max($!matrix) }
  method min(--> Num) { gsl_matrix_complex_float_min($!matrix) }
  method minmax(--> List) {
    my num32 ($min, $max);
    gsl_matrix_complex_float_minmax($!matrix, $min, $max);
    return $min, $max;
  }
  method max-index(--> List) {
    my size_t ($imax, $jmax);
    gsl_matrix_complex_float_max_index($!matrix, $imax, $jmax);
    return $imax, $jmax;
  }
  method min-index(--> List) {
    my size_t ($imin, $jmin);
    gsl_matrix_complex_float_min_index($!matrix, $imin, $jmin);
    return $imin, $jmin;
  }
  method minmax-index(--> List) {
    my size_t ($imin, $jmin, $imax, $jmax);
    gsl_matrix_complex_float_minmax_index($!matrix, $imin, $jmin, $imax, $jmax);
    return $imin, $jmin, $imax, $jmax;
  }
  # Matrix properties
  method is-null(--> Bool)   { gsl_matrix_complex_float_isnull($!matrix)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_matrix_complex_float_ispos($!matrix)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_matrix_complex_float_isneg($!matrix)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_matrix_complex_float_isnonneg($!matrix) ?? True !! False }
  method is-equal(Math::Libgsl::Matrix $b --> Bool) { gsl_matrix_complex_float_equal($!matrix, $b.matrix) ?? True !! False }
}

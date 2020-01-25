use v6;

unit class Math::Libgsl::Permutation:ver<0.0.4>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Permutation :ALL;
use Math::Libgsl::Vector;
use Math::Libgsl::Matrix;
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

method permute-num32(@data!, Int $stride! --> List)
{
  my CArray[num32] $data .= new: @data».Num;
  my $ret = gsl_permute_float($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-num32-inverse(@data!, Int $stride! --> List)
{
  my CArray[num32] $data .= new: @data».Num;
  my $ret = gsl_permute_float_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int32(@data!, Int $stride! --> List)
{
  my CArray[int32] $data .= new: @data».Num;
  my $ret = gsl_permute_int($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int32-inverse(@data!, Int $stride! --> List)
{
  my CArray[int32] $data .= new: @data».Num;
  my $ret = gsl_permute_int_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint32(@data!, Int $stride! --> List)
{
  my CArray[uint32] $data .= new: @data».Num;
  my $ret = gsl_permute_uint($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint32-inverse(@data!, Int $stride! --> List)
{
  my CArray[uint32] $data .= new: @data».Num;
  my $ret = gsl_permute_uint_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int64(@data!, Int $stride! --> List)
{
  my CArray[int64] $data .= new: @data».Num;
  my $ret = gsl_permute_long($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int64-inverse(@data!, Int $stride! --> List)
{
  my CArray[int64] $data .= new: @data».Num;
  my $ret = gsl_permute_long_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint64(@data!, Int $stride! --> List)
{
  my CArray[uint64] $data .= new: @data».Num;
  my $ret = gsl_permute_ulong($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint64-inverse(@data!, Int $stride! --> List)
{
  my CArray[uint64] $data .= new: @data».Num;
  my $ret = gsl_permute_ulong_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int16(@data!, Int $stride! --> List)
{
  my CArray[int16] $data .= new: @data».Num;
  my $ret = gsl_permute_short($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int16-inverse(@data!, Int $stride! --> List)
{
  my CArray[int16] $data .= new: @data».Num;
  my $ret = gsl_permute_short_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint16(@data!, Int $stride! --> List)
{
  my CArray[uint16] $data .= new: @data».Num;
  my $ret = gsl_permute_ushort($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint16-inverse(@data!, Int $stride! --> List)
{
  my CArray[uint16] $data .= new: @data».Num;
  my $ret = gsl_permute_ushort_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int8(@data!, Int $stride! --> List)
{
  my CArray[int8] $data .= new: @data».Num;
  my $ret = gsl_permute_char($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-int8-inverse(@data!, Int $stride! --> List)
{
  my CArray[int8] $data .= new: @data».Num;
  my $ret = gsl_permute_char_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint8(@data!, Int $stride! --> List)
{
  my CArray[uint8] $data .= new: @data».Num;
  my $ret = gsl_permute_uchar($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-uint8-inverse(@data!, Int $stride! --> List)
{
  my CArray[uint8] $data .= new: @data».Num;
  my $ret = gsl_permute_uchar_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_inverse" if $ret ≠ GSL_SUCCESS;
  $data.list
}

method permute-complex64(Complex @data!, Int $stride! --> List)
{
  my CArray[num64] $data .= new: @data.map(|*)».reals.List.flat;
  my $ret = gsl_permute_complex($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_complex" if $ret ≠ GSL_SUCCESS;
  $data.map(-> $r, $i { Complex.new($r, $i) }).list
}

method permute-complex64-inverse(Complex @data!, Int $stride! --> List)
{
  my CArray[num64] $data .= new: @data.map(|*)».reals.List.flat;
  my $ret = gsl_permute_complex_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_complex_inverse" if $ret ≠ GSL_SUCCESS;
  $data.map(-> $r, $i { Complex.new($r, $i) }).list
}

method permute-complex32(Complex @data!, Int $stride! --> List)
{
  my CArray[num32] $data .= new: @data.map(|*)».reals.List.flat;
  my $ret = gsl_permute_complex_float($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_complex_float" if $ret ≠ GSL_SUCCESS;
  $data.map(-> $r, $i { Complex.new($r, $i) }).list
}

method permute-complex32-inverse(Complex @data!, Int $stride! --> List)
{
  my CArray[num32] $data .= new: @data.map(|*)».reals.List.flat;
  my $ret = gsl_permute_complex_float_inverse($!p.data, $data, $stride, @data.elems);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute_complex_float_inverse" if $ret ≠ GSL_SUCCESS;
  $data.map(-> $r, $i { Complex.new($r, $i) }).list
}

method permute-vector(Math::Libgsl::Vector $v)
{
  my $ret = gsl_permute_vector($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-num32(Math::Libgsl::Vector::Num32 $v)
{
  my $ret = gsl_permute_vector_float($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-int32(Math::Libgsl::Vector::Int32 $v)
{
  my $ret = gsl_permute_vector_int($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-uint32(Math::Libgsl::Vector::UInt32 $v)
{
  my $ret = gsl_permute_vector_uint($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-int64(Math::Libgsl::Vector::Int64 $v)
{
  my $ret = gsl_permute_vector_long($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-uint64(Math::Libgsl::Vector::UInt64 $v)
{
  my $ret = gsl_permute_vector_ulong($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-int16(Math::Libgsl::Vector::Int16 $v)
{
  my $ret = gsl_permute_vector_short($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-uint16(Math::Libgsl::Vector::UInt16 $v)
{
  my $ret = gsl_permute_vector_ushort($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-int8(Math::Libgsl::Vector::Int8 $v)
{
  my $ret = gsl_permute_vector_char($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-uint8(Math::Libgsl::Vector::UInt8 $v)
{
  my $ret = gsl_permute_vector_uchar($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-complex64(Math::Libgsl::Vector::Complex64 $v)
{
  my $ret = gsl_permute_vector_complex($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-complex32(Math::Libgsl::Vector::Complex32 $v)
{
  my $ret = gsl_permute_vector_complex_float($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}

method permute-vector-inv(Math::Libgsl::Vector $v)
{
  my $ret = gsl_permute_vector_inverse($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-num32(Math::Libgsl::Vector::Num32 $v)
{
  my $ret = gsl_permute_vector_inverse_float($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-int32(Math::Libgsl::Vector::Int32 $v)
{
  my $ret = gsl_permute_vector_inverse_int($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-uint32(Math::Libgsl::Vector::UInt32 $v)
{
  my $ret = gsl_permute_vector_inverse_uint($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-int64(Math::Libgsl::Vector::Int64 $v)
{
  my $ret = gsl_permute_vector_inverse_long($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-uint64(Math::Libgsl::Vector::UInt64 $v)
{
  my $ret = gsl_permute_vector_inverse_ulong($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-int16(Math::Libgsl::Vector::Int16 $v)
{
  my $ret = gsl_permute_vector_inverse_short($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-uint16(Math::Libgsl::Vector::UInt16 $v)
{
  my $ret = gsl_permute_vector_inverse_ushort($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-int8(Math::Libgsl::Vector::Int8 $v)
{
  my $ret = gsl_permute_vector_inverse_char($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-uint8(Math::Libgsl::Vector::UInt8 $v)
{
  my $ret = gsl_permute_vector_inverse_uchar($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-complex64(Math::Libgsl::Vector::Complex64 $v)
{
  my $ret = gsl_permute_vector_inverse_complex($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}
method permute-vector-inv-complex32(Math::Libgsl::Vector::Complex32 $v)
{
  my $ret = gsl_permute_vector_inverse_complex_float($!p, $v.vector);
  fail X::Libgsl.new: errno => $ret, error => "Can't inverse permute the vector" if $ret ≠ GSL_SUCCESS;
  $v
}

method permute-matrix(Math::Libgsl::Matrix $m)
{
  my $ret = gsl_permute_matrix($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-num32(Math::Libgsl::Matrix::Num32 $m)
{
  my $ret = gsl_permute_matrix_float($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-int32(Math::Libgsl::Matrix::Int32 $m)
{
  my $ret = gsl_permute_matrix_int($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-uint32(Math::Libgsl::Matrix::UInt32 $m)
{
  my $ret = gsl_permute_matrix_uint($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-int64(Math::Libgsl::Matrix::Int64 $m)
{
  my $ret = gsl_permute_matrix_long($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-uint64(Math::Libgsl::Matrix::UInt64 $m)
{
  my $ret = gsl_permute_matrix_ulong($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-int16(Math::Libgsl::Matrix::Int16 $m)
{
  my $ret = gsl_permute_matrix_short($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-uint16(Math::Libgsl::Matrix::UInt16 $m)
{
  my $ret = gsl_permute_matrix_ushort($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-int8(Math::Libgsl::Matrix::Int8 $m)
{
  my $ret = gsl_permute_matrix_char($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-uint8(Math::Libgsl::Matrix::UInt8 $m)
{
  my $ret = gsl_permute_matrix_uchar($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-complex64(Math::Libgsl::Matrix::Complex64 $m)
{
  my $ret = gsl_permute_matrix_complex($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}
method permute-matrix-complex32(Math::Libgsl::Matrix::Complex32 $m)
{
  my $ret = gsl_permute_matrix_complex_float($!p, $m.matrix);
  fail X::Libgsl.new: errno => $ret, error => "Can't permute the matrix" if $ret ≠ GSL_SUCCESS;
  $m
}

method write(Str $filename! --> Int)
{
  my $ret = mgsl_permutation_fwrite($filename, $!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't write to file" if $ret ≠ GSL_SUCCESS;
  $ret;
}

method read(Str $filename! --> Int)
{
  my $ret = mgsl_permutation_fread($filename, $!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't read from file" if $ret ≠ GSL_SUCCESS;
  $ret;
}

method fprintf(Str $filename!, Str $format! --> Int)
{
  my $ret = mgsl_permutation_fprintf($filename, $!p, $format);
  fail X::Libgsl.new: errno => $ret, error => "Can't fprintf to file" if $ret ≠ GSL_SUCCESS;
  $ret;
}

method fscanf(Str $filename! --> Int)
{
  my $ret = mgsl_permutation_fscanf($filename, $!p);
  fail X::Libgsl.new: errno => $ret, error => "Can't fscanf from file" if $ret ≠ GSL_SUCCESS;
  $ret;
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

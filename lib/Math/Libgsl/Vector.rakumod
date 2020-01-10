use v6;

unit class Math::Libgsl::Vector:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Complex :ALL;
use Math::Libgsl::Raw::Matrix :ALL;
use NativeCall;

class View {
  has gsl_vector_view $.view;
  submethod BUILD { $!view = alloc_gsl_vector_view }
  submethod DESTROY { free_gsl_vector_view($!view) }
}

has gsl_vector $.vector;

multi method new(Int $size!) { self.bless(:$size) }
multi method new(Int :$size!) { self.bless(:$size) }
multi method new(gsl_vector :$vector!) { self.bless(:$vector) }

submethod BUILD(Int :$size?, gsl_vector :$vector?) {
  $!vector = gsl_vector_calloc($size) with $size;
  $!vector = $vector with $vector;
}

submethod DESTROY {
  gsl_vector_free($!vector);
}
# Accessors
method get(Int:D $index! --> Num) { gsl_vector_get($!vector, $index) }
multi method AT-POS(Math::Libgsl::Vector:D: Int:D $index! --> Num) { gsl_vector_get(self.vector, $index) }
multi method AT-POS(Math::Libgsl::Vector:D: Range:D $range! --> List) { gsl_vector_get(self.vector, $_) for $range }
method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_set($!vector, $index, $x) }
method ASSIGN-POS(Math::Libgsl::Vector:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_set(self.vector, $index, $x) }
method setall(Num(Cool) $x!) { gsl_vector_set_all($!vector, $x) }
method zero() { gsl_vector_set_zero($!vector) }
method basis(Int:D $index! --> Int) { gsl_vector_set_basis($!vector, $index) }
# IO
method write(Str $filename! --> Int) { mgsl_vector_fwrite($filename, $!vector) }
method read(Str $filename! --> Int) { mgsl_vector_fread($filename, $!vector) }
method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_fprintf($filename, $!vector, $format) }
method scanf(Str $filename! --> Int) { mgsl_vector_fscanf($filename, $!vector) }
# View
method subvector(size_t $offset, size_t $n) {
  my Math::Libgsl::Vector::View $vv .= new;
  Math::Libgsl::Vector.new: vector => mgsl_vector_subvector($vv.view, $!vector, $offset, $n);
}
method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
  my Math::Libgsl::Vector::View $vv .= new;
  Math::Libgsl::Vector.new: vector => mgsl_vector_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
}
sub view-array(@array) is export {
  my Math::Libgsl::Vector::View $vv .= new;
  my CArray[num64] $a .= new: @array».Num;
  Math::Libgsl::Vector.new: vector => mgsl_vector_view_array($vv.view, $a, @array.elems);
}
sub view-array-stride(@array, size_t $stride) is export {
  my Math::Libgsl::Vector::View $vv .= new;
  my CArray[num64] $a .= new: @array».Num;
  Math::Libgsl::Vector.new: vector => mgsl_vector_view_array_with_stride($vv.view, $a, $stride, @array.elems);
}
# Copy
method copy(Math::Libgsl::Vector $src --> Int) { gsl_vector_memcpy($!vector, $src.vector) }
method swap(Math::Libgsl::Vector $w --> Int) { gsl_vector_swap($!vector, $w.vector) }
# Exchanging elements
method swap-elems(Int $i, Int $j --> Int) { gsl_vector_swap_elements($!vector, $i, $j) }
method reverse(--> Int) { gsl_vector_reverse($!vector) }
# Vector operations
method add(Math::Libgsl::Vector $b --> Int) { gsl_vector_add($!vector, $b.vector) }
method sub(Math::Libgsl::Vector $b --> Int) { gsl_vector_sub($!vector, $b.vector) }
method mul(Math::Libgsl::Vector $b --> Int) { gsl_vector_mul($!vector, $b.vector) }
method div(Math::Libgsl::Vector $b --> Int) { gsl_vector_div($!vector, $b.vector) }
method scale(Num(Cool) $x --> Int) { gsl_vector_scale($!vector, $x) }
method add-constant(Num(Cool) $x --> Int) { gsl_vector_add_constant($!vector, $x) }
# Finding maximum and minimum elements of vectors
method max(--> Num) { gsl_vector_max($!vector) }
method min(--> Num) { gsl_vector_min($!vector) }
method minmax(--> List)
{
  my num64 ($min, $max);
  gsl_vector_minmax($!vector, $min, $max);
  return $min, $max;
}
method max-index(--> Int) { gsl_vector_max_index($!vector) }
method min-index(--> Int) { gsl_vector_min_index($!vector) }
method minmax-index(--> List)
{
  my size_t ($imin, $imax);
  gsl_vector_minmax_index($!vector, $imin, $imax);
  return $imin, $imax;
}
# Vector properties
method is-null(--> Bool)   { gsl_vector_isnull($!vector)   ?? True !! False }
method is-pos(--> Bool)    { gsl_vector_ispos($!vector)    ?? True !! False }
method is-neg(--> Bool)    { gsl_vector_isneg($!vector)    ?? True !! False }
method is-nonneg(--> Bool) { gsl_vector_isnonneg($!vector) ?? True !! False }
method is-equal(Math::Libgsl::Vector $b --> Bool) { gsl_vector_equal($!vector, $b.vector) ?? True !! False }

class Num32 {
  class View {
    has gsl_vector_float_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_float_view }
    submethod DESTROY { free_gsl_vector_float_view($!view) }
  }

  has gsl_vector_float $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_float :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_float :$vector?) {
    $!vector = gsl_vector_float_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_float_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_float_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Num32:D: Int:D $index! --> Num) { gsl_vector_float_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Num32:D: Range:D $range! --> List) { gsl_vector_float_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_float_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::Num32:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_float_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_float_set_all($!vector, $x) }
  method zero() { gsl_vector_float_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_float_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_float_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_float_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_float_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_float_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_float_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_float_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-float-array(@array) is export {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    my CArray[num32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_float_view_array($vv.view, $a, @array.elems);
  }
  sub view-float-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    my CArray[num32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_float_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Num32 $src --> Int) { gsl_vector_float_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Num32 $w --> Int) { gsl_vector_float_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_float_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_float_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Num32 $b --> Int) { gsl_vector_float_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Num32 $b --> Int) { gsl_vector_float_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Num32 $b --> Int) { gsl_vector_float_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Num32 $b --> Int) { gsl_vector_float_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_float_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_float_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> Num) { gsl_vector_float_max($!vector) }
  method min(--> Num) { gsl_vector_float_min($!vector) }
  method minmax(--> List)
  {
    my num32 ($min, $max);
    gsl_vector_float_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_float_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_float_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_float_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_float_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_float_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_float_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_float_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Num32 $b --> Bool) { gsl_vector_float_equal($!vector, $b.vector) ?? True !! False }
}

class Int32 {
  class View {
    has gsl_vector_int_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_int_view }
    submethod DESTROY { free_gsl_vector_int_view($!view) }
  }

  has gsl_vector_int $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_int :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_int :$vector?) {
    $!vector = gsl_vector_int_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_int_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_int_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int32:D: Int:D $index! --> Num) { gsl_vector_int_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int32:D: Range:D $range! --> List) { gsl_vector_int_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_int_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::Int32:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_int_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_int_set_all($!vector, $x) }
  method zero() { gsl_vector_int_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_int_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_int_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_int_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_int_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_int_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Int32::View $vv .= new;
    Math::Libgsl::Vector::Int32.new: vector => mgsl_vector_int_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Int32::View $vv .= new;
    Math::Libgsl::Vector::Int32.new: vector => mgsl_vector_int_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-int32-array(@array) is export {
    my Math::Libgsl::Vector::Int32::View $vv .= new;
    my CArray[int32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int32.new: vector => mgsl_vector_int_view_array($vv.view, $a, @array.elems);
  }
  sub view-int32-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Int32::View $vv .= new;
    my CArray[int32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int32.new: vector => mgsl_vector_int_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Int32 $src --> Int) { gsl_vector_int_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Int32 $w --> Int) { gsl_vector_int_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_int_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_int_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Int32 $b --> Int) { gsl_vector_int_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Int32 $b --> Int) { gsl_vector_int_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Int32 $b --> Int) { gsl_vector_int_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Int32 $b --> Int) { gsl_vector_int_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_int_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_int_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> Int) { gsl_vector_int_max($!vector) }
  method min(--> Int) { gsl_vector_int_min($!vector) }
  method minmax(--> List)
  {
    my int32 ($min, $max);
    gsl_vector_int_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_int_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_int_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_int_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_int_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_int_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_int_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_int_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Int32 $b --> Bool) { gsl_vector_int_equal($!vector, $b.vector) ?? True !! False }
}

class UInt32 {
  class View {
    has gsl_vector_uint_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_uint_view }
    submethod DESTROY { free_gsl_vector_uint_view($!view) }
  }

  has gsl_vector_uint $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_uint :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_uint :$vector?) {
    $!vector = gsl_vector_uint_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_uint_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_uint_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt32:D: Int:D $index! --> Num) { gsl_vector_uint_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt32:D: Range:D $range! --> List) { gsl_vector_uint_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_uint_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::UInt32:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_uint_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_uint_set_all($!vector, $x) }
  method zero() { gsl_vector_uint_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_uint_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_uint_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_uint_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_uint_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_uint_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::UInt32::View $vv .= new;
    Math::Libgsl::Vector::UInt32.new: vector => mgsl_vector_uint_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::UInt32::View $vv .= new;
    Math::Libgsl::Vector::UInt32.new: vector => mgsl_vector_uint_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-uint32-array(@array) is export {
    my Math::Libgsl::Vector::UInt32::View $vv .= new;
    my CArray[uint32] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt32.new: vector => mgsl_vector_uint_view_array($vv.view, $a, @array.elems);
  }
  sub view-uint32-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::UInt32::View $vv .= new;
    my CArray[uint32] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt32.new: vector => mgsl_vector_uint_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::UInt32 $src --> Int) { gsl_vector_uint_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::UInt32 $w --> Int) { gsl_vector_uint_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_uint_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_uint_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::UInt32 $b --> Int) { gsl_vector_uint_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::UInt32 $b --> Int) { gsl_vector_uint_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::UInt32 $b --> Int) { gsl_vector_uint_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::UInt32 $b --> Int) { gsl_vector_uint_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_uint_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_uint_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> UInt) { gsl_vector_uint_max($!vector) }
  method min(--> UInt) { gsl_vector_uint_min($!vector) }
  method minmax(--> List)
  {
    my uint32 ($min, $max);
    gsl_vector_uint_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_uint_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_uint_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_uint_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_uint_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_uint_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_uint_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_uint_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::UInt32 $b --> Bool) { gsl_vector_uint_equal($!vector, $b.vector) ?? True !! False }
}

class Int64 {
  class View {
    has gsl_vector_long_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_long_view }
    submethod DESTROY { free_gsl_vector_long_view($!view) }
  }

  has gsl_vector_long $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_long :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_long :$vector?) {
    $!vector = gsl_vector_long_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_long_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_long_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int64:D: Int:D $index! --> Num) { gsl_vector_long_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int64:D: Range:D $range! --> List) { gsl_vector_long_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_long_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::Int64:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_long_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_long_set_all($!vector, $x) }
  method zero() { gsl_vector_long_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_long_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_long_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_long_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_long_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_long_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Int64::View $vv .= new;
    Math::Libgsl::Vector::Int64.new: vector => mgsl_vector_long_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Int64::View $vv .= new;
    Math::Libgsl::Vector::Int64.new: vector => mgsl_vector_long_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-long-array(@array) is export {
    my Math::Libgsl::Vector::Int64::View $vv .= new;
    my CArray[int64] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int64.new: vector => mgsl_vector_long_view_array($vv.view, $a, @array.elems);
  }
  sub view-long-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Int64::View $vv .= new;
    my CArray[int64] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int64.new: vector => mgsl_vector_long_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Int64 $src --> Int) { gsl_vector_long_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Int64 $w --> Int) { gsl_vector_long_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_long_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_long_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Int64 $b --> Int) { gsl_vector_long_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Int64 $b --> Int) { gsl_vector_long_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Int64 $b --> Int) { gsl_vector_long_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Int64 $b --> Int) { gsl_vector_long_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_long_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_long_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> Int) { gsl_vector_long_max($!vector) }
  method min(--> Int) { gsl_vector_long_min($!vector) }
  method minmax(--> List)
  {
    my int64 ($min, $max);
    gsl_vector_long_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_long_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_long_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_long_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_long_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_long_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_long_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_long_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Int64 $b --> Bool) { gsl_vector_long_equal($!vector, $b.vector) ?? True !! False }
}

class UInt64 {
  class View {
    has gsl_vector_ulong_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_ulong_view }
    submethod DESTROY { free_gsl_vector_ulong_view($!view) }
  }

  has gsl_vector_ulong $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_ulong :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_ulong :$vector?) {
    $!vector = gsl_vector_ulong_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_ulong_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_ulong_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt64:D: Int:D $index! --> Num) { gsl_vector_ulong_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt64:D: Range:D $range! --> List) { gsl_vector_ulong_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_ulong_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::UInt64:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_ulong_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_ulong_set_all($!vector, $x) }
  method zero() { gsl_vector_ulong_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_ulong_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_ulong_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_ulong_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_ulong_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_ulong_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::UInt64::View $vv .= new;
    Math::Libgsl::Vector::UInt64.new: vector => mgsl_vector_ulong_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::UInt64::View $vv .= new;
    Math::Libgsl::Vector::UInt64.new: vector => mgsl_vector_ulong_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-ulong-array(@array) is export {
    my Math::Libgsl::Vector::UInt64::View $vv .= new;
    my CArray[uint64] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt64.new: vector => mgsl_vector_ulong_view_array($vv.view, $a, @array.elems);
  }
  sub view-ulong-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::UInt64::View $vv .= new;
    my CArray[uint64] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt64.new: vector => mgsl_vector_ulong_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::UInt64 $src --> Int) { gsl_vector_ulong_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::UInt64 $w --> Int) { gsl_vector_ulong_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_ulong_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_ulong_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::UInt64 $b --> Int) { gsl_vector_ulong_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::UInt64 $b --> Int) { gsl_vector_ulong_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::UInt64 $b --> Int) { gsl_vector_ulong_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::UInt64 $b --> Int) { gsl_vector_ulong_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_ulong_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_ulong_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> UInt) { gsl_vector_ulong_max($!vector) }
  method min(--> UInt) { gsl_vector_ulong_min($!vector) }
  method minmax(--> List)
  {
    my uint64 ($min, $max);
    gsl_vector_ulong_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_ulong_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_ulong_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_ulong_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_ulong_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_ulong_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_ulong_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_ulong_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::UInt64 $b --> Bool) { gsl_vector_ulong_equal($!vector, $b.vector) ?? True !! False }
}

class Int16 {
  class View {
    has gsl_vector_short_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_short_view }
    submethod DESTROY { free_gsl_vector_short_view($!view) }
  }

  has gsl_vector_short $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_short :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_short :$vector?) {
    $!vector = gsl_vector_short_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_short_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_short_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int16:D: Int:D $index! --> Num) { gsl_vector_short_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int16:D: Range:D $range! --> List) { gsl_vector_short_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_short_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::Int16:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_short_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_short_set_all($!vector, $x) }
  method zero() { gsl_vector_short_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_short_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_short_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_short_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_short_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_short_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Int16::View $vv .= new;
    Math::Libgsl::Vector::Int16.new: vector => mgsl_vector_short_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Int16::View $vv .= new;
    Math::Libgsl::Vector::Int16.new: vector => mgsl_vector_short_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-short-array(@array) is export {
    my Math::Libgsl::Vector::Int16::View $vv .= new;
    my CArray[int16] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int16.new: vector => mgsl_vector_short_view_array($vv.view, $a, @array.elems);
  }
  sub view-short-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Int16::View $vv .= new;
    my CArray[int16] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int16.new: vector => mgsl_vector_short_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Int16 $src --> Int) { gsl_vector_short_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Int16 $w --> Int) { gsl_vector_short_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_short_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_short_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Int16 $b --> Int) { gsl_vector_short_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Int16 $b --> Int) { gsl_vector_short_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Int16 $b --> Int) { gsl_vector_short_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Int16 $b --> Int) { gsl_vector_short_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_short_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_short_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> Int) { gsl_vector_short_max($!vector) }
  method min(--> Int) { gsl_vector_short_min($!vector) }
  method minmax(--> List)
  {
    my int16 ($min, $max);
    gsl_vector_short_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_short_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_short_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_short_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_short_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_short_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_short_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_short_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Int16 $b --> Bool) { gsl_vector_short_equal($!vector, $b.vector) ?? True !! False }
}

class UInt16 {
  class View {
    has gsl_vector_ushort_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_ushort_view }
    submethod DESTROY { free_gsl_vector_ushort_view($!view) }
  }

  has gsl_vector_ushort $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_ushort :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_ushort :$vector?) {
    $!vector = gsl_vector_ushort_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_ushort_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_ushort_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt16:D: Int:D $index! --> Num) { gsl_vector_ushort_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt16:D: Range:D $range! --> List) { gsl_vector_ushort_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_ushort_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::UInt16:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_ushort_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_ushort_set_all($!vector, $x) }
  method zero() { gsl_vector_ushort_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_ushort_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_ushort_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_ushort_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_ushort_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_ushort_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::UInt16::View $vv .= new;
    Math::Libgsl::Vector::UInt16.new: vector => mgsl_vector_ushort_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::UInt16::View $vv .= new;
    Math::Libgsl::Vector::UInt16.new: vector => mgsl_vector_ushort_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-ushort-array(@array) is export {
    my Math::Libgsl::Vector::UInt16::View $vv .= new;
    my CArray[uint16] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt16.new: vector => mgsl_vector_ushort_view_array($vv.view, $a, @array.elems);
  }
  sub view-ushort-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::UInt16::View $vv .= new;
    my CArray[uint16] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt16.new: vector => mgsl_vector_ushort_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::UInt16 $src --> Int) { gsl_vector_ushort_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::UInt16 $w --> Int) { gsl_vector_ushort_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_ushort_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_ushort_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::UInt16 $b --> Int) { gsl_vector_ushort_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::UInt16 $b --> Int) { gsl_vector_ushort_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::UInt16 $b --> Int) { gsl_vector_ushort_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::UInt16 $b --> Int) { gsl_vector_ushort_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_ushort_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_ushort_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> UInt) { gsl_vector_ushort_max($!vector) }
  method min(--> UInt) { gsl_vector_ushort_min($!vector) }
  method minmax(--> List)
  {
    my uint16 ($min, $max);
    gsl_vector_ushort_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_ushort_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_ushort_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_ushort_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_ushort_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_ushort_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_ushort_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_ushort_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::UInt16 $b --> Bool) { gsl_vector_ushort_equal($!vector, $b.vector) ?? True !! False }
}

class Int8 {
  class View {
    has gsl_vector_char_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_char_view }
    submethod DESTROY { free_gsl_vector_char_view($!view) }
  }

  has gsl_vector_char $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_char :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_char :$vector?) {
    $!vector = gsl_vector_char_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_char_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_char_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int8:D: Int:D $index! --> Num) { gsl_vector_char_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::Int8:D: Range:D $range! --> List) { gsl_vector_char_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_char_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::Int8:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_char_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_char_set_all($!vector, $x) }
  method zero() { gsl_vector_char_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_char_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_char_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_char_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_char_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_char_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Int8::View $vv .= new;
    Math::Libgsl::Vector::Int8.new: vector => mgsl_vector_char_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Int8::View $vv .= new;
    Math::Libgsl::Vector::Int8.new: vector => mgsl_vector_char_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-char-array(@array) is export {
    my Math::Libgsl::Vector::Int8::View $vv .= new;
    my CArray[int8] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int8.new: vector => mgsl_vector_char_view_array($vv.view, $a, @array.elems);
  }
  sub view-char-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Int8::View $vv .= new;
    my CArray[int8] $a .= new: @array».Num;
    Math::Libgsl::Vector::Int8.new: vector => mgsl_vector_char_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Int8 $src --> Int) { gsl_vector_char_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Int8 $w --> Int) { gsl_vector_char_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_char_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_char_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Int8 $b --> Int) { gsl_vector_char_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Int8 $b --> Int) { gsl_vector_char_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Int8 $b --> Int) { gsl_vector_char_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Int8 $b --> Int) { gsl_vector_char_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_char_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_char_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> Int) { gsl_vector_char_max($!vector) }
  method min(--> Int) { gsl_vector_char_min($!vector) }
  method minmax(--> List)
  {
    my int8 ($min, $max);
    gsl_vector_char_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_char_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_char_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_char_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_char_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_char_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_char_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_char_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Int8 $b --> Bool) { gsl_vector_char_equal($!vector, $b.vector) ?? True !! False }
}

class UInt8 {
  class View {
    has gsl_vector_uchar_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_uchar_view }
    submethod DESTROY { free_gsl_vector_uchar_view($!view) }
  }

  has gsl_vector_uchar $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_uchar :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_uchar :$vector?) {
    $!vector = gsl_vector_uchar_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_uchar_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Num) { gsl_vector_uchar_get($!vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt8:D: Int:D $index! --> Num) { gsl_vector_uchar_get(self.vector, $index) }
  multi method AT-POS(Math::Libgsl::Vector::UInt8:D: Range:D $range! --> List) { gsl_vector_uchar_get(self.vector, $_) for $range }
  method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_uchar_set($!vector, $index, $x) }
  method ASSIGN-POS(Math::Libgsl::Vector::UInt8:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_uchar_set(self.vector, $index, $x) }
  method setall(Num(Cool) $x!) { gsl_vector_uchar_set_all($!vector, $x) }
  method zero() { gsl_vector_uchar_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_uchar_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_uchar_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_uchar_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_uchar_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_uchar_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::UInt8::View $vv .= new;
    Math::Libgsl::Vector::UInt8.new: vector => mgsl_vector_uchar_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::UInt8::View $vv .= new;
    Math::Libgsl::Vector::UInt8.new: vector => mgsl_vector_uchar_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-uchar-array(@array) is export {
    my Math::Libgsl::Vector::UInt8::View $vv .= new;
    my CArray[uint8] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt8.new: vector => mgsl_vector_uchar_view_array($vv.view, $a, @array.elems);
  }
  sub view-uchar-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::UInt8::View $vv .= new;
    my CArray[uint8] $a .= new: @array».Num;
    Math::Libgsl::Vector::UInt8.new: vector => mgsl_vector_uchar_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  # Copy
  method copy(Math::Libgsl::Vector::UInt8 $src --> Int) { gsl_vector_uchar_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::UInt8 $w --> Int) { gsl_vector_uchar_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_uchar_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_uchar_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::UInt8 $b --> Int) { gsl_vector_uchar_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::UInt8 $b --> Int) { gsl_vector_uchar_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::UInt8 $b --> Int) { gsl_vector_uchar_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::UInt8 $b --> Int) { gsl_vector_uchar_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) { gsl_vector_uchar_scale($!vector, $x) }
  method add-constant(Num(Cool) $x --> Int) { gsl_vector_uchar_add_constant($!vector, $x) }
  # Finding maximum and minimum elements of vectors
  method max(--> UInt) { gsl_vector_uchar_max($!vector) }
  method min(--> UInt) { gsl_vector_uchar_min($!vector) }
  method minmax(--> List)
  {
    my uint8 ($min, $max);
    gsl_vector_uchar_minmax($!vector, $min, $max);
    return $min, $max;
  }
  method max-index(--> Int) { gsl_vector_uchar_max_index($!vector) }
  method min-index(--> Int) { gsl_vector_uchar_min_index($!vector) }
  method minmax-index(--> List)
  {
    my size_t ($imin, $imax);
    gsl_vector_uchar_minmax_index($!vector, $imin, $imax);
    return $imin, $imax;
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_uchar_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_uchar_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_uchar_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_uchar_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::UInt8 $b --> Bool) { gsl_vector_uchar_equal($!vector, $b.vector) ?? True !! False }
}

class Complex64 {
  class View {
    has gsl_vector_complex_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_complex_view }
    submethod DESTROY { free_gsl_vector_complex_view($!view) }
  }

  has gsl_vector_complex $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_complex :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_complex :$vector?) {
    $!vector = gsl_vector_complex_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_complex_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Complex) {
    my gsl_complex $c = alloc_gsl_complex;
    mgsl_vector_complex_get($!vector, $index, $c);
    my Complex $nc = $c.dat[0] + i * $c.dat[1];
    free_gsl_complex($c);
    $nc;
  }
  multi method AT-POS(Math::Libgsl::Vector::Complex64:D: Int:D $index! --> Complex) {
    my $c = alloc_gsl_complex;
    mgsl_vector_complex_get($!vector, $index, $c);
    my Complex $nc = $c.dat[0] + i * $c.dat[1];
    free_gsl_complex($c);
    $nc;
  }
  multi method AT-POS(Math::Libgsl::Vector::Complex64:D: Range:D $range! --> List) {
    my Complex @cv;
    for $range {
      my $c = alloc_gsl_complex;
      mgsl_vector_complex_get($!vector, $_, $c);
      my Complex $nc = $c.dat[0] + i * $c.dat[1];
      @cv.push: $nc;
      free_gsl_complex($c);
    }
    @cv;
  }
  method set(Int:D $index!, Complex $x!) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_set($!vector, $index, $c);
    free_gsl_complex($c);
  }
  method ASSIGN-POS(Math::Libgsl::Vector::Complex64:D: Int:D $index!, Num(Cool) $x!) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_set($!vector, $index, $c);
    free_gsl_complex($c);
  }
  method setall(Complex $x!) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_set_all($!vector, $c);
    free_gsl_complex($c);
  }
  method zero() { gsl_vector_complex_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_complex_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_complex_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_complex_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_complex_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_complex_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Complex64::View $vv .= new;
    Math::Libgsl::Vector::Complex64.new: vector => mgsl_vector_complex_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Complex64::View $vv .= new;
    Math::Libgsl::Vector::Complex64.new: vector => mgsl_vector_complex_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-complex64-array(@array) is export {
    my Math::Libgsl::Vector::Complex64::View $vv .= new;
    my CArray[num64] $a .= new: @array».Num;
    Math::Libgsl::Vector::Complex64.new: vector => mgsl_vector_complex_view_array($vv.view, $a, @array.elems);
  }
  sub view-complex64-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Complex64::View $vv .= new;
    my CArray[num64] $a .= new: @array».Num;
    Math::Libgsl::Vector::Complex64.new: vector => mgsl_vector_complex_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  method complex64-real() {
    my Math::Libgsl::Vector::View $vv .= new;
    Math::Libgsl::Vector.new: vector => mgsl_vector_complex_real($vv.view, $!vector);
  }
  method complex64-imag() {
    my Math::Libgsl::Vector::View $vv .= new;
    Math::Libgsl::Vector.new: vector => mgsl_vector_complex_imag($vv.view, $!vector);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Complex64 $src --> Int) { gsl_vector_complex_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Complex64 $w --> Int) { gsl_vector_complex_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_complex_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_complex_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Complex64 $b --> Int) { gsl_vector_complex_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Complex64 $b --> Int) { gsl_vector_complex_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Complex64 $b --> Int) { gsl_vector_complex_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Complex64 $b --> Int) { gsl_vector_complex_div($!vector, $b.vector) }
  method scale(Complex $x --> Int) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_scale($!vector, $c);
    free_gsl_complex($c);
  }
  method add-constant(Complex $x --> Int) {
    my $c = alloc_gsl_complex;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_add_constant($!vector, $c);
    free_gsl_complex($c);
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_complex_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_complex_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_complex_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_complex_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Complex64 $b --> Bool) { gsl_vector_complex_equal($!vector, $b.vector) ?? True !! False }
}

class Complex32 {
  class View {
    has gsl_vector_complex_float_view $.view;
    submethod BUILD { $!view = alloc_gsl_vector_complex_float_view }
    submethod DESTROY { free_gsl_vector_complex_float_view($!view) }
  }

  has gsl_vector_complex_float $.vector;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }
  multi method new(gsl_vector_complex_float :$vector!) { self.bless(:$vector) }

  submethod BUILD(Int :$size?, gsl_vector_complex_float :$vector?) {
    $!vector = gsl_vector_complex_float_calloc($size) with $size;
    $!vector = $vector with $vector;
  }

  submethod DESTROY {
    gsl_vector_complex_float_free($!vector);
  }
  # Accessors
  method get(Int:D $index! --> Complex) {
    my gsl_complex_float $c = alloc_gsl_complex_float;
    mgsl_vector_complex_float_get($!vector, $index, $c);
    my Complex $nc = $c.dat[0] + i * $c.dat[1];
    free_gsl_complex_float($c);
    $nc;
  }
  multi method AT-POS(Math::Libgsl::Vector::Complex32:D: Int:D $index! --> Complex) {
    my gsl_complex_float $c = alloc_gsl_complex_float;
    mgsl_vector_complex_float_get($!vector, $index, $c);
    my Complex $nc = $c.dat[0] + i * $c.dat[1];
    free_gsl_complex_float($c);
    $nc;
  }
  multi method AT-POS(Math::Libgsl::Vector::Complex32:D: Range:D $range! --> List) {
    my Complex @cv;
    for $range {
      my $c = alloc_gsl_complex_float;
      mgsl_vector_complex_float_get($!vector, $_, $c);
      my Complex $nc = $c.dat[0] + i * $c.dat[1];
      @cv.push: $nc;
      free_gsl_complex_float($c);
    }
    @cv;
  }
  method set(Int:D $index!, Num(Cool) $x!) {
    my $c = alloc_gsl_complex_float;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_float_set($!vector, $index, $c);
    free_gsl_complex_float($c);
  }
  method ASSIGN-POS(Math::Libgsl::Vector::Complex32:D: Int:D $index!, Num(Cool) $x!) {
    my $c = alloc_gsl_complex_float;
    mgsl_complex_rect($x.re, $x.im, $c);
    mgsl_vector_complex_float_set($!vector, $index, $c);
    free_gsl_complex_float($c);
  }
  method setall(Num(Cool) $x!) {
    my $c = alloc_gsl_complex_float;
    #mgsl_complex_float_rect($x.re, $x.im, $c); # doesn't exist!
    $c.dat[0] = $x.re;
    $c.dat[1] = $x.im;
    mgsl_vector_complex_float_set_all($!vector, $c);
    free_gsl_complex_float($c);
  }
  method zero() { gsl_vector_complex_float_set_zero($!vector) }
  method basis(Int:D $index! --> Int) { gsl_vector_complex_float_set_basis($!vector, $index) }
  # IO
  method write(Str $filename! --> Int) { mgsl_vector_complex_float_fwrite($filename, $!vector) }
  method read(Str $filename! --> Int) { mgsl_vector_complex_float_fread($filename, $!vector) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_complex_float_fprintf($filename, $!vector, $format) }
  method scanf(Str $filename! --> Int) { mgsl_vector_complex_float_fscanf($filename, $!vector) }
  # View
  method subvector(size_t $offset, size_t $n) {
    my Math::Libgsl::Vector::Complex32::View $vv .= new;
    Math::Libgsl::Vector::Complex32.new: vector => mgsl_vector_complex_float_subvector($vv.view, $!vector, $offset, $n);
  }
  method subvector-stride(size_t $offset, size_t $stride, size_t $n) {
    my Math::Libgsl::Vector::Complex32::View $vv .= new;
    Math::Libgsl::Vector::Complex32.new: vector => mgsl_vector_complex_float_subvector_with_stride($vv.view, $!vector, $offset, $stride, $n);
  }
  sub view-complex32-array(@array) is export {
    my Math::Libgsl::Vector::Complex32::View $vv .= new;
    my CArray[num32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Complex32.new: vector => mgsl_vector_complex_float_view_array($vv.view, $a, @array.elems);
  }
  sub view-complex32-array-stride(@array, size_t $stride) is export {
    my Math::Libgsl::Vector::Complex32::View $vv .= new;
    my CArray[num32] $a .= new: @array».Num;
    Math::Libgsl::Vector::Complex32.new: vector => mgsl_vector_complex_float_view_array_with_stride($vv.view, $a, $stride, @array.elems);
  }
  method complex32-real() {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_complex_float_real($vv.view, $!vector);
  }
  method complex32-imag() {
    my Math::Libgsl::Vector::Num32::View $vv .= new;
    Math::Libgsl::Vector::Num32.new: vector => mgsl_vector_complex_float_imag($vv.view, $!vector);
  }
  # Copy
  method copy(Math::Libgsl::Vector::Complex32 $src --> Int) { gsl_vector_complex_float_memcpy($!vector, $src.vector) }
  method swap(Math::Libgsl::Vector::Complex32 $w --> Int) { gsl_vector_complex_float_swap($!vector, $w.vector) }
  # Exchanging elements
  method swap-elems(Int $i, Int $j --> Int) { gsl_vector_complex_float_swap_elements($!vector, $i, $j) }
  method reverse(--> Int) { gsl_vector_complex_float_reverse($!vector) }
  # Vector operations
  method add(Math::Libgsl::Vector::Complex32 $b --> Int) { gsl_vector_complex_float_add($!vector, $b.vector) }
  method sub(Math::Libgsl::Vector::Complex32 $b --> Int) { gsl_vector_complex_float_sub($!vector, $b.vector) }
  method mul(Math::Libgsl::Vector::Complex32 $b --> Int) { gsl_vector_complex_float_mul($!vector, $b.vector) }
  method div(Math::Libgsl::Vector::Complex32 $b --> Int) { gsl_vector_complex_float_div($!vector, $b.vector) }
  method scale(Num(Cool) $x --> Int) {
    my $c = alloc_gsl_complex_float;
    #mgsl_complex_float_rect($x.re, $x.im, $c); # doesn't exist!
    $c.dat[0] = $x.re;
    $c.dat[1] = $x.im;
    mgsl_vector_complex_float_scale($!vector, $c);
    free_gsl_complex_float($c);
  }
  method add-constant(Num(Cool) $x --> Int) {
    my $c = alloc_gsl_complex_float;
    #mgsl_complex_float_rect($x.re, $x.im, $c); # doesn't exist!
    $c.dat[0] = $x.re;
    $c.dat[1] = $x.im;
    mgsl_vector_complex_float_add_constant($!vector, $c);
    free_gsl_complex_float($c);
  }
  # Vector properties
  method is-null(--> Bool)   { gsl_vector_complex_float_isnull($!vector)   ?? True !! False }
  method is-pos(--> Bool)    { gsl_vector_complex_float_ispos($!vector)    ?? True !! False }
  method is-neg(--> Bool)    { gsl_vector_complex_float_isneg($!vector)    ?? True !! False }
  method is-nonneg(--> Bool) { gsl_vector_complex_float_isnonneg($!vector) ?? True !! False }
  method is-equal(Math::Libgsl::Vector::Complex32 $b --> Bool) { gsl_vector_complex_float_equal($!vector, $b.vector) ?? True !! False }
}

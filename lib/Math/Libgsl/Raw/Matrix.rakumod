use v6;

unit module Math::Libgsl::Raw::Matrix:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Complex :ALL;
use NativeCall;
use LibraryMake;

constant GSLHELPER = %?RESOURCES<libraries/gslhelper>.absolute;

constant LIB  = ('gsl', v23);

class gsl_block is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[num64]  $.data;
}

class gsl_block_float is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[num32]  $.data;
}

class gsl_block_int is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[int32]  $.data;
}

class gsl_block_uint is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[uint32] $.data;
}

class gsl_block_long is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[int64]  $.data;
}

class gsl_block_ulong is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[uint64] $.data;
}

class gsl_block_short is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[int16]  $.data;
}

class gsl_block_ushort is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[uint16] $.data;
}

class gsl_block_char is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[int8]   $.data;
}

class gsl_block_uchar is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[uint8]  $.data;
}

class gsl_block_complex is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[num64]  $.data;
}

class gsl_block_complex_float is repr('CStruct') is export {
  has size_t          $.size;
  has Pointer[num32]  $.data;
}

class gsl_vector is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[num64]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_vector_float is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[num32]  $.data;
  has gsl_block_float $.block;
  has int32           $.owner;
}

class gsl_vector_int is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[int32]  $.data;
  has gsl_block_int   $.block;
  has int32           $.owner;
}

class gsl_vector_uint is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[uint32] $.data;
  has gsl_block_uint  $.block;
  has int32           $.owner;
}

class gsl_vector_long is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[int64]  $.data;
  has gsl_block_long  $.block;
  has int32           $.owner;
}

class gsl_vector_ulong is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[uint64] $.data;
  has gsl_block_ulong $.block;
  has int32           $.owner;
}

class gsl_vector_short is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[int16]  $.data;
  has gsl_block_short $.block;
  has int32           $.owner;
}

class gsl_vector_ushort is repr('CStruct') is export {
  has size_t           $.size;
  has size_t           $.stride;
  has Pointer[uint16]  $.data;
  has gsl_block_ushort $.block;
  has int32            $.owner;
}

class gsl_vector_char is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[int8]   $.data;
  has gsl_block_char  $.block;
  has int32           $.owner;
}

class gsl_vector_uchar is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[uint8]  $.data;
  has gsl_block_uchar $.block;
  has int32           $.owner;
}

class gsl_vector_complex is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[num64]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_vector_complex_float is repr('CStruct') is export {
  has size_t          $.size;
  has size_t          $.stride;
  has Pointer[num32]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_vector_view is repr('CStruct') is export {
  has gsl_vector      $.vector;
}

class gsl_vector_float_view is repr('CStruct') is export {
  has gsl_vector_float      $.vector;
}

class gsl_vector_int_view is repr('CStruct') is export {
  has gsl_vector_int      $.vector;
}

class gsl_vector_uint_view is repr('CStruct') is export {
  has gsl_vector_uint      $.vector;
}

class gsl_vector_long_view is repr('CStruct') is export {
  has gsl_vector_long      $.vector;
}

class gsl_vector_ulong_view is repr('CStruct') is export {
  has gsl_vector_ulong      $.vector;
}

class gsl_vector_short_view is repr('CStruct') is export {
  has gsl_vector_short      $.vector;
}

class gsl_vector_ushort_view is repr('CStruct') is export {
  has gsl_vector_ushort      $.vector;
}

class gsl_vector_char_view is repr('CStruct') is export {
  has gsl_vector_char      $.vector;
}

class gsl_vector_uchar_view is repr('CStruct') is export {
  has gsl_vector_uchar      $.vector;
}

class gsl_vector_complex_view is repr('CStruct') is export {
  has gsl_vector_complex      $.vector;
}

class gsl_vector_complex_float_view is repr('CStruct') is export {
  has gsl_vector_complex_float      $.vector;
}

class gsl_matrix is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[num64]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_matrix_float is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[num32]  $.data;
  has gsl_block_float $.block;
  has int32           $.owner;
}

class gsl_matrix_int is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[int32]  $.data;
  has gsl_block_int   $.block;
  has int32           $.owner;
}

class gsl_matrix_uint is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[uint32] $.data;
  has gsl_block_uint  $.block;
  has int32           $.owner;
}

class gsl_matrix_long is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[int64]  $.data;
  has gsl_block_long  $.block;
  has int32           $.owner;
}

class gsl_matrix_ulong is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[uint64] $.data;
  has gsl_block_ulong $.block;
  has int32           $.owner;
}

class gsl_matrix_short is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[int16]  $.data;
  has gsl_block_short $.block;
  has int32           $.owner;
}

class gsl_matrix_ushort is repr('CStruct') is export {
  has size_t           $.size1;
  has size_t           $.size2;
  has size_t           $.tda;
  has Pointer[uint16]  $.data;
  has gsl_block_ushort $.block;
  has int32            $.owner;
}

class gsl_matrix_char is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[int8]   $.data;
  has gsl_block_char  $.block;
  has int32           $.owner;
}

class gsl_matrix_uchar is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[uint8]  $.data;
  has gsl_block_uchar $.block;
  has int32           $.owner;
}

class gsl_matrix_complex is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[num64]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_matrix_complex_float is repr('CStruct') is export {
  has size_t          $.size1;
  has size_t          $.size2;
  has size_t          $.tda;
  has Pointer[num32]  $.data;
  has gsl_block       $.block;
  has int32           $.owner;
}

class gsl_matrix_view is repr('CStruct') is export {
  has gsl_matrix      $.matrix;
}

class gsl_matrix_float_view is repr('CStruct') is export {
  has gsl_matrix_float      $.matrix;
}

class gsl_matrix_int_view is repr('CStruct') is export {
  has gsl_matrix_int      $.matrix;
}

class gsl_matrix_uint_view is repr('CStruct') is export {
  has gsl_matrix_uint      $.matrix;
}

class gsl_matrix_long_view is repr('CStruct') is export {
  has gsl_matrix_long      $.matrix;
}

class gsl_matrix_ulong_view is repr('CStruct') is export {
  has gsl_matrix_ulong      $.matrix;
}

class gsl_matrix_short_view is repr('CStruct') is export {
  has gsl_matrix_short      $.matrix;
}

class gsl_matrix_ushort_view is repr('CStruct') is export {
  has gsl_matrix_ushort      $.matrix;
}

class gsl_matrix_char_view is repr('CStruct') is export {
  has gsl_matrix_char      $.matrix;
}

class gsl_matrix_uchar_view is repr('CStruct') is export {
  has gsl_matrix_uchar      $.matrix;
}

class gsl_matrix_complex_view is repr('CStruct') is export {
  has gsl_matrix_complex      $.matrix;
}

class gsl_matrix_complex_float_view is repr('CStruct') is export {
  has gsl_matrix_complex_float      $.matrix;
}

# Block allocation
sub gsl_block_alloc(size_t $n --> gsl_block) is native(LIB) is export(:block) { * }
sub gsl_block_calloc(size_t $n --> gsl_block) is native(LIB) is export(:block) { * }
sub gsl_block_free(gsl_block $b) is native(LIB) is export(:block) { * }
sub gsl_block_float_alloc(size_t $n --> gsl_block_float) is native(LIB) is export(:block) { * }
sub gsl_block_float_calloc(size_t $n --> gsl_block_float) is native(LIB) is export(:block) { * }
sub gsl_block_float_free(gsl_block_float $b) is native(LIB) is export(:block) { * }
sub gsl_block_int_alloc(size_t $n --> gsl_block_int) is native(LIB) is export(:block) { * }
sub gsl_block_int_calloc(size_t $n --> gsl_block_int) is native(LIB) is export(:block) { * }
sub gsl_block_int_free(gsl_block_int $b) is native(LIB) is export(:block) { * }
sub gsl_block_uint_alloc(size_t $n --> gsl_block_uint) is native(LIB) is export(:block) { * }
sub gsl_block_uint_calloc(size_t $n --> gsl_block_uint) is native(LIB) is export(:block) { * }
sub gsl_block_uint_free(gsl_block_uint $b) is native(LIB) is export(:block) { * }
sub gsl_block_long_alloc(size_t $n --> gsl_block_long) is native(LIB) is export(:block) { * }
sub gsl_block_long_calloc(size_t $n --> gsl_block_long) is native(LIB) is export(:block) { * }
sub gsl_block_long_free(gsl_block_long $b) is native(LIB) is export(:block) { * }
sub gsl_block_ulong_alloc(size_t $n --> gsl_block_ulong) is native(LIB) is export(:block) { * }
sub gsl_block_ulong_calloc(size_t $n --> gsl_block_ulong) is native(LIB) is export(:block) { * }
sub gsl_block_ulong_free(gsl_block_ulong $b) is native(LIB) is export(:block) { * }
sub gsl_block_short_alloc(size_t $n --> gsl_block_short) is native(LIB) is export(:block) { * }
sub gsl_block_short_calloc(size_t $n --> gsl_block_short) is native(LIB) is export(:block) { * }
sub gsl_block_short_free(gsl_block_short $b) is native(LIB) is export(:block) { * }
sub gsl_block_ushort_alloc(size_t $n --> gsl_block_ushort) is native(LIB) is export(:block) { * }
sub gsl_block_ushort_calloc(size_t $n --> gsl_block_ushort) is native(LIB) is export(:block) { * }
sub gsl_block_ushort_free(gsl_block_ushort $b) is native(LIB) is export(:block) { * }
sub gsl_block_char_alloc(size_t $n --> gsl_block_char) is native(LIB) is export(:block) { * }
sub gsl_block_char_calloc(size_t $n --> gsl_block_char) is native(LIB) is export(:block) { * }
sub gsl_block_char_free(gsl_block_char $b) is native(LIB) is export(:block) { * }
sub gsl_block_uchar_alloc(size_t $n --> gsl_block_uchar) is native(LIB) is export(:block) { * }
sub gsl_block_uchar_calloc(size_t $n --> gsl_block_uchar) is native(LIB) is export(:block) { * }
sub gsl_block_uchar_free(gsl_block_uchar $b) is native(LIB) is export(:block) { * }
sub gsl_block_complex_alloc(size_t $n --> gsl_block_complex) is native(LIB) is export(:block) { * }
sub gsl_block_complex_calloc(size_t $n --> gsl_block_complex) is native(LIB) is export(:block) { * }
sub gsl_block_complex_free(gsl_block_complex $b) is native(LIB) is export(:block) { * }
sub gsl_block_complex_float_alloc(size_t $n --> gsl_block_complex_float) is native(LIB) is export(:block) { * }
sub gsl_block_complex_float_calloc(size_t $n --> gsl_block_complex_float) is native(LIB) is export(:block) { * }
sub gsl_block_complex_float_free(gsl_block_complex_float $b) is native(LIB) is export(:block) { * }
# Reading and writing blocks
sub mgsl_block_fwrite(Str $filename, gsl_block $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_fread(Str $filename, gsl_block $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_fprintf(Str $filename, gsl_block $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_fscanf(Str $filename, gsl_block $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_float_fwrite(Str $filename, gsl_block_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_float_fread(Str $filename, gsl_block_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_float_fprintf(Str $filename, gsl_block_float $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_float_fscanf(Str $filename, gsl_block_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_int_fwrite(Str $filename, gsl_block_int $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_int_fread(Str $filename, gsl_block_int $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_int_fprintf(Str $filename, gsl_block_int $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_int_fscanf(Str $filename, gsl_block_int $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uint_fwrite(Str $filename, gsl_block_uint $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uint_fread(Str $filename, gsl_block_uint $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uint_fprintf(Str $filename, gsl_block_uint $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uint_fscanf(Str $filename, gsl_block_uint $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_long_fwrite(Str $filename, gsl_block_long $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_long_fread(Str $filename, gsl_block_long $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_long_fprintf(Str $filename, gsl_block_long $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_long_fscanf(Str $filename, gsl_block_long $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ulong_fwrite(Str $filename, gsl_block_ulong $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ulong_fread(Str $filename, gsl_block_ulong $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ulong_fprintf(Str $filename, gsl_block_ulong $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ulong_fscanf(Str $filename, gsl_block_ulong $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_short_fwrite(Str $filename, gsl_block_short $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_short_fread(Str $filename, gsl_block_short $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_short_fprintf(Str $filename, gsl_block_short $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_short_fscanf(Str $filename, gsl_block_short $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ushort_fwrite(Str $filename, gsl_block_ushort $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ushort_fread(Str $filename, gsl_block_ushort $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ushort_fprintf(Str $filename, gsl_block_ushort $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_ushort_fscanf(Str $filename, gsl_block_ushort $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_char_fwrite(Str $filename, gsl_block_char $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_char_fread(Str $filename, gsl_block_char $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_char_fprintf(Str $filename, gsl_block_char $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_char_fscanf(Str $filename, gsl_block_char $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uchar_fwrite(Str $filename, gsl_block_uchar $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uchar_fread(Str $filename, gsl_block_uchar $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uchar_fprintf(Str $filename, gsl_block_uchar $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_uchar_fscanf(Str $filename, gsl_block_uchar $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_fwrite(Str $filename, gsl_block_complex $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_fread(Str $filename, gsl_block_complex $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_fprintf(Str $filename, gsl_block_complex $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_fscanf(Str $filename, gsl_block_complex $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_float_fwrite(Str $filename, gsl_block_complex_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_float_fread(Str $filename, gsl_block_complex_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_float_fprintf(Str $filename, gsl_block_complex_float $b, Str $format --> int32) is native(GSLHELPER) is export(:blockio) { * }
sub mgsl_block_complex_float_fscanf(Str $filename, gsl_block_complex_float $b --> int32) is native(GSLHELPER) is export(:blockio) { * }
# Vector allocation
sub gsl_vector_alloc(size_t $n --> gsl_vector) is native(LIB) is export(:vector) { * }
sub gsl_vector_calloc(size_t $n --> gsl_vector) is native(LIB) is export(:vector) { * }
sub gsl_vector_free(gsl_vector $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_float_alloc(size_t $n --> gsl_vector_float) is native(LIB) is export(:vector) { * }
sub gsl_vector_float_calloc(size_t $n --> gsl_vector_float) is native(LIB) is export(:vector) { * }
sub gsl_vector_float_free(gsl_vector_float $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_int_alloc(size_t $n --> gsl_vector_int) is native(LIB) is export(:vector) { * }
sub gsl_vector_int_calloc(size_t $n --> gsl_vector_int) is native(LIB) is export(:vector) { * }
sub gsl_vector_int_free(gsl_vector_int $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_uint_alloc(size_t $n --> gsl_vector_uint) is native(LIB) is export(:vector) { * }
sub gsl_vector_uint_calloc(size_t $n --> gsl_vector_uint) is native(LIB) is export(:vector) { * }
sub gsl_vector_uint_free(gsl_vector_uint $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_long_alloc(size_t $n --> gsl_vector_long) is native(LIB) is export(:vector) { * }
sub gsl_vector_long_calloc(size_t $n --> gsl_vector_long) is native(LIB) is export(:vector) { * }
sub gsl_vector_long_free(gsl_vector_long $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_ulong_alloc(size_t $n --> gsl_vector_ulong) is native(LIB) is export(:vector) { * }
sub gsl_vector_ulong_calloc(size_t $n --> gsl_vector_ulong) is native(LIB) is export(:vector) { * }
sub gsl_vector_ulong_free(gsl_vector_ulong $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_short_alloc(size_t $n --> gsl_vector_short) is native(LIB) is export(:vector) { * }
sub gsl_vector_short_calloc(size_t $n --> gsl_vector_short) is native(LIB) is export(:vector) { * }
sub gsl_vector_short_free(gsl_vector_short $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_ushort_alloc(size_t $n --> gsl_vector_ushort) is native(LIB) is export(:vector) { * }
sub gsl_vector_ushort_calloc(size_t $n --> gsl_vector_ushort) is native(LIB) is export(:vector) { * }
sub gsl_vector_ushort_free(gsl_vector_ushort $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_char_alloc(size_t $n --> gsl_vector_char) is native(LIB) is export(:vector) { * }
sub gsl_vector_char_calloc(size_t $n --> gsl_vector_char) is native(LIB) is export(:vector) { * }
sub gsl_vector_char_free(gsl_vector_char $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_uchar_alloc(size_t $n --> gsl_vector_uchar) is native(LIB) is export(:vector) { * }
sub gsl_vector_uchar_calloc(size_t $n --> gsl_vector_uchar) is native(LIB) is export(:vector) { * }
sub gsl_vector_uchar_free(gsl_vector_uchar $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_alloc(size_t $n --> gsl_vector_complex) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_calloc(size_t $n --> gsl_vector_complex) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_free(gsl_vector_complex $v) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_float_alloc(size_t $n --> gsl_vector_complex_float) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_float_calloc(size_t $n --> gsl_vector_complex_float) is native(LIB) is export(:vector) { * }
sub gsl_vector_complex_float_free(gsl_vector_complex_float $v) is native(LIB) is export(:vector) { * }
# Accessing vector elements
sub gsl_vector_get(gsl_vector $v, size_t $i --> num64) is native(LIB) is export(:vector) { * }
sub gsl_vector_set(gsl_vector $v, size_t $i, num64 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_float_get(gsl_vector_float $v, size_t $i --> num32) is native(LIB) is export(:vector) { * }
sub gsl_vector_float_set(gsl_vector_float $v, size_t $i, num32 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_int_get(gsl_vector_int $v, size_t $i --> int32) is native(LIB) is export(:vector) { * }
sub gsl_vector_int_set(gsl_vector_int $v, size_t $i, int32 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_uint_get(gsl_vector_uint $v, size_t $i --> uint32) is native(LIB) is export(:vector) { * }
sub gsl_vector_uint_set(gsl_vector_uint $v, size_t $i, uint32 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_long_get(gsl_vector_long $v, size_t $i --> int64) is native(LIB) is export(:vector) { * }
sub gsl_vector_long_set(gsl_vector_long $v, size_t $i, int64 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_ulong_get(gsl_vector_ulong $v, size_t $i --> int64) is native(LIB) is export(:vector) { * }
sub gsl_vector_ulong_set(gsl_vector_ulong $v, size_t $i, int64 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_short_get(gsl_vector_short $v, size_t $i --> int16) is native(LIB) is export(:vector) { * }
sub gsl_vector_short_set(gsl_vector_short $v, size_t $i, int16 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_ushort_get(gsl_vector_ushort $v, size_t $i --> int16) is native(LIB) is export(:vector) { * }
sub gsl_vector_ushort_set(gsl_vector_ushort $v, size_t $i, int16 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_char_get(gsl_vector_char $v, size_t $i --> int8) is native(LIB) is export(:vector) { * }
sub gsl_vector_char_set(gsl_vector_char $v, size_t $i, int8 $x) is native(LIB) is export(:vector) { * }
sub gsl_vector_uchar_get(gsl_vector_uchar $v, size_t $i --> uint8) is native(LIB) is export(:vector) { * }
sub gsl_vector_uchar_set(gsl_vector_uchar $v, size_t $i, uint8 $x) is native(LIB) is export(:vector) { * }
sub mgsl_vector_complex_get(gsl_vector_complex $v, size_t $i, gsl_complex $res) is native(GSLHELPER) is export(:vector) { * }
sub mgsl_vector_complex_set(gsl_vector_complex $v, size_t $i, gsl_complex $x) is native(GSLHELPER) is export(:vector) { * }
sub mgsl_vector_complex_float_get(gsl_vector_complex_float $v, size_t $i, gsl_complex_float $res) is native(GSLHELPER) is export(:vector) { * }
sub mgsl_vector_complex_float_set(gsl_vector_complex_float $v, size_t $i, gsl_complex_float $x) is native(GSLHELPER) is export(:vector) { * }
# Initializing vector elements
sub gsl_vector_set_all(gsl_vector $v, num64 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_float_set_all(gsl_vector_float $v, num32 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_int_set_all(gsl_vector_int $v, int32 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uint_set_all(gsl_vector_uint $v, uint32 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_long_set_all(gsl_vector_long $v, int64 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ulong_set_all(gsl_vector_ulong $v, uint64 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_short_set_all(gsl_vector_short $v, int16 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ushort_set_all(gsl_vector_ushort $v, uint16 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_char_set_all(gsl_vector_char $v, int8 $x) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uchar_set_all(gsl_vector_uchar $v, uint8 $x) is native(LIB) is export(:vectorio) { * }
sub mgsl_vector_complex_set_all(gsl_vector_complex $v, gsl_complex $x) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_float_set_all(gsl_vector_complex_float $v, gsl_complex_float $x) is native(GSLHELPER) is export(:vectorio) { * }
sub gsl_vector_set_zero(gsl_vector $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_float_set_zero(gsl_vector_float $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_int_set_zero(gsl_vector_int $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uint_set_zero(gsl_vector_uint $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_long_set_zero(gsl_vector_long $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ulong_set_zero(gsl_vector_ulong $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_short_set_zero(gsl_vector_short $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ushort_set_zero(gsl_vector_ushort $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_char_set_zero(gsl_vector_char $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uchar_set_zero(gsl_vector_uchar $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_complex_set_zero(gsl_vector_complex $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_complex_float_set_zero(gsl_vector_complex_float $v) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_set_basis(gsl_vector $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_float_set_basis(gsl_vector_float $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_int_set_basis(gsl_vector_int $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uint_set_basis(gsl_vector_uint $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_long_set_basis(gsl_vector_long $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ulong_set_basis(gsl_vector_ulong $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_short_set_basis(gsl_vector_short $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_ushort_set_basis(gsl_vector_ushort $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_char_set_basis(gsl_vector_char $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_uchar_set_basis(gsl_vector_uchar $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_complex_set_basis(gsl_vector_complex $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
sub gsl_vector_complex_float_set_basis(gsl_vector_complex_float $v, size_t $i --> int32) is native(LIB) is export(:vectorio) { * }
# Reading and writing vectors
sub mgsl_vector_fwrite(Str $filename, gsl_vector $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_fread(Str $filename, gsl_vector $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_fprintf(Str $filename, gsl_vector $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_fscanf(Str $filename, gsl_vector $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_float_fwrite(Str $filename, gsl_vector_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_float_fread(Str $filename, gsl_vector_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_float_fprintf(Str $filename, gsl_vector_float $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_float_fscanf(Str $filename, gsl_vector_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_int_fwrite(Str $filename, gsl_vector_int $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_int_fread(Str $filename, gsl_vector_int $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_int_fprintf(Str $filename, gsl_vector_int $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_int_fscanf(Str $filename, gsl_vector_int $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uint_fwrite(Str $filename, gsl_vector_uint $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uint_fread(Str $filename, gsl_vector_uint $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uint_fprintf(Str $filename, gsl_vector_uint $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uint_fscanf(Str $filename, gsl_vector_uint $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_long_fwrite(Str $filename, gsl_vector_long $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_long_fread(Str $filename, gsl_vector_long $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_long_fprintf(Str $filename, gsl_vector_long $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_long_fscanf(Str $filename, gsl_vector_long $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ulong_fwrite(Str $filename, gsl_vector_ulong $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ulong_fread(Str $filename, gsl_vector_ulong $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ulong_fprintf(Str $filename, gsl_vector_ulong $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ulong_fscanf(Str $filename, gsl_vector_ulong $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_short_fwrite(Str $filename, gsl_vector_short $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_short_fread(Str $filename, gsl_vector_short $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_short_fprintf(Str $filename, gsl_vector_short $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_short_fscanf(Str $filename, gsl_vector_short $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ushort_fwrite(Str $filename, gsl_vector_ushort $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ushort_fread(Str $filename, gsl_vector_ushort $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ushort_fprintf(Str $filename, gsl_vector_ushort $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_ushort_fscanf(Str $filename, gsl_vector_ushort $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_char_fwrite(Str $filename, gsl_vector_char $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_char_fread(Str $filename, gsl_vector_char $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_char_fprintf(Str $filename, gsl_vector_char $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_char_fscanf(Str $filename, gsl_vector_char $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uchar_fwrite(Str $filename, gsl_vector_uchar $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uchar_fread(Str $filename, gsl_vector_uchar $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uchar_fprintf(Str $filename, gsl_vector_uchar $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_uchar_fscanf(Str $filename, gsl_vector_uchar $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_fwrite(Str $filename, gsl_vector_complex $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_fread(Str $filename, gsl_vector_complex $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_fprintf(Str $filename, gsl_vector_complex $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_fscanf(Str $filename, gsl_vector_complex $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_float_fwrite(Str $filename, gsl_vector_complex_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_float_fread(Str $filename, gsl_vector_complex_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_float_fprintf(Str $filename, gsl_vector_complex_float $v, Str $format --> int32) is native(GSLHELPER) is export(:vectorio) { * }
sub mgsl_vector_complex_float_fscanf(Str $filename, gsl_vector_complex_float $v --> int32) is native(GSLHELPER) is export(:vectorio) { * }
# Vector views
sub alloc_gsl_vector_view(--> gsl_vector_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_view(gsl_vector_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_subvector(gsl_vector_view $view, gsl_vector $v, size_t $offset, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_subvector_with_stride(gsl_vector_view $view, gsl_vector $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_real(gsl_vector_view $view, gsl_vector_complex $v --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_imag(gsl_vector_view $view, gsl_vector_complex $v --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_view_array(gsl_vector_view $view, CArray[num64] $base, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_view_array_with_stride(gsl_vector_view $view, CArray[num64] $base, size_t $stride, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_float_view(--> gsl_vector_float_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_float_view(gsl_vector_float_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_float_subvector(gsl_vector_float_view $view, gsl_vector_float $v, size_t $offset, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_float_subvector_with_stride(gsl_vector_float_view $view, gsl_vector_float $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_float_view_array(gsl_vector_float_view $view, CArray[num32] $base, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_float_view_array_with_stride(gsl_vector_float_view $view, CArray[num32] $base, size_t $stride, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_int_view(--> gsl_vector_int_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_int_view(gsl_vector_int_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_int_subvector(gsl_vector_int_view $view, gsl_vector_int $v, size_t $offset, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_int_subvector_with_stride(gsl_vector_int_view $view, gsl_vector_int $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_int_view_array(gsl_vector_int_view $view, CArray[int32] $base, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_int_view_array_with_stride(gsl_vector_int_view $view, CArray[int32] $base, size_t $stride, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_uint_view(--> gsl_vector_uint_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_uint_view(gsl_vector_uint_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uint_subvector(gsl_vector_uint_view $view, gsl_vector_uint $v, size_t $offset, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uint_subvector_with_stride(gsl_vector_uint_view $view, gsl_vector_uint $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uint_view_array(gsl_vector_uint_view $view, CArray[uint32] $base, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uint_view_array_with_stride(gsl_vector_uint_view $view, CArray[uint32] $base, size_t $stride, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_long_view(--> gsl_vector_long_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_long_view(gsl_vector_long_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_long_subvector(gsl_vector_long_view $view, gsl_vector_long $v, size_t $offset, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_long_subvector_with_stride(gsl_vector_long_view $view, gsl_vector_long $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_long_view_array(gsl_vector_long_view $view, CArray[int64] $base, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_long_view_array_with_stride(gsl_vector_long_view $view, CArray[int64] $base, size_t $stride, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_ulong_view(--> gsl_vector_ulong_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_ulong_view(gsl_vector_ulong_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ulong_subvector(gsl_vector_ulong_view $view, gsl_vector_ulong $v, size_t $offset, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ulong_subvector_with_stride(gsl_vector_ulong_view $view, gsl_vector_ulong $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ulong_view_array(gsl_vector_ulong_view $view, CArray[uint64] $base, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ulong_view_array_with_stride(gsl_vector_ulong_view $view, CArray[uint64] $base, size_t $stride, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_short_view(--> gsl_vector_short_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_short_view(gsl_vector_short_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_short_subvector(gsl_vector_short_view $view, gsl_vector_short $v, size_t $offset, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_short_subvector_with_stride(gsl_vector_short_view $view, gsl_vector_short $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_short_view_array(gsl_vector_short_view $view, CArray[int16] $base, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_short_view_array_with_stride(gsl_vector_short_view $view, CArray[int16] $base, size_t $stride, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_ushort_view(--> gsl_vector_ushort_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_ushort_view(gsl_vector_ushort_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ushort_subvector(gsl_vector_ushort_view $view, gsl_vector_ushort $v, size_t $offset, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ushort_subvector_with_stride(gsl_vector_ushort_view $view, gsl_vector_ushort $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ushort_view_array(gsl_vector_ushort_view $view, CArray[uint16] $base, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_ushort_view_array_with_stride(gsl_vector_ushort_view $view, CArray[uint16] $base, size_t $stride, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_char_view(--> gsl_vector_char_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_char_view(gsl_vector_char_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_char_subvector(gsl_vector_char_view $view, gsl_vector_char $v, size_t $offset, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_char_subvector_with_stride(gsl_vector_char_view $view, gsl_vector_char $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_char_view_array(gsl_vector_char_view $view, CArray[int8] $base, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_char_view_array_with_stride(gsl_vector_char_view $view, CArray[int8] $base, size_t $stride, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_uchar_view(--> gsl_vector_uchar_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_uchar_view(gsl_vector_uchar_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uchar_subvector(gsl_vector_uchar_view $view, gsl_vector_uchar $v, size_t $offset, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uchar_subvector_with_stride(gsl_vector_uchar_view $view, gsl_vector_uchar $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uchar_view_array(gsl_vector_uchar_view $view, CArray[uint8] $base, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_uchar_view_array_with_stride(gsl_vector_uchar_view $view, CArray[uint8] $base, size_t $stride, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_complex_view(--> gsl_vector_complex_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_complex_view(gsl_vector_complex_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_subvector(gsl_vector_complex_view $view, gsl_vector_complex $v, size_t $offset, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_subvector_with_stride(gsl_vector_complex_view $view, gsl_vector_complex $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_view_array(gsl_vector_complex_view $view, CArray[num64] $base, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_view_array_with_stride(gsl_vector_complex_view $view, CArray[num64] $base, size_t $stride, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:vectorview) { * }
sub alloc_gsl_vector_complex_float_view(--> gsl_vector_complex_float_view) is native(GSLHELPER) is export(:vectorview) { * }
sub free_gsl_vector_complex_float_view(gsl_vector_complex_float_view $vv) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_float_subvector(gsl_vector_complex_float_view $view, gsl_vector_complex_float $v, size_t $offset, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_float_subvector_with_stride(gsl_vector_complex_float_view $view, gsl_vector_complex_float $v, size_t $offset, size_t $stride, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_float_view_array(gsl_vector_complex_float_view $view, CArray[num32] $base, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:vectorview) { * }
sub mgsl_vector_complex_float_view_array_with_stride(gsl_vector_complex_float_view $view, CArray[num32] $base, size_t $stride, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:vectorview) { * }
# Copying vectors
sub gsl_vector_memcpy(gsl_vector $dest, gsl_vector $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_float_memcpy(gsl_vector_float $dest, gsl_vector_float $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_int_memcpy(gsl_vector_int $dest, gsl_vector_int $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_uint_memcpy(gsl_vector_uint $dest, gsl_vector_uint $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_long_memcpy(gsl_vector_long $dest, gsl_vector_long $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_ulong_memcpy(gsl_vector_ulong $dest, gsl_vector_ulong $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_short_memcpy(gsl_vector_short $dest, gsl_vector_short $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_ushort_memcpy(gsl_vector_ushort $dest, gsl_vector_ushort $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_char_memcpy(gsl_vector_char $dest, gsl_vector_char $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_uchar_memcpy(gsl_vector_uchar $dest, gsl_vector_uchar $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_complex_memcpy(gsl_vector_complex $dest, gsl_vector_complex $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_complex_float_memcpy(gsl_vector_complex_float $dest, gsl_vector_complex_float $src --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_swap(gsl_vector $v, gsl_vector $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_float_swap(gsl_vector_float $v, gsl_vector_float $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_int_swap(gsl_vector_int $v, gsl_vector_int $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_uint_swap(gsl_vector_uint $v, gsl_vector_uint $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_long_swap(gsl_vector_long $v, gsl_vector_long $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_ulong_swap(gsl_vector_ulong $v, gsl_vector_ulong $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_short_swap(gsl_vector_short $v, gsl_vector_short $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_ushort_swap(gsl_vector_ushort $v, gsl_vector_ushort $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_char_swap(gsl_vector_char $v, gsl_vector_char $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_uchar_swap(gsl_vector_uchar $v, gsl_vector_uchar $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_complex_swap(gsl_vector_complex $v, gsl_vector_complex $w --> int32) is native(LIB) is export(:vectorcopy) { * }
sub gsl_vector_complex_float_swap(gsl_vector_complex_float $v, gsl_vector_complex_float $w --> int32) is native(LIB) is export(:vectorcopy) { * }
# Exchanging elements
sub gsl_vector_swap_elements(gsl_vector $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_float_swap_elements(gsl_vector_float $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_int_swap_elements(gsl_vector_int $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_uint_swap_elements(gsl_vector_uint $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_long_swap_elements(gsl_vector_long $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_ulong_swap_elements(gsl_vector_ulong $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_short_swap_elements(gsl_vector_short $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_ushort_swap_elements(gsl_vector_ushort $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_char_swap_elements(gsl_vector_char $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_uchar_swap_elements(gsl_vector_uchar $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_complex_swap_elements(gsl_vector_complex $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_complex_float_swap_elements(gsl_vector_complex_float $v, size_t $i, size_t $j --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_reverse(gsl_vector $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_float_reverse(gsl_vector_float $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_int_reverse(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_uint_reverse(gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_long_reverse(gsl_vector_long $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_ulong_reverse(gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_short_reverse(gsl_vector_short $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_ushort_reverse(gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_char_reverse(gsl_vector_char $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_uchar_reverse(gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_complex_reverse(gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorelem) { * }
sub gsl_vector_complex_float_reverse(gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorelem) { * }
# Vector operations
sub gsl_vector_add(gsl_vector $a, gsl_vector $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_add(gsl_vector_float $a, gsl_vector_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_add(gsl_vector_int $a, gsl_vector_int $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_add(gsl_vector_uint $a, gsl_vector_uint $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_add(gsl_vector_long $a, gsl_vector_long $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_add(gsl_vector_ulong $a, gsl_vector_ulong $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_add(gsl_vector_short $a, gsl_vector_short $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_add(gsl_vector_ushort $a, gsl_vector_ushort $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_add(gsl_vector_char $a, gsl_vector_char $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_add(gsl_vector_uchar $a, gsl_vector_uchar $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_add(gsl_vector_complex $a, gsl_vector_complex $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_float_add(gsl_vector_complex_float $a, gsl_vector_complex_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_sub(gsl_vector $a, gsl_vector $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_sub(gsl_vector_float $a, gsl_vector_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_sub(gsl_vector_int $a, gsl_vector_int $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_sub(gsl_vector_uint $a, gsl_vector_uint $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_sub(gsl_vector_long $a, gsl_vector_long $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_sub(gsl_vector_ulong $a, gsl_vector_ulong $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_sub(gsl_vector_short $a, gsl_vector_short $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_sub(gsl_vector_ushort $a, gsl_vector_ushort $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_sub(gsl_vector_char $a, gsl_vector_char $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_sub(gsl_vector_uchar $a, gsl_vector_uchar $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_sub(gsl_vector_complex $a, gsl_vector_complex $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_float_sub(gsl_vector_complex_float $a, gsl_vector_complex_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_mul(gsl_vector $a, gsl_vector $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_mul(gsl_vector_float $a, gsl_vector_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_mul(gsl_vector_int $a, gsl_vector_int $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_mul(gsl_vector_uint $a, gsl_vector_uint $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_mul(gsl_vector_long $a, gsl_vector_long $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_mul(gsl_vector_ulong $a, gsl_vector_ulong $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_mul(gsl_vector_short $a, gsl_vector_short $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_mul(gsl_vector_ushort $a, gsl_vector_ushort $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_mul(gsl_vector_char $a, gsl_vector_char $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_mul(gsl_vector_uchar $a, gsl_vector_uchar $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_mul(gsl_vector_complex $a, gsl_vector_complex $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_float_mul(gsl_vector_complex_float $a, gsl_vector_complex_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_div(gsl_vector $a, gsl_vector $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_div(gsl_vector_float $a, gsl_vector_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_div(gsl_vector_int $a, gsl_vector_int $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_div(gsl_vector_uint $a, gsl_vector_uint $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_div(gsl_vector_long $a, gsl_vector_long $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_div(gsl_vector_ulong $a, gsl_vector_ulong $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_div(gsl_vector_short $a, gsl_vector_short $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_div(gsl_vector_ushort $a, gsl_vector_ushort $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_div(gsl_vector_char $a, gsl_vector_char $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_div(gsl_vector_uchar $a, gsl_vector_uchar $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_div(gsl_vector_complex $a, gsl_vector_complex $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_complex_float_div(gsl_vector_complex_float $a, gsl_vector_complex_float $b --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_scale(gsl_vector $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_scale(gsl_vector_float $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_scale(gsl_vector_int $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_scale(gsl_vector_uint $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_scale(gsl_vector_long $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_scale(gsl_vector_ulong $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_scale(gsl_vector_short $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_scale(gsl_vector_ushort $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_scale(gsl_vector_char $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_scale(gsl_vector_uchar $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub mgsl_vector_complex_scale(gsl_vector_complex $a, gsl_complex $x --> int32) is native(GSLHELPER) is export(:vectorop) { * }
sub mgsl_vector_complex_float_scale(gsl_vector_complex_float $a, gsl_complex_float $x --> int32) is native(GSLHELPER) is export(:vectorop) { * }
sub gsl_vector_add_constant(gsl_vector $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_float_add_constant(gsl_vector_float $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_int_add_constant(gsl_vector_int $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uint_add_constant(gsl_vector_uint $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_long_add_constant(gsl_vector_long $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ulong_add_constant(gsl_vector_ulong $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_short_add_constant(gsl_vector_short $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_ushort_add_constant(gsl_vector_ushort $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_char_add_constant(gsl_vector_char $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub gsl_vector_uchar_add_constant(gsl_vector_uchar $a, num64 $x --> int32) is native(LIB) is export(:vectorop) { * }
sub mgsl_vector_complex_add_constant(gsl_vector_complex $a, gsl_complex $x --> int32) is native(GSLHELPER) is export(:vectorop) { * }
sub mgsl_vector_complex_float_add_constant(gsl_vector_complex_float $a, gsl_complex_float $x --> int32) is native(GSLHELPER) is export(:vectorop) { * }
# Finding maximum and minimum elements of vectors
sub gsl_vector_max(gsl_vector $v --> num64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_max(gsl_vector_float $v --> num32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_max(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_max(gsl_vector_uint $v --> uint32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_max(gsl_vector_long $v --> int64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_max(gsl_vector_ulong $v --> uint64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_max(gsl_vector_short $v --> int16) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_max(gsl_vector_ushort $v --> uint16) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_max(gsl_vector_char $v --> int8) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_max(gsl_vector_uchar $v --> uint8) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_min(gsl_vector $v --> num64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_min(gsl_vector_float $v --> num32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_min(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_min(gsl_vector_uint $v --> uint32) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_min(gsl_vector_long $v --> int64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_min(gsl_vector_ulong $v --> uint64) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_min(gsl_vector_short $v --> int16) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_min(gsl_vector_ushort $v --> uint16) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_min(gsl_vector_char $v --> int8) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_min(gsl_vector_uchar $v --> uint8) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_minmax(gsl_vector $v, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_minmax(gsl_vector_float $v, num32 $min_out is rw, num32 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_minmax(gsl_vector_int $v, int32 $min_out is rw, int32 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_minmax(gsl_vector_uint $v, uint32 $min_out is rw, uint32 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_minmax(gsl_vector_long $v, int64 $min_out is rw, int64 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_minmax(gsl_vector_ulong $v, uint64 $min_out is rw, uint64 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_minmax(gsl_vector_short $v, int16 $min_out is rw, int16 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_minmax(gsl_vector_ushort $v, uint16 $min_out is rw, uint16 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_minmax(gsl_vector_char $v, int8 $min_out is rw, int8 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_minmax(gsl_vector_uchar $v, uint8 $min_out is rw, uint8 $max_out is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_max_index(gsl_vector $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_max_index(gsl_vector_float $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_max_index(gsl_vector_int $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_max_index(gsl_vector_uint $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_max_index(gsl_vector_long $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_max_index(gsl_vector_ulong $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_max_index(gsl_vector_short $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_max_index(gsl_vector_ushort $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_max_index(gsl_vector_char $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_max_index(gsl_vector_uchar $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_min_index(gsl_vector $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_min_index(gsl_vector_float $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_min_index(gsl_vector_int $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_min_index(gsl_vector_uint $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_min_index(gsl_vector_long $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_min_index(gsl_vector_ulong $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_min_index(gsl_vector_short $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_min_index(gsl_vector_ushort $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_min_index(gsl_vector_char $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_min_index(gsl_vector_uchar $v --> size_t) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_minmax_index(gsl_vector $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_float_minmax_index(gsl_vector_float $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_int_minmax_index(gsl_vector_int $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uint_minmax_index(gsl_vector_uint $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_long_minmax_index(gsl_vector_long $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ulong_minmax_index(gsl_vector_ulong $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_short_minmax_index(gsl_vector_short $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_ushort_minmax_index(gsl_vector_ushort $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_char_minmax_index(gsl_vector_char $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
sub gsl_vector_uchar_minmax_index(gsl_vector_uchar $v, size_t $imin is rw, size_t $imax is rw) is native(LIB) is export(:vectorminmax) { * }
# Vector properties
sub gsl_vector_isnull(gsl_vector $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_float_isnull(gsl_vector_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_int_isnull(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uint_isnull(gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_long_isnull(gsl_vector_long $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ulong_isnull(gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_short_isnull(gsl_vector_short $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ushort_isnull(gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_char_isnull(gsl_vector_char $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uchar_isnull(gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_isnull(gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_float_isnull(gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ispos(gsl_vector $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_float_ispos(gsl_vector_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_int_ispos(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uint_ispos(gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_long_ispos(gsl_vector_long $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ulong_ispos(gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_short_ispos(gsl_vector_short $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ushort_ispos(gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_char_ispos(gsl_vector_char $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uchar_ispos(gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_ispos(gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_float_ispos(gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_isneg(gsl_vector $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_float_isneg(gsl_vector_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_int_isneg(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uint_isneg(gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_long_isneg(gsl_vector_long $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ulong_isneg(gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_short_isneg(gsl_vector_short $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ushort_isneg(gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_char_isneg(gsl_vector_char $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uchar_isneg(gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_isneg(gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_float_isneg(gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_isnonneg(gsl_vector $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_float_isnonneg(gsl_vector_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_int_isnonneg(gsl_vector_int $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uint_isnonneg(gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_long_isnonneg(gsl_vector_long $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ulong_isnonneg(gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_short_isnonneg(gsl_vector_short $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ushort_isnonneg(gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_char_isnonneg(gsl_vector_char $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uchar_isnonneg(gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_isnonneg(gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_float_isnonneg(gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_equal(gsl_vector $u, gsl_vector $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_float_equal(gsl_vector_float $u, gsl_vector_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_int_equal(gsl_vector_int $u, gsl_vector_int $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uint_equal(gsl_vector_uint $u, gsl_vector_uint $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_long_equal(gsl_vector_long $u, gsl_vector_long $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ulong_equal(gsl_vector_ulong $u, gsl_vector_ulong $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_short_equal(gsl_vector_short $u, gsl_vector_short $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_ushort_equal(gsl_vector_ushort $u, gsl_vector_ushort $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_char_equal(gsl_vector_char $u, gsl_vector_char $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_uchar_equal(gsl_vector_uchar $u, gsl_vector_uchar $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_equal(gsl_vector_complex $u, gsl_vector_complex $v --> int32) is native(LIB) is export(:vectorprop) { * }
sub gsl_vector_complex_float_equal(gsl_vector_complex_float $u, gsl_vector_complex_float $v --> int32) is native(LIB) is export(:vectorprop) { * }
# Matrix allocation
sub gsl_matrix_alloc(size_t $n1, size_t $n2 --> gsl_matrix) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_calloc(size_t $n1, size_t $n2 --> gsl_matrix) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_free(gsl_matrix $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_float_alloc(size_t $n1, size_t $n2 --> gsl_matrix_float) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_int_alloc(size_t $n1, size_t $n2 --> gsl_matrix_int) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uint_alloc(size_t $n1, size_t $n2 --> gsl_matrix_uint) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_long_alloc(size_t $n1, size_t $n2 --> gsl_matrix_long) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ulong_alloc(size_t $n1, size_t $n2 --> gsl_matrix_ulong) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_short_alloc(size_t $n1, size_t $n2 --> gsl_matrix_short) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ushort_alloc(size_t $n1, size_t $n2 --> gsl_matrix_ushort) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_char_alloc(size_t $n1, size_t $n2 --> gsl_matrix_char) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uchar_alloc(size_t $n1, size_t $n2 --> gsl_matrix_uchar) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_alloc(size_t $n1, size_t $n2 --> gsl_matrix_complex) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_float_alloc(size_t $n1, size_t $n2 --> gsl_matrix_complex_float) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_float_calloc(size_t $n1, size_t $n2 --> gsl_matrix_float) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_int_calloc(size_t $n1, size_t $n2 --> gsl_matrix_int) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uint_calloc(size_t $n1, size_t $n2 --> gsl_matrix_uint) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_long_calloc(size_t $n1, size_t $n2 --> gsl_matrix_long) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ulong_calloc(size_t $n1, size_t $n2 --> gsl_matrix_ulong) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_short_calloc(size_t $n1, size_t $n2 --> gsl_matrix_short) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ushort_calloc(size_t $n1, size_t $n2 --> gsl_matrix_ushort) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_char_calloc(size_t $n1, size_t $n2 --> gsl_matrix_char) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uchar_calloc(size_t $n1, size_t $n2 --> gsl_matrix_uchar) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_calloc(size_t $n1, size_t $n2 --> gsl_matrix_complex) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_float_calloc(size_t $n1, size_t $n2 --> gsl_matrix_complex_float) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_float_free(gsl_matrix_float $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_int_free(gsl_matrix_int $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uint_free(gsl_matrix_uint $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_long_free(gsl_matrix_long $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ulong_free(gsl_matrix_ulong $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_short_free(gsl_matrix_short $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ushort_free(gsl_matrix_ushort $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_char_free(gsl_matrix_char $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uchar_free(gsl_matrix_uchar $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_free(gsl_matrix_complex $m) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_complex_float_free(gsl_matrix_complex_float $m) is native(LIB) is export(:matrix) { * }
# Accessing matrix elements
sub gsl_matrix_get(gsl_matrix $m, size_t $i, size_t $j --> num64) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_float_get(gsl_matrix_float $m, size_t $i, size_t $j --> num32) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_int_get(gsl_matrix_int $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uint_get(gsl_matrix_uint $m, size_t $i, size_t $j --> uint32) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_long_get(gsl_matrix_long $m, size_t $i, size_t $j --> int64) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ulong_get(gsl_matrix_ulong $m, size_t $i, size_t $j --> uint64) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_short_get(gsl_matrix_short $m, size_t $i, size_t $j --> int16) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ushort_get(gsl_matrix_ushort $m, size_t $i, size_t $j --> uint16) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_char_get(gsl_matrix_char $m, size_t $i, size_t $j --> int8) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uchar_get(gsl_matrix_uchar $m, size_t $i, size_t $j --> uint8) is native(LIB) is export(:matrix) { * }
sub mgsl_matrix_complex_get(gsl_matrix_complex $m, size_t $i, size_t $j, gsl_matrix_complex $res) is native(GSLHELPER) is export(:matrix) { * }
sub mgsl_matrix_complex_float_get(gsl_matrix_complex_float $m, size_t $i, size_t $j, gsl_matrix_complex_float $res) is native(GSLHELPER) is export(:matrix) { * }
sub gsl_matrix_set(gsl_matrix $m, size_t $i, size_t $j, num64 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_float_set(gsl_matrix_float $m, size_t $i, size_t $j, num32 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_int_set(gsl_matrix_int $m, size_t $i, size_t $j, int32 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uint_set(gsl_matrix_uint $m, size_t $i, size_t $j, uint32 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_long_set(gsl_matrix_long $m, size_t $i, size_t $j, int64 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ulong_set(gsl_matrix_ulong $m, size_t $i, size_t $j, uint64 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_short_set(gsl_matrix_short $m, size_t $i, size_t $j, int16 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_ushort_set(gsl_matrix_ushort $m, size_t $i, size_t $j, uint16 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_char_set(gsl_matrix_char $m, size_t $i, size_t $j, int8 $x) is native(LIB) is export(:matrix) { * }
sub gsl_matrix_uchar_set(gsl_matrix_uchar $m, size_t $i, size_t $j, uint8 $x) is native(LIB) is export(:matrix) { * }
sub mgsl_matrix_complex_set(gsl_matrix_complex $m, size_t $i, size_t $j, gsl_matrix_complex $x) is native(GSLHELPER) is export(:matrix) { * }
sub mgsl_matrix_complex_float_set(gsl_matrix_complex_float $m, size_t $i, size_t $j, gsl_matrix_complex_float $x) is native(GSLHELPER) is export(:matrix) { * }
# Initializing matrix elements
sub gsl_matrix_set_all(gsl_matrix $m, num64 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_float_set_all(gsl_matrix_float $m, num32 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_int_set_all(gsl_matrix_int $m, int32 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uint_set_all(gsl_matrix_uint $m, uint32 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_long_set_all(gsl_matrix_long $m, int64 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ulong_set_all(gsl_matrix_ulong $m, uint64 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_short_set_all(gsl_matrix_short $m, int16 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ushort_set_all(gsl_matrix_ushort $m, uint16 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_char_set_all(gsl_matrix_char $m, int8 $x) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uchar_set_all(gsl_matrix_uchar $m, uint8 $x) is native(LIB) is export(:matrixio) { * }
sub mgsl_matrix_complex_set_all(gsl_matrix_complex $m, gsl_matrix_complex $x) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_float_set_all(gsl_matrix_complex_float $m, gsl_matrix_complex_float $x) is native(GSLHELPER) is export(:matrixio) { * }
sub gsl_matrix_set_zero(gsl_matrix $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_float_set_zero(gsl_matrix_float $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_int_set_zero(gsl_matrix_int $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uint_set_zero(gsl_matrix_uint $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_long_set_zero(gsl_matrix_long $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ulong_set_zero(gsl_matrix_ulong $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_short_set_zero(gsl_matrix_short $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ushort_set_zero(gsl_matrix_ushort $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_char_set_zero(gsl_matrix_char $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uchar_set_zero(gsl_matrix_uchar $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_complex_set_zero(gsl_matrix_complex $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_complex_float_set_zero(gsl_matrix_complex_float $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_set_identity(gsl_matrix $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_float_set_identity(gsl_matrix_float $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_int_set_identity(gsl_matrix_int $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uint_set_identity(gsl_matrix_uint $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_long_set_identity(gsl_matrix_long $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ulong_set_identity(gsl_matrix_ulong $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_short_set_identity(gsl_matrix_short $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_ushort_set_identity(gsl_matrix_ushort $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_char_set_identity(gsl_matrix_char $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_uchar_set_identity(gsl_matrix_uchar $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_complex_set_identity(gsl_matrix_complex $m) is native(LIB) is export(:matrixio) { * }
sub gsl_matrix_complex_float_set_identity(gsl_matrix_complex_float $m) is native(LIB) is export(:matrixio) { * }
# Reading and writing matrices
sub mgsl_matrix_fwrite(Str $filename, gsl_matrix $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_fread(Str $filename, gsl_matrix $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_fprintf(Str $filename, gsl_matrix $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_fscanf(Str $filename, gsl_matrix $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_float_fwrite(Str $filename, gsl_matrix_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_float_fread(Str $filename, gsl_matrix_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_float_fprintf(Str $filename, gsl_matrix_float $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_float_fscanf(Str $filename, gsl_matrix_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_int_fwrite(Str $filename, gsl_matrix_int $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_int_fread(Str $filename, gsl_matrix_int $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_int_fprintf(Str $filename, gsl_matrix_int $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_int_fscanf(Str $filename, gsl_matrix_int $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uint_fwrite(Str $filename, gsl_matrix_uint $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uint_fread(Str $filename, gsl_matrix_uint $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uint_fprintf(Str $filename, gsl_matrix_uint $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uint_fscanf(Str $filename, gsl_matrix_uint $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_long_fwrite(Str $filename, gsl_matrix_long $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_long_fread(Str $filename, gsl_matrix_long $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_long_fprintf(Str $filename, gsl_matrix_long $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_long_fscanf(Str $filename, gsl_matrix_long $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ulong_fwrite(Str $filename, gsl_matrix_ulong $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ulong_fread(Str $filename, gsl_matrix_ulong $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ulong_fprintf(Str $filename, gsl_matrix_ulong $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ulong_fscanf(Str $filename, gsl_matrix_ulong $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_short_fwrite(Str $filename, gsl_matrix_short $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_short_fread(Str $filename, gsl_matrix_short $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_short_fprintf(Str $filename, gsl_matrix_short $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_short_fscanf(Str $filename, gsl_matrix_short $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ushort_fwrite(Str $filename, gsl_matrix_ushort $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ushort_fread(Str $filename, gsl_matrix_ushort $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ushort_fprintf(Str $filename, gsl_matrix_ushort $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_ushort_fscanf(Str $filename, gsl_matrix_ushort $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_char_fwrite(Str $filename, gsl_matrix_char $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_char_fread(Str $filename, gsl_matrix_char $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_char_fprintf(Str $filename, gsl_matrix_char $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_char_fscanf(Str $filename, gsl_matrix_char $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uchar_fwrite(Str $filename, gsl_matrix_uchar $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uchar_fread(Str $filename, gsl_matrix_uchar $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uchar_fprintf(Str $filename, gsl_matrix_uchar $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_uchar_fscanf(Str $filename, gsl_matrix_uchar $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_fwrite(Str $filename, gsl_matrix_complex $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_fread(Str $filename, gsl_matrix_complex $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_fprintf(Str $filename, gsl_matrix_complex $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_fscanf(Str $filename, gsl_matrix_complex $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_float_fwrite(Str $filename, gsl_matrix_complex_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_float_fread(Str $filename, gsl_matrix_complex_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_float_fprintf(Str $filename, gsl_matrix_complex_float $v, Str $format --> int32) is native(GSLHELPER) is export(:matrixio) { * }
sub mgsl_matrix_complex_float_fscanf(Str $filename, gsl_matrix_complex_float $v --> int32) is native(GSLHELPER) is export(:matrixio) { * }
# Matrix views
sub alloc_gsl_matrix_view(--> gsl_matrix_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_view(gsl_matrix_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_submatrix(gsl_matrix_view $view, gsl_matrix $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_view_array(gsl_matrix_view $view, CArray[num64] $base, size_t $n1, size_t $n2 --> gsl_matrix) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_view_array_with_tda(gsl_matrix_view $view, CArray[num64] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_view_vector(gsl_matrix_view $view, gsl_vector $v, size_t $n1, size_t $n2 --> gsl_matrix) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_view_vector_with_tda(gsl_matrix_view $view, gsl_vector $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_float_view(--> gsl_matrix_float_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_float_view(gsl_matrix_float_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_submatrix(gsl_matrix_float_view $view, gsl_matrix_float $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_view_array(gsl_matrix_float_view $view, CArray[num32] $base, size_t $n1, size_t $n2 --> gsl_matrix_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_view_array_with_tda(gsl_matrix_float_view $view, CArray[num32] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_view_vector(gsl_matrix_float_view $view, gsl_vector_float $v, size_t $n1, size_t $n2 --> gsl_matrix_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_view_vector_with_tda(gsl_matrix_float_view $view, gsl_vector_float $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_float) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_int_view(--> gsl_matrix_int_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_int_view(gsl_matrix_int_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_submatrix(gsl_matrix_int_view $view, gsl_matrix_int $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_view_array(gsl_matrix_int_view $view, CArray[int32] $base, size_t $n1, size_t $n2 --> gsl_matrix_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_view_array_with_tda(gsl_matrix_int_view $view, CArray[int32] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_view_vector(gsl_matrix_int_view $view, gsl_vector_int $v, size_t $n1, size_t $n2 --> gsl_matrix_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_view_vector_with_tda(gsl_matrix_int_view $view, gsl_vector_int $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_int) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_uint_view(--> gsl_matrix_uint_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_uint_view(gsl_matrix_uint_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_submatrix(gsl_matrix_uint_view $view, gsl_matrix_uint $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_view_array(gsl_matrix_uint_view $view, CArray[uint32] $base, size_t $n1, size_t $n2 --> gsl_matrix_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_view_array_with_tda(gsl_matrix_uint_view $view, CArray[num64] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_view_vector(gsl_matrix_uint_view $view, gsl_vector_uint $v, size_t $n1, size_t $n2 --> gsl_matrix_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_view_vector_with_tda(gsl_matrix_uint_view $view, gsl_vector_uint $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_long_view(--> gsl_matrix_long_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_long_view(gsl_matrix_long_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_submatrix(gsl_matrix_long_view $view, gsl_matrix_long $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_view_array(gsl_matrix_long_view $view, CArray[int64] $base, size_t $n1, size_t $n2 --> gsl_matrix_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_view_array_with_tda(gsl_matrix_long_view $view, CArray[int64] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_view_vector(gsl_matrix_long_view $view, gsl_vector_long $v, size_t $n1, size_t $n2 --> gsl_matrix_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_view_vector_with_tda(gsl_matrix_long_view $view, gsl_vector_long $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_long) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_ulong_view(--> gsl_matrix_ulong_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_ulong_view(gsl_matrix_ulong_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_submatrix(gsl_matrix_ulong_view $view, gsl_matrix_ulong $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_view_array(gsl_matrix_ulong_view $view, CArray[uint64] $base, size_t $n1, size_t $n2 --> gsl_matrix_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_view_array_with_tda(gsl_matrix_ulong_view $view, CArray[uint64] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_view_vector(gsl_matrix_ulong_view $view, gsl_vector_ulong $v, size_t $n1, size_t $n2 --> gsl_matrix_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_view_vector_with_tda(gsl_matrix_ulong_view $view, gsl_vector_ulong $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_short_view(--> gsl_matrix_short_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_short_view(gsl_matrix_short_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_submatrix(gsl_matrix_short_view $view, gsl_matrix_short $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_view_array(gsl_matrix_short_view $view, CArray[int16] $base, size_t $n1, size_t $n2 --> gsl_matrix_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_view_array_with_tda(gsl_matrix_short_view $view, CArray[int16] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_view_vector(gsl_matrix_short_view $view, gsl_vector_short $v, size_t $n1, size_t $n2 --> gsl_matrix_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_view_vector_with_tda(gsl_matrix_short_view $view, gsl_vector_short $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_short) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_ushort_view(--> gsl_matrix_ushort_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_ushort_view(gsl_matrix_ushort_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_submatrix(gsl_matrix_ushort_view $view, gsl_matrix_ushort $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_view_array(gsl_matrix_ushort_view $view, CArray[uint16] $base, size_t $n1, size_t $n2 --> gsl_matrix_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_view_array_with_tda(gsl_matrix_ushort_view $view, CArray[uint16] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_view_vector(gsl_matrix_ushort_view $view, gsl_vector_ushort $v, size_t $n1, size_t $n2 --> gsl_matrix_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_view_vector_with_tda(gsl_matrix_ushort_view $view, gsl_vector_ushort $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_char_view(--> gsl_matrix_char_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_char_view(gsl_matrix_char_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_submatrix(gsl_matrix_char_view $view, gsl_matrix_char $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_view_array(gsl_matrix_char_view $view, CArray[int8] $base, size_t $n1, size_t $n2 --> gsl_matrix_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_view_array_with_tda(gsl_matrix_char_view $view, CArray[int8] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_view_vector(gsl_matrix_char_view $view, gsl_vector_char $v, size_t $n1, size_t $n2 --> gsl_matrix_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_view_vector_with_tda(gsl_matrix_char_view $view, gsl_vector_char $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_char) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_uchar_view(--> gsl_matrix_uchar_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_uchar_view(gsl_matrix_uchar_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_submatrix(gsl_matrix_uchar_view $view, gsl_matrix_uchar $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_view_array(gsl_matrix_uchar_view $view, CArray[uint8] $base, size_t $n1, size_t $n2 --> gsl_matrix_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_view_array_with_tda(gsl_matrix_uchar_view $view, CArray[uint8] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_view_vector(gsl_matrix_uchar_view $view, gsl_vector_uchar $v, size_t $n1, size_t $n2 --> gsl_matrix_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_view_vector_with_tda(gsl_matrix_uchar_view $view, gsl_vector_uchar $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_complex_view(--> gsl_matrix_complex_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_complex_view(gsl_matrix_complex_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_submatrix(gsl_matrix_complex_view $view, gsl_matrix_complex $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_view_array(gsl_matrix_complex_view $view, CArray[num64] $base, size_t $n1, size_t $n2 --> gsl_matrix_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_view_array_with_tda(gsl_matrix_complex_view $view, CArray[num64] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_view_vector(gsl_matrix_complex_view $view, gsl_vector_complex $v, size_t $n1, size_t $n2 --> gsl_matrix_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_view_vector_with_tda(gsl_matrix_complex_view $view, gsl_vector_complex $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub alloc_gsl_matrix_complex_float_view(--> gsl_matrix_complex_float_view) is native(GSLHELPER) is export(:matrixview) { * }
sub free_gsl_matrix_complex_float_view(gsl_matrix_complex_float_view $mv) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_submatrix(gsl_matrix_complex_float_view $view, gsl_matrix_complex_float $m, size_t $k1, size_t $k2, size_t $n1, size_t $n2 --> gsl_matrix_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_view_array(gsl_matrix_complex_float_view $view, CArray[num32] $base, size_t $n1, size_t $n2 --> gsl_matrix_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_view_array_with_tda(gsl_matrix_complex_float_view $view, CArray[num32] $base, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_view_vector(gsl_matrix_complex_float_view $view, gsl_vector_complex_float $v, size_t $n1, size_t $n2 --> gsl_matrix_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_view_vector_with_tda(gsl_matrix_complex_float_view $view, gsl_vector_complex_float $v, size_t $n1, size_t $n2, size_t $tda --> gsl_matrix_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
# Creating row and column views
sub mgsl_matrix_row(gsl_vector_view $view, gsl_matrix $m, size_t $i --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_row(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $i --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_row(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $i --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_row(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $i --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_row(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $i --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_row(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $i --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_row(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $i --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_row(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $i --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_row(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $i --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_row(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $i --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_row(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $i --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_row(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $i --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_column(gsl_vector_view $view, gsl_matrix $m, size_t $j --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_column(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $j --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_column(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $j --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_column(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $j --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_column(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $j --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_column(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $j --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_column(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $j --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_column(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $j --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_column(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $j --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_column(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $j --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_column(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $j --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_column(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $j --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_subrow(gsl_vector_view $view, gsl_matrix $m, size_t $i, size_t $offset, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_subrow(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_subrow(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_subrow(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_subrow(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_subrow(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_subrow(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_subrow(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_subrow(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_subrow(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_subrow(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_subrow(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $i, size_t $offset, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_subcolumn(gsl_vector_view $view, gsl_matrix $m, size_t $j, size_t $offset, size_t $n --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_subcolumn(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_subcolumn(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_subcolumn(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_subcolumn(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_subcolumn(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_subcolumn(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_subcolumn(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_subcolumn(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_subcolumn(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_subcolumn(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_subcolumn(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $j, size_t $offset, size_t $n --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_diagonal(gsl_vector_view $view, gsl_matrix $m --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_diagonal(gsl_vector_float_view $view, gsl_matrix_float $m --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_diagonal(gsl_vector_int_view $view, gsl_matrix_int $m --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_diagonal(gsl_vector_uint_view $view, gsl_matrix_uint $m --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_diagonal(gsl_vector_long_view $view, gsl_matrix_long $m --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_diagonal(gsl_vector_ulong_view $view, gsl_matrix_ulong $m --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_diagonal(gsl_vector_short_view $view, gsl_matrix_short $m --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_diagonal(gsl_vector_ushort_view $view, gsl_matrix_ushort $m --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_diagonal(gsl_vector_char_view $view, gsl_matrix_char $m --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_diagonal(gsl_vector_uchar_view $view, gsl_matrix_uchar $m --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_diagonal(gsl_vector_complex_view $view, gsl_matrix_complex $m --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_diagonal(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_subdiagonal(gsl_vector_view $view, gsl_matrix $m, size_t $k --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_subdiagonal(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $k --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_subdiagonal(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $k --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_subdiagonal(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $k --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_subdiagonal(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $k --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_subdiagonal(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $k --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_subdiagonal(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $k --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_subdiagonal(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $k --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_subdiagonal(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $k --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_subdiagonal(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $k --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_subdiagonal(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $k --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_subdiagonal(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $k --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_superdiagonal(gsl_vector_view $view, gsl_matrix $m, size_t $k --> gsl_vector) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_float_superdiagonal(gsl_vector_float_view $view, gsl_matrix_float $m, size_t $k --> gsl_vector_float) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_int_superdiagonal(gsl_vector_int_view $view, gsl_matrix_int $m, size_t $k --> gsl_vector_int) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uint_superdiagonal(gsl_vector_uint_view $view, gsl_matrix_uint $m, size_t $k --> gsl_vector_uint) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_long_superdiagonal(gsl_vector_long_view $view, gsl_matrix_long $m, size_t $k --> gsl_vector_long) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ulong_superdiagonal(gsl_vector_ulong_view $view, gsl_matrix_ulong $m, size_t $k --> gsl_vector_ulong) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_short_superdiagonal(gsl_vector_short_view $view, gsl_matrix_short $m, size_t $k --> gsl_vector_short) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_ushort_superdiagonal(gsl_vector_ushort_view $view, gsl_matrix_ushort $m, size_t $k --> gsl_vector_ushort) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_char_superdiagonal(gsl_vector_char_view $view, gsl_matrix_char $m, size_t $k --> gsl_vector_char) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_uchar_superdiagonal(gsl_vector_uchar_view $view, gsl_matrix_uchar $m, size_t $k --> gsl_vector_uchar) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_superdiagonal(gsl_vector_complex_view $view, gsl_matrix_complex $m, size_t $k --> gsl_vector_complex) is native(GSLHELPER) is export(:matrixview) { * }
sub mgsl_matrix_complex_float_superdiagonal(gsl_vector_complex_float_view $view, gsl_matrix_complex_float $m, size_t $k --> gsl_vector_complex_float) is native(GSLHELPER) is export(:matrixview) { * }
# Copying matrices
sub gsl_matrix_memcpy(gsl_matrix $dest, gsl_matrix $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_memcpy(gsl_matrix_float $dest, gsl_matrix_float $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_memcpy(gsl_matrix_int $dest, gsl_matrix_int $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_memcpy(gsl_matrix_uint $dest, gsl_matrix_uint $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_memcpy(gsl_matrix_long $dest, gsl_matrix_long $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_memcpy(gsl_matrix_ulong $dest, gsl_matrix_ulong $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_memcpy(gsl_matrix_short $dest, gsl_matrix_short $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_memcpy(gsl_matrix_ushort $dest, gsl_matrix_ushort $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_memcpy(gsl_matrix_char $dest, gsl_matrix_char $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_memcpy(gsl_matrix_uchar $dest, gsl_matrix_uchar $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_memcpy(gsl_matrix_complex $dest, gsl_matrix_complex $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_memcpy(gsl_matrix_complex_float $dest, gsl_matrix_complex_float $src --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_swap(gsl_matrix $m1, gsl_matrix $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_swap(gsl_matrix_float $m1, gsl_matrix_float $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_swap(gsl_matrix_int $m1, gsl_matrix_int $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_swap(gsl_matrix_uint $m1, gsl_matrix_uint $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_swap(gsl_matrix_long $m1, gsl_matrix_long $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_swap(gsl_matrix_ulong $m1, gsl_matrix_ulong $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_swap(gsl_matrix_short $m1, gsl_matrix_short $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_swap(gsl_matrix_ushort $m1, gsl_matrix_ushort $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_swap(gsl_matrix_char $m1, gsl_matrix_char $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_swap(gsl_matrix_uchar $m1, gsl_matrix_uchar $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_swap(gsl_matrix_complex $m1, gsl_matrix_complex $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_swap(gsl_matrix_complex_float $m1, gsl_matrix_complex_float $m2 --> int32) is native(LIB) is export(:matrixcopy) { * }
# Copying rows and columns
sub gsl_matrix_get_row(gsl_vector $v, gsl_matrix $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_get_row(gsl_vector_float $v, gsl_matrix_float $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_get_row(gsl_vector_int $v, gsl_matrix_int $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_get_row(gsl_vector_uint $v, gsl_matrix_uint $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_get_row(gsl_vector_long $v, gsl_matrix_long $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_get_row(gsl_vector_ulong $v, gsl_matrix_ulong $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_get_row(gsl_vector_short $v, gsl_matrix_short $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_get_row(gsl_vector_ushort $v, gsl_matrix_ushort $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_get_row(gsl_vector_char $v, gsl_matrix_char $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_get_row(gsl_vector_uchar $v, gsl_matrix_uchar $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_get_row(gsl_vector_complex $v, gsl_matrix_complex $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_get_row(gsl_vector_complex_float $v, gsl_matrix_complex_float $m, size_t $i --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_get_col(gsl_vector $v, gsl_matrix $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_get_col(gsl_vector_float $v, gsl_matrix_float $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_get_col(gsl_vector_int $v, gsl_matrix_int $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_get_col(gsl_vector_uint $v, gsl_matrix_uint $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_get_col(gsl_vector_long $v, gsl_matrix_long $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_get_col(gsl_vector_ulong $v, gsl_matrix_ulong $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_get_col(gsl_vector_short $v, gsl_matrix_short $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_get_col(gsl_vector_ushort $v, gsl_matrix_ushort $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_get_col(gsl_vector_char $v, gsl_matrix_char $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_get_col(gsl_vector_uchar $v, gsl_matrix_uchar $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_get_col(gsl_vector_complex $v, gsl_matrix_complex $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_get_col(gsl_vector_complex_float $v, gsl_matrix_complex_float $m, size_t $j --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_set_row(gsl_matrix $m, size_t $i, gsl_vector $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_set_row(gsl_matrix_float $m, size_t $i, gsl_vector_float $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_set_row(gsl_matrix_int $m, size_t $i, gsl_vector_int $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_set_row(gsl_matrix_uint $m, size_t $i, gsl_vector_uint $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_set_row(gsl_matrix_long $m, size_t $i, gsl_vector_long $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_set_row(gsl_matrix_ulong $m, size_t $i, gsl_vector_ulong $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_set_row(gsl_matrix_short $m, size_t $i, gsl_vector_short $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_set_row(gsl_matrix_ushort $m, size_t $i, gsl_vector_ushort $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_set_row(gsl_matrix_char $m, size_t $i, gsl_vector_char $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_set_row(gsl_matrix_uchar $m, size_t $i, gsl_vector_uchar $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_set_row(gsl_matrix_complex $m, size_t $i, gsl_vector_complex $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_set_row(gsl_matrix_complex_float $m, size_t $i, gsl_vector_complex_float $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_set_col(gsl_matrix $m, size_t $j, gsl_vector $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_float_set_col(gsl_matrix_float $m, size_t $j, gsl_vector_float $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_int_set_col(gsl_matrix_int $m, size_t $j, gsl_vector_int $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uint_set_col(gsl_matrix_uint $m, size_t $j, gsl_vector_uint $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_long_set_col(gsl_matrix_long $m, size_t $j, gsl_vector_long $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ulong_set_col(gsl_matrix_ulong $m, size_t $j, gsl_vector_ulong $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_short_set_col(gsl_matrix_short $m, size_t $j, gsl_vector_short $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_ushort_set_col(gsl_matrix_ushort $m, size_t $j, gsl_vector_ushort $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_char_set_col(gsl_matrix_char $m, size_t $j, gsl_vector_char $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_uchar_set_col(gsl_matrix_uchar $m, size_t $j, gsl_vector_uchar $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_set_col(gsl_matrix_complex $m, size_t $j, gsl_vector_complex $v --> int32) is native(LIB) is export(:matrixcopy) { * }
sub gsl_matrix_complex_float_set_col(gsl_matrix_complex_float $m, size_t $j, gsl_vector_complex_float $v --> int32) is native(LIB) is export(:matrixcopy) { * }
# Exchanging rows and columns
sub gsl_matrix_swap_rows(gsl_matrix $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_float_swap_rows(gsl_matrix_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_int_swap_rows(gsl_matrix_int $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uint_swap_rows(gsl_matrix_uint $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_long_swap_rows(gsl_matrix_long $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ulong_swap_rows(gsl_matrix_ulong $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_short_swap_rows(gsl_matrix_short $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ushort_swap_rows(gsl_matrix_ushort $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_char_swap_rows(gsl_matrix_char $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uchar_swap_rows(gsl_matrix_uchar $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_swap_rows(gsl_matrix_complex $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_float_swap_rows(gsl_matrix_complex_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_swap_columns(gsl_matrix $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_float_swap_columns(gsl_matrix_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_int_swap_columns(gsl_matrix_int $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uint_swap_columns(gsl_matrix_uint $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_long_swap_columns(gsl_matrix_long $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ulong_swap_columns(gsl_matrix_ulong $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_short_swap_columns(gsl_matrix_short $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ushort_swap_columns(gsl_matrix_ushort $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_char_swap_columns(gsl_matrix_char $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uchar_swap_columns(gsl_matrix_uchar $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_swap_columns(gsl_matrix_complex $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_float_swap_columns(gsl_matrix_complex_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_swap_rowcol(gsl_matrix $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_float_swap_rowcol(gsl_matrix_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_int_swap_rowcol(gsl_matrix_int $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uint_swap_rowcol(gsl_matrix_uint $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_long_swap_rowcol(gsl_matrix_long $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ulong_swap_rowcol(gsl_matrix_ulong $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_short_swap_rowcol(gsl_matrix_short $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ushort_swap_rowcol(gsl_matrix_ushort $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_char_swap_rowcol(gsl_matrix_char $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uchar_swap_rowcol(gsl_matrix_uchar $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_swap_rowcol(gsl_matrix_complex $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_float_swap_rowcol(gsl_matrix_complex_float $m, size_t $i, size_t $j --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_transpose_memcpy(gsl_matrix $dest, gsl_matrix $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_float_transpose_memcpy(gsl_matrix_float $dest, gsl_matrix_float $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_int_transpose_memcpy(gsl_matrix_int $dest, gsl_matrix_int $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uint_transpose_memcpy(gsl_matrix_uint $dest, gsl_matrix_uint $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_long_transpose_memcpy(gsl_matrix_long $dest, gsl_matrix_long $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ulong_transpose_memcpy(gsl_matrix_ulong $dest, gsl_matrix_ulong $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_short_transpose_memcpy(gsl_matrix_short $dest, gsl_matrix_short $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ushort_transpose_memcpy(gsl_matrix_ushort $dest, gsl_matrix_ushort $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_char_transpose_memcpy(gsl_matrix_char $dest, gsl_matrix_char $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uchar_transpose_memcpy(gsl_matrix_uchar $dest, gsl_matrix_uchar $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_transpose_memcpy(gsl_matrix_complex $dest, gsl_matrix_complex $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_float_transpose_memcpy(gsl_matrix_complex_float $dest, gsl_matrix_complex_float $src --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_transpose(gsl_matrix $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_float_transpose(gsl_matrix_float $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_int_transpose(gsl_matrix_int $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uint_transpose(gsl_matrix_uint $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_long_transpose(gsl_matrix_long $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ulong_transpose(gsl_matrix_ulong $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_short_transpose(gsl_matrix_short $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_ushort_transpose(gsl_matrix_ushort $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_char_transpose(gsl_matrix_char $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_uchar_transpose(gsl_matrix_uchar $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_transpose(gsl_matrix_complex $m --> int32) is native(LIB) is export(:matrixexch) { * }
sub gsl_matrix_complex_float_transpose(gsl_matrix_complex_float $m --> int32) is native(LIB) is export(:matrixexch) { * }
# Matrix operations
sub gsl_matrix_add(gsl_matrix $a, gsl_matrix $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_add(gsl_matrix_float $a, gsl_matrix_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_add(gsl_matrix_int $a, gsl_matrix_int $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_add(gsl_matrix_uint $a, gsl_matrix_uint $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_add(gsl_matrix_long $a, gsl_matrix_long $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_add(gsl_matrix_ulong $a, gsl_matrix_ulong $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_add(gsl_matrix_short $a, gsl_matrix_short $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_add(gsl_matrix_ushort $a, gsl_matrix_ushort $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_add(gsl_matrix_char $a, gsl_matrix_char $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_add(gsl_matrix_uchar $a, gsl_matrix_uchar $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_add(gsl_matrix_complex $a, gsl_matrix_complex $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_add(gsl_matrix_complex_float $a, gsl_matrix_complex_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_sub(gsl_matrix $a, gsl_matrix $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_sub(gsl_matrix_float $a, gsl_matrix_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_sub(gsl_matrix_int $a, gsl_matrix_int $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_sub(gsl_matrix_uint $a, gsl_matrix_uint $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_sub(gsl_matrix_long $a, gsl_matrix_long $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_sub(gsl_matrix_ulong $a, gsl_matrix_ulong $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_sub(gsl_matrix_short $a, gsl_matrix_short $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_sub(gsl_matrix_ushort $a, gsl_matrix_ushort $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_sub(gsl_matrix_char $a, gsl_matrix_char $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_sub(gsl_matrix_uchar $a, gsl_matrix_uchar $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_sub(gsl_matrix_complex $a, gsl_matrix_complex $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_sub(gsl_matrix_complex_float $a, gsl_matrix_complex_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_mul_elements(gsl_matrix $a, gsl_matrix $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_mul_elements(gsl_matrix_float $a, gsl_matrix_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_mul_elements(gsl_matrix_int $a, gsl_matrix_int $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_mul_elements(gsl_matrix_uint $a, gsl_matrix_uint $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_mul_elements(gsl_matrix_long $a, gsl_matrix_long $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_mul_elements(gsl_matrix_ulong $a, gsl_matrix_ulong $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_mul_elements(gsl_matrix_short $a, gsl_matrix_short $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_mul_elements(gsl_matrix_ushort $a, gsl_matrix_ushort $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_mul_elements(gsl_matrix_char $a, gsl_matrix_char $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_mul_elements(gsl_matrix_uchar $a, gsl_matrix_uchar $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_mul_elements(gsl_matrix_complex $a, gsl_matrix_complex $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_mul_elements(gsl_matrix_complex_float $a, gsl_matrix_complex_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_div_elements(gsl_matrix $a, gsl_matrix $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_div_elements(gsl_matrix_float $a, gsl_matrix_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_div_elements(gsl_matrix_int $a, gsl_matrix_int $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_div_elements(gsl_matrix_uint $a, gsl_matrix_uint $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_div_elements(gsl_matrix_long $a, gsl_matrix_long $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_div_elements(gsl_matrix_ulong $a, gsl_matrix_ulong $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_div_elements(gsl_matrix_short $a, gsl_matrix_short $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_div_elements(gsl_matrix_ushort $a, gsl_matrix_ushort $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_div_elements(gsl_matrix_char $a, gsl_matrix_char $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_div_elements(gsl_matrix_uchar $a, gsl_matrix_uchar $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_div_elements(gsl_matrix_complex $a, gsl_matrix_complex $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_div_elements(gsl_matrix_complex_float $a, gsl_matrix_complex_float $b --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_scale(gsl_matrix $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_scale(gsl_matrix_float $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_scale(gsl_matrix_int $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_scale(gsl_matrix_uint $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_scale(gsl_matrix_long $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_scale(gsl_matrix_ulong $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_scale(gsl_matrix_short $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_scale(gsl_matrix_ushort $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_scale(gsl_matrix_char $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_scale(gsl_matrix_uchar $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_scale(gsl_matrix_complex $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_scale(gsl_matrix_complex_float $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_add_constant(gsl_matrix $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_float_add_constant(gsl_matrix_float $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_int_add_constant(gsl_matrix_int $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uint_add_constant(gsl_matrix_uint $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_long_add_constant(gsl_matrix_long $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ulong_add_constant(gsl_matrix_ulong $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_short_add_constant(gsl_matrix_short $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_ushort_add_constant(gsl_matrix_ushort $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_char_add_constant(gsl_matrix_char $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_uchar_add_constant(gsl_matrix_uchar $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_add_constant(gsl_matrix_complex $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
sub gsl_matrix_complex_float_add_constant(gsl_matrix_complex_float $a, num64 $x --> int32) is native(LIB) is export(:matrixop) { * }
# Finding maximum and minimum elements of matrices
sub gsl_matrix_max(gsl_matrix $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_max(gsl_matrix_float $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_max(gsl_matrix_int $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_max(gsl_matrix_uint $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_max(gsl_matrix_long $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_max(gsl_matrix_ulong $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_max(gsl_matrix_short $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_max(gsl_matrix_ushort $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_max(gsl_matrix_char $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_max(gsl_matrix_uchar $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_max(gsl_matrix_complex $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_max(gsl_matrix_complex_float $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_min(gsl_matrix $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_min(gsl_matrix_float $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_min(gsl_matrix_int $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_min(gsl_matrix_uint $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_min(gsl_matrix_long $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_min(gsl_matrix_ulong $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_min(gsl_matrix_short $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_min(gsl_matrix_ushort $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_min(gsl_matrix_char $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_min(gsl_matrix_uchar $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_min(gsl_matrix_complex $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_min(gsl_matrix_complex_float $m --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_minmax(gsl_matrix $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_minmax(gsl_matrix_float $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_minmax(gsl_matrix_int $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_minmax(gsl_matrix_uint $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_minmax(gsl_matrix_long $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_minmax(gsl_matrix_ulong $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_minmax(gsl_matrix_short $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_minmax(gsl_matrix_ushort $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_minmax(gsl_matrix_char $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_minmax(gsl_matrix_uchar $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_minmax(gsl_matrix_complex $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_minmax(gsl_matrix_complex_float $m, num64 $min_out is rw, num64 $max_out is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_max_index(gsl_matrix $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_max_index(gsl_matrix_float $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_max_index(gsl_matrix_int $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_max_index(gsl_matrix_uint $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_max_index(gsl_matrix_long $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_max_index(gsl_matrix_ulong $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_max_index(gsl_matrix_short $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_max_index(gsl_matrix_ushort $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_max_index(gsl_matrix_char $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_max_index(gsl_matrix_uchar $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_max_index(gsl_matrix_complex $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_max_index(gsl_matrix_complex_float $m, size_t $imax is rw, size_t $jmax is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_min_index(gsl_matrix $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_min_index(gsl_matrix_float $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_min_index(gsl_matrix_int $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_min_index(gsl_matrix_uint $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_min_index(gsl_matrix_long $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_min_index(gsl_matrix_ulong $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_min_index(gsl_matrix_short $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_min_index(gsl_matrix_ushort $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_min_index(gsl_matrix_char $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_min_index(gsl_matrix_uchar $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_min_index(gsl_matrix_complex $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_min_index(gsl_matrix_complex_float $m, size_t $imin is rw, size_t $jmin is rw --> num64) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_minmax_index(gsl_matrix $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_float_minmax_index(gsl_matrix_float $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_int_minmax_index(gsl_matrix_int $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uint_minmax_index(gsl_matrix_uint $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_long_minmax_index(gsl_matrix_long $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ulong_minmax_index(gsl_matrix_ulong $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_short_minmax_index(gsl_matrix_short $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_ushort_minmax_index(gsl_matrix_ushort $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_char_minmax_index(gsl_matrix_char $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_uchar_minmax_index(gsl_matrix_uchar $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_minmax_index(gsl_matrix_complex $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
sub gsl_matrix_complex_float_minmax_index(gsl_matrix_complex_float $m, size_t $imin is rw, size_t $jmin is rw, size_t $imax is rw, size_t $jmax is rw) is native(LIB) is export(:matrixminmax) { * }
# Matrix properties
sub gsl_matrix_isnull(gsl_matrix $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_float_isnull(gsl_matrix_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_int_isnull(gsl_matrix_int $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uint_isnull(gsl_matrix_uint $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_long_isnull(gsl_matrix_long $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ulong_isnull(gsl_matrix_ulong $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_short_isnull(gsl_matrix_short $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ushort_isnull(gsl_matrix_ushort $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_char_isnull(gsl_matrix_char $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uchar_isnull(gsl_matrix_uchar $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_isnull(gsl_matrix_complex $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_float_isnull(gsl_matrix_complex_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ispos(gsl_matrix $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_float_ispos(gsl_matrix_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_int_ispos(gsl_matrix_int $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uint_ispos(gsl_matrix_uint $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_long_ispos(gsl_matrix_long $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ulong_ispos(gsl_matrix_ulong $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_short_ispos(gsl_matrix_short $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ushort_ispos(gsl_matrix_ushort $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_char_ispos(gsl_matrix_char $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uchar_ispos(gsl_matrix_uchar $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_ispos(gsl_matrix_complex $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_float_ispos(gsl_matrix_complex_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_isneg(gsl_matrix $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_float_isneg(gsl_matrix_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_int_isneg(gsl_matrix_int $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uint_isneg(gsl_matrix_uint $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_long_isneg(gsl_matrix_long $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ulong_isneg(gsl_matrix_ulong $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_short_isneg(gsl_matrix_short $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ushort_isneg(gsl_matrix_ushort $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_char_isneg(gsl_matrix_char $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uchar_isneg(gsl_matrix_uchar $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_isneg(gsl_matrix_complex $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_float_isneg(gsl_matrix_complex_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_isnonneg(gsl_matrix $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_float_isnonneg(gsl_matrix_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_int_isnonneg(gsl_matrix_int $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uint_isnonneg(gsl_matrix_uint $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_long_isnonneg(gsl_matrix_long $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ulong_isnonneg(gsl_matrix_ulong $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_short_isnonneg(gsl_matrix_short $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ushort_isnonneg(gsl_matrix_ushort $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_char_isnonneg(gsl_matrix_char $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uchar_isnonneg(gsl_matrix_uchar $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_isnonneg(gsl_matrix_complex $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_float_isnonneg(gsl_matrix_complex_float $m --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_equal(gsl_matrix $a, gsl_matrix $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_float_equal(gsl_matrix_float $a, gsl_matrix_float $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_int_equal(gsl_matrix_int $a, gsl_matrix_int $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uint_equal(gsl_matrix_uint $a, gsl_matrix_uint $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_long_equal(gsl_matrix_long $a, gsl_matrix_long $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ulong_equal(gsl_matrix_ulong $a, gsl_matrix_ulong $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_short_equal(gsl_matrix_short $a, gsl_matrix_short $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_ushort_equal(gsl_matrix_ushort $a, gsl_matrix_ushort $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_char_equal(gsl_matrix_char $a, gsl_matrix_char $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_uchar_equal(gsl_matrix_uchar $a, gsl_matrix_uchar $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_equal(gsl_matrix_complex $a, gsl_matrix_complex $b --> int32) is native(LIB) is export(:matrixprop) { * }
sub gsl_matrix_complex_float_equal(gsl_matrix_complex_float $a, gsl_matrix_complex_float $b --> int32) is native(LIB) is export(:matrixprop) { * }

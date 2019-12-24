use v6.c;

unit module Math::Libgsl::Raw::Matrix:ver<0.0.1>:auth<cpan:FRITH>;

use NativeCall;

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

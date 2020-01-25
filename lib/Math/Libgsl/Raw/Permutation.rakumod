use v6;

unit module Math::Libgsl::Raw::Permutation:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Matrix;
use NativeCall;
use LibraryMake;

constant GSLHELPER = %?RESOURCES<libraries/gslhelper>.absolute;

constant LIB  = ('gsl', v23);

class gsl_permutation is repr('CStruct') is export {
  has size_t          $.size;
  has CArray[size_t]  $.data;
}

# Permutation allocation
sub gsl_permutation_alloc(size_t $n --> gsl_permutation) is native(LIB) is export(:permmem) { * }
sub gsl_permutation_calloc(size_t $n --> gsl_permutation) is native(LIB) is export(:permmem) { * }
sub gsl_permutation_init(gsl_permutation $p) is native(LIB) is export(:permmem) { * }
sub gsl_permutation_free(gsl_permutation $p) is native(LIB) is export(:permmem) { * }
sub gsl_permutation_memcpy(gsl_permutation $dest, gsl_permutation $src --> int32) is native(LIB) is export(:permmem) { * }
# Accessing permutation elements
sub gsl_permutation_get(gsl_permutation $p, size_t $i --> size_t) is native(LIB) is export(:permacc) { * }
sub gsl_permutation_swap(gsl_permutation $p, size_t $i, size_t $j --> int32) is native(LIB) is export(:permacc) { * }
# Permutation properties
sub gsl_permutation_size(gsl_permutation $p --> size_t) is native(LIB) is export(:permprop) { * }
sub gsl_permutation_data(gsl_permutation $p --> Pointer) is native(LIB) is export(:permprop) { * }
sub gsl_permutation_valid(gsl_permutation $p --> int32) is native(LIB) is export(:permprop) { * }
# Permutation functions
sub gsl_permutation_reverse(gsl_permutation $p) is native(LIB) is export(:permfunc) { * }
sub gsl_permutation_inverse(gsl_permutation $inv, gsl_permutation $p --> int32) is native(LIB) is export(:permfunc) { * }
sub gsl_permutation_next(gsl_permutation $p --> int32) is native(LIB) is export(:permfunc) { * }
sub gsl_permutation_prev(gsl_permutation $p --> int32) is native(LIB) is export(:permfunc) { * }
# Applying Permutations
sub gsl_permute(CArray[size_t] $p, CArray[num64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_inverse(CArray[size_t] $p, CArray[num64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_float(CArray[size_t] $p, CArray[num32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_float_inverse(CArray[size_t] $p, CArray[num32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_int(CArray[size_t] $p, CArray[int32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_int_inverse(CArray[size_t] $p, CArray[int32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_uint(CArray[size_t] $p, CArray[uint32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_uint_inverse(CArray[size_t] $p, CArray[uint32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_long(CArray[size_t] $p, CArray[int64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_long_inverse(CArray[size_t] $p, CArray[int64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_ulong(CArray[size_t] $p, CArray[uint64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_ulong_inverse(CArray[size_t] $p, CArray[uint64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_short(CArray[size_t] $p, CArray[int16] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_short_inverse(CArray[size_t] $p, CArray[int16] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_ushort(CArray[size_t] $p, CArray[uint16] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_ushort_inverse(CArray[size_t] $p, CArray[uint16] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_char(CArray[size_t] $p, CArray[int8] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_char_inverse(CArray[size_t] $p, CArray[int8] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_uchar(CArray[size_t] $p, CArray[uint8] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_uchar_inverse(CArray[size_t] $p, CArray[uint8] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_complex(CArray[size_t] $p, CArray[num64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_complex_inverse(CArray[size_t] $p, CArray[num64] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_complex_float(CArray[size_t] $p, CArray[num32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_complex_float_inverse(CArray[size_t] $p, CArray[num32] $data, size_t $stride, size_t $n --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector(gsl_permutation $p, gsl_vector $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_float(gsl_permutation $p, gsl_vector_float $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_char(gsl_permutation $p, gsl_vector_char $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_int(gsl_permutation $p, gsl_vector_int $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_long(gsl_permutation $p, gsl_vector_long $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_short(gsl_permutation $p, gsl_vector_short $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_uchar(gsl_permutation $p, gsl_vector_uchar $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_uint(gsl_permutation $p, gsl_vector_uint $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_ushort(gsl_permutation $p, gsl_vector_ushort $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_ulong(gsl_permutation $p, gsl_vector_ulong $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_complex(gsl_permutation $p, gsl_vector_complex $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_complex_float(gsl_permutation $p, gsl_vector_complex_float $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse(gsl_permutation $p, gsl_vector $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_float(gsl_permutation $p, gsl_vector_float $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_char(gsl_permutation $p, gsl_vector_char $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_int(gsl_permutation $p, gsl_vector_int $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_long(gsl_permutation $p, gsl_vector_long $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_short(gsl_permutation $p, gsl_vector_short $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_uchar(gsl_permutation $p, gsl_vector_uchar $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_uint(gsl_permutation $p, gsl_vector_uint $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_ushort(gsl_permutation $p, gsl_vector_ushort $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_ulong(gsl_permutation $p, gsl_vector_ulong $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_complex(gsl_permutation $p, gsl_vector_complex $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_vector_inverse_complex_float(gsl_permutation $p, gsl_vector_complex_float $v --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix(gsl_permutation $p, gsl_matrix $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_float(gsl_permutation $p, gsl_matrix_float $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_char(gsl_permutation $p, gsl_matrix_char $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_int(gsl_permutation $p, gsl_matrix_int $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_long(gsl_permutation $p, gsl_matrix_long $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_short(gsl_permutation $p, gsl_matrix_short $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_uchar(gsl_permutation $p, gsl_matrix_uchar $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_uint(gsl_permutation $p, gsl_matrix_uint $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_ushort(gsl_permutation $p, gsl_matrix_ushort $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_ulong(gsl_permutation $p, gsl_matrix_ulong $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_complex(gsl_permutation $p, gsl_matrix_complex $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permute_matrix_complex_float(gsl_permutation $p, gsl_matrix_complex_float $A --> int32) is native(LIB) is export(:permapply) { * }
sub gsl_permutation_mul(gsl_permutation $p, gsl_permutation $pa, gsl_permutation $pb --> int32) is native(LIB) is export(:permapply) { * }
# Reading and writing permutations
sub mgsl_permutation_fwrite(Str $filename, gsl_permutation $p --> int32) is native(GSLHELPER) is export(:permio) { * }
sub mgsl_permutation_fread(Str $filename, gsl_permutation $p --> int32) is native(GSLHELPER) is export(:permio) { * }
sub mgsl_permutation_fprintf(Str $filename, gsl_permutation $p, Str $format --> int32) is native(GSLHELPER) is export(:permio) { * }
sub mgsl_permutation_fscanf(Str $filename, gsl_permutation $p --> int32) is native(GSLHELPER) is export(:permio) { * }
# Permutations in cyclic form
sub gsl_permutation_linear_to_canonical(gsl_permutation $q, gsl_permutation $p --> int32) is native(LIB) is export(:permcyclic) { * }
sub gsl_permutation_canonical_to_linear(gsl_permutation $p, gsl_permutation $q --> int32) is native(LIB) is export(:permcyclic) { * }
sub gsl_permutation_inversions(gsl_permutation $p --> size_t) is native(LIB) is export(:permcyclic) { * }
sub gsl_permutation_linear_cycles(gsl_permutation $p --> size_t) is native(LIB) is export(:permcyclic) { * }
sub gsl_permutation_canonical_cycles(gsl_permutation $q --> size_t) is native(LIB) is export(:permcyclic) { * }

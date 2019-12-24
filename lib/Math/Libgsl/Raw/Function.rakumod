use v6.c;

unit module Math::Libgsl::Raw::Function:ver<0.0.2>:auth<cpan:FRITH>;

use NativeCall;

constant LIB  = ('gsl', v23);

class gsl_sf_result is repr('CStruct') is export {
  has num64 $.val;
  has num64 $.err;
}

class gsl_sf_result_e10 is repr('CStruct') is export {
  has num64 $.val;
  has num64 $.err;
  has int32 $.e10;
}

class gsl_block is repr('CStruct') is export {
  has size_t         $.size;
  has Pointer[num64] $.data;
}

class gsl_vector is repr('CStruct') is export {
  has size_t         $.size;
  has size_t         $.stride;
  has Pointer[num64] $.data;
  has gsl_block      $.block;
  has int32          $.owner;
}

class gsl_matrix is repr('CStruct') is export {
  has size_t         $.size1;
  has size_t         $.size2;
  has size_t         $.tda;
  has Pointer[num64] $.data;
  has gsl_block      $.block;
  has int32          $.owner;
}

class gsl_eigen_symmv_workspace is repr('CStruct') is export {
  has size_t         $.size;
  has Pointer[num64] $.d;
  has Pointer[num64] $.sd;
  has Pointer[num64] $.gc;
  has Pointer[num64] $.gs;
}

class gsl_sf_mathieu_workspace is repr('CStruct') is export {
  has size_t                    $.size;
  has size_t                    $.even_order;
  has size_t                    $.odd_order;
  has int32                     $.extra_values;
  has num64                     $.qa;
  has num64                     $.qb;
  has Pointer[num64]            $.aa;
  has Pointer[num64]            $.bb;
  has Pointer[num64]            $.dd;
  has Pointer[num64]            $.ee;
  has Pointer[num64]            $.tt;
  has Pointer[num64]            $.e2;
  has Pointer[num64]            $.zz;
  has gsl_vector                $.eval;
  has gsl_matrix                $.evec;
  has gsl_eigen_symmv_workspace $.wmat;
}

# Airy Functions
sub gsl_sf_airy_Ai(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_scaled(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_scaled_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_scaled(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_scaled_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
# Derivatives of Airy Functions
sub gsl_sf_airy_Ai_deriv(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_deriv_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_deriv(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_deriv_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_deriv_scaled(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Ai_deriv_scaled_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_deriv_scaled(num64 $x, uint32 $mode --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_Bi_deriv_scaled_e(num64 $x, uint32 $mode, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
# Zeros of Airy Functions
sub gsl_sf_airy_zero_Ai(uint32 $s --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Ai_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Bi(uint32 $s --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Bi_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
# Zeros of Derivatives of Airy Functions
sub gsl_sf_airy_zero_Ai_deriv(uint32 $s --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Ai_deriv_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Bi_deriv(uint32 $s --> num64) is native(LIB) is export(:airy) { * }
sub gsl_sf_airy_zero_Bi_deriv_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:airy) { * }
# Regular Cylindrical Bessel Functions
sub gsl_sf_bessel_J0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_J0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_J1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_J1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Jn(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Jn_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Jn_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Cylindrical Bessel Functions
sub gsl_sf_bessel_Y0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Y0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Y1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Y1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Yn(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Yn_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Yn_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Regular Modified Cylindrical Bessel Functions
sub gsl_sf_bessel_I0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I0_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I0_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I1_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_I1_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In_scaled(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In_scaled_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_In_scaled_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Modified Cylindrical Bessel Functions
sub gsl_sf_bessel_K0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K0_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K0_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K1_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_K1_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn_scaled(int32 $n, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn_scaled_e(int32 $n, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Kn_scaled_array(int32 $nmin, int32 $nmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Regular Spherical Bessel Functions
sub gsl_sf_bessel_j0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_j0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_j1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_j1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_j2(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_j2_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_jl(int32 $l, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_jl_e(int32 $l, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_jl_array(int32 $lmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_jl_steed_array(int32 $lmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Spherical Bessel Functions
sub gsl_sf_bessel_y0(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_y0_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_y1(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_y1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_y2(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_y2_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_yl(int32 $l, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_yl_e(int32 $l, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_yl_array(int32 $lmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Regular Modified Spherical Bessel Functions
sub gsl_sf_bessel_i0_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_i0_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_i1_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_i1_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_i2_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_i2_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_il_scaled(int32 $l, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_il_scaled_e(int32 $l, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_il_scaled_array(int32 $lmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Modified Spherical Bessel Functions
sub gsl_sf_bessel_k0_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_k0_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_k1_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_k1_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_k2_scaled(num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_k2_scaled_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_kl_scaled(int32 $l, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_kl_scaled_e(int32 $l, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_kl_scaled_array(int32 $lmax, num64 $x, CArray[num64] $result_array --> int32) is native(LIB) is export(:bessel) { * }
# Regular Bessel Function—Fractional Order
sub gsl_sf_bessel_Jnu(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Jnu_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_sequence_Jnu_e(num64 $nu, uint32 $mode, size_t $size, CArray[num64] $v --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Bessel Function—Fractional Order
sub gsl_sf_bessel_Ynu(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Ynu_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
# Regular Modified Bessel Functions—Fractional Order
sub gsl_sf_bessel_Inu(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Inu_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Inu_scaled(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Inu_scaled_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
# Irregular Modified Bessel Functions—Fractional Order
sub gsl_sf_bessel_Knu(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Knu_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_lnKnu(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_lnKnu_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Knu_scaled(num64 $nu, num64 $x --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_Knu_scaled_e(num64 $nu, num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
# Zeros of Regular Bessel Functions
sub gsl_sf_bessel_zero_J0(uint32 $s --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_zero_J0_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_zero_J1(uint32 $s --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_zero_J1_e(uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_zero_Jnu(num64 $nu, uint32 $s --> num64) is native(LIB) is export(:bessel) { * }
sub gsl_sf_bessel_zero_Jnu_e(num64 $nu, uint32 $s, gsl_sf_result $result --> int32) is native(LIB) is export(:bessel) { * }
# Clausen integral
sub gsl_sf_clausen(num64 $x --> num64) is native(LIB) is export(:clausen) { * }
sub gsl_sf_clausen_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:clausen) { * }
# Coulomb functions
# Coulomb Normalized Hydrogenic Bound States
sub gsl_sf_hydrogenicR_1(num64 $Z, num64 $r --> num64) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_hydrogenicR_1_e(num64 $Z, num64 $r, gsl_sf_result $result --> int32) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_hydrogenicR(int32 $n, int32 $l, num64 $Z, num64 $r --> num64) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_hydrogenicR_e(int32 $n, int32 $l, num64 $Z, num64 $r, gsl_sf_result $result --> int32) is native(LIB) is export(:coulomb) { * }
# Coulomb Wave Functions
sub gsl_sf_coulomb_wave_FG_e(num64 $eta, num64 $x, num64 $L_F, int32 $k, gsl_sf_result $F, gsl_sf_result $Fp,
  gsl_sf_result $G, gsl_sf_result $Gp, num64 $exp_F is rw, num64 $exp_G is rw --> int32)
  is native(LIB) is export(:coulomb) { * }
sub gsl_sf_coulomb_wave_F_array(num64 $L_min, int32 $kmax, num64 $eta, num64 $x, CArray[num64] $fc_array,
  num64 $F_exponent is rw --> int32) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_coulomb_wave_FG_array(num64 $L_min, int32 $kmax, num64 $eta, num64 $x, CArray[num64] $fc_array,
  CArray[num64] $gc_array, num64 $F_exponent is rw, num64 $G_exponent is rw --> int32)
  is native(LIB) is export(:coulomb) { * }
sub gsl_sf_coulomb_wave_FGp_array(num64 $L_min, int32 $kmax, num64 $eta, num64 $x, CArray[num64] $fc_array,
  CArray[num64] $fcp_array, CArray[num64] $gc_array, CArray[num64] $gcp_array, num64 $F_exponent is rw,
  num64 $G_exponent is rw --> int32) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_coulomb_wave_sphF_array(num64 $L_min, int32 $kmax, num64 $eta, num64 $x, CArray[num64] $fc_array,
  num64 $F_exponent is rw --> int32) is native(LIB) is export(:coulomb) { * }
# Coulomb Wave Function Normalization Constant
sub gsl_sf_coulomb_CL_e(num64 $L, num64 $eta, gsl_sf_result $result --> int32) is native(LIB) is export(:coulomb) { * }
sub gsl_sf_coulomb_CL_array(num64 $Lmin, int32 $kmax, num64 $eta, CArray[num64] $cl --> int32) is native(LIB) is export(:coulomb) { * }
# Coupling Coefficients
sub gsl_sf_coupling_3j(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_ma, int32 $two_mb, int32 $two_mc --> num64) is native(LIB) is export(:coupling) { * }
sub gsl_sf_coupling_3j_e(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_ma, int32 $two_mb, int32 $two_mc, gsl_sf_result $result --> int32) is native(LIB) is export(:coupling) { * }
sub gsl_sf_coupling_6j(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_jd, int32 $two_je, int32 $two_jf --> num64) is native(LIB) is export(:coupling) { * }
sub gsl_sf_coupling_6j_e(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_jd, int32 $two_je, int32 $two_jf, gsl_sf_result $result --> int32) is native(LIB) is export(:coupling) { * }
sub gsl_sf_coupling_9j(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_jd, int32 $two_je, int32 $two_jf, int32 $two_jg, int32 $two_jh, int32 $two_ji --> num64) is native(LIB) is export(:coupling) { * }
sub gsl_sf_coupling_9j_e(int32 $two_ja, int32 $two_jb, int32 $two_jc, int32 $two_jd, int32 $two_je, int32 $two_jf, int32 $two_jg, int32 $two_jh, int32 $two_ji, gsl_sf_result $result --> int32) is native(LIB) is export(:coupling) { * }
# Dawson Function
sub gsl_sf_dawson(num64 $x --> num64) is native(LIB) is export(:dawson) { * }
sub gsl_sf_dawson_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:dawson) { * }
# Debye Functions
sub gsl_sf_debye_1(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_1_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_2(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_2_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_3(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_3_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_4(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_4_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_5(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_5_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_6(num64 $x --> num64) is native(LIB) is export(:debye) { * }
sub gsl_sf_debye_6_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:debye) { * }
# Dilogarithms
sub gsl_sf_dilog(num64 $x --> num64) is native(LIB) is export(:dilog) { * }
sub gsl_sf_dilog_e(num64 $x, gsl_sf_result $result --> int32) is native(LIB) is export(:dilog) { * }
sub gsl_sf_complex_dilog_xy_e(num64 $x, num64 $y, gsl_sf_result $result_re, gsl_sf_result $result_im --> int32) is native(LIB) is export(:dilog) { * }
sub gsl_sf_complex_dilog_e(num64 $r, num64 $theta, gsl_sf_result $result_re, gsl_sf_result $result_im --> int32) is native(LIB) is export(:dilog) { * }
sub gsl_sf_complex_spence_xy_e(num64 $x, num64 $y, gsl_sf_result $real_sp, gsl_sf_result $imag_sp --> int32) is native(LIB) is export(:dilog) { * }
# Multiplication with propagation of errors
sub gsl_sf_multiply(num64 $x, num64 $y --> num64) is native(LIB) is export(:mult) { * }
sub gsl_sf_multiply_e(num64 $x, num64 $y, gsl_sf_result $res --> int32) is native(LIB) is export(:mult) { * }
sub gsl_sf_multiply_err_e(num64 $x, num64 $dx, num64 $y, num64 $dy, gsl_sf_result $res --> int32) is native(LIB) is export(:mult) { * }
# Elliptic Integrals
# Legendre complete
sub gsl_sf_ellint_Kcomp(num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Kcomp_e(num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Ecomp(num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Ecomp_e(num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Pcomp(num64 $k, num64 $n, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Pcomp_e(num64 $k, num64 $n, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Dcomp(num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_Dcomp_e(num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
# Legendre incomplete
sub gsl_sf_ellint_F(num64 $phi, num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_F_e(num64 $phi, num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_E(num64 $phi, num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_E_e(num64 $phi, num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_P(num64 $phi, num64 $k, num64 $n, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_P_e(num64 $phi, num64 $k, num64 $n, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_D(num64 $phi, num64 $k, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_D_e(num64 $phi, num64 $k, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
# Carlson forms
sub gsl_sf_ellint_RC(num64 $x, num64 $y, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RC_e(num64 $x, num64 $y, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RD(num64 $x, num64 $y, num64 $z, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RD_e(num64 $x, num64 $y, num64 $z, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RF(num64 $x, num64 $y, num64 $z, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RF_e(num64 $x, num64 $y, num64 $z, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RJ(num64 $x, num64 $y, num64 $z, num64 $p, int32 $mode --> num64) is native(LIB) is export(:ellint) { * }
sub gsl_sf_ellint_RJ_e(num64 $x, num64 $y, num64 $z, num64 $p, int32 $mode, gsl_sf_result $res --> int32) is native(LIB) is export(:ellint) { * }
# Elliptic Functions (Jacobi)
sub gsl_sf_elljac_e(num64 $u, num64 $m, num64 $sn is rw, num64 $cn is rw, num64 $dn is rw --> int32) is native(LIB) is export(:ellfun) { * }
# Error Functions
sub gsl_sf_erf(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_erf_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
sub gsl_sf_erfc(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_erfc_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
sub gsl_sf_log_erfc(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_log_erfc_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
sub gsl_sf_erf_Z(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_erf_Z_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
sub gsl_sf_erf_Q(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_erf_Q_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
sub gsl_sf_hazard(num64 $x --> num64) is native(LIB) is export(:err) { * }
sub gsl_sf_hazard_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:err) { * }
# Exponential Functions
sub gsl_sf_exp(num64 $x --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_e10_e(num64 $x, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_mult(num64 $x, num64 $y --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_mult_e(num64 $x, num64 $y, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_mult_e10_e(num64 $x, num64 $y, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:exp) { * }
# Relative Exponential Functions
sub gsl_sf_expm1(num64 $x --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_expm1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel(num64 $x --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel_2(num64 $x --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel_2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel_n(int32 $n, num64 $x --> num64) is native(LIB) is export(:exp) { * }
sub gsl_sf_exprel_n_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
# Exponentiation With Error Estimate
sub gsl_sf_exp_err_e(num64 $x, num64 $dx, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_err_e10_e(num64 $x, num64 $dx, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_mult_err_e(num64 $x, num64 $dx, num64 $y, num64 $dy, gsl_sf_result $res --> int32) is native(LIB) is export(:exp) { * }
sub gsl_sf_exp_mult_err_e10_e(num64 $x, num64 $dx, num64 $y, num64 $dy, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:exp) { * }
# Exponential Integrals
sub gsl_sf_expint_E1(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_E1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_E2(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_E2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_En(int32 $n, num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_En_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_Ei(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_Ei_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_Shi(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_Shi_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_Chi(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_Chi_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_3(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_expint_3_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_Si(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_Si_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_Ci(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_Ci_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
sub gsl_sf_atanint(num64 $x --> num64) is native(LIB) is export(:expint) { * }
sub gsl_sf_atanint_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:expint) { * }
# Complete Fermi-Dirac Integrals
sub gsl_sf_fermi_dirac_m1(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_m1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_0(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_0_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_1(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_2(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_int(int32 $j, num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_int_e(int32 $j, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_mhalf(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_mhalf_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_half(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_half_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_3half(num64 $x --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_3half_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
# Incomplete Fermi-Dirac Integrals
sub gsl_sf_fermi_dirac_inc_0(num64 $x, num64 $b --> num64) is native(LIB) is export(:fermidirac) { * }
sub gsl_sf_fermi_dirac_inc_0_e(num64 $x, num64 $b, gsl_sf_result $res --> int32) is native(LIB) is export(:fermidirac) { * }
# Gamma and Beta Functions
# Gamma Functions
sub gsl_sf_gamma(num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lngamma(num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lngamma_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lngamma_sgn_e(num64 $x, gsl_sf_result $res, num64 $sgn is rw --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gammastar(num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gammastar_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gammainv(num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gammainv_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lngamma_complex_e(num64 $zr, num64 $zi, gsl_sf_result $lnr , gsl_sf_result $arg --> int32) is native(LIB) is export(:gammabeta) { * }
# Factorials
sub gsl_sf_fact(uint32 $n --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_fact_e(uint32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_doublefact(uint32 $n --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_doublefact_e(uint32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnfact(uint32 $n --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnfact_e(uint32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lndoublefact(uint32 $n --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lndoublefact_e(uint32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_choose(uint32 $n, uint32 $m --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_choose_e(uint32 $n, uint32 $m, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnchoose(uint32 $n, uint32 $m --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnchoose_e(uint32 $n, uint32 $m, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_taylorcoeff(int32 $n, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_taylorcoeff_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
# Pochhammer Symbol
sub gsl_sf_poch(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_poch_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnpoch(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnpoch_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnpoch_sgn_e(num64 $a, num64 $x, gsl_sf_result $res, num64 $sgn is rw --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_pochrel(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_pochrel_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
# Incomplete Gamma Functions
sub gsl_sf_gamma_inc(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_inc_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_inc_Q(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_inc_Q_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_inc_P(num64 $a, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_gamma_inc_P_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
# Beta Functions
sub gsl_sf_beta(num64 $a, num64 $b --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_beta_e(num64 $a, num64 $b, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnbeta(num64 $a, num64 $b --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_lnbeta_e(num64 $a, num64 $b, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
# Incomplete Beta Functions
sub gsl_sf_beta_inc(num64 $a, num64 $b, num64 $x --> num64) is native(LIB) is export(:gammabeta) { * }
sub gsl_sf_beta_inc_e(num64 $a, num64 $b, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gammabeta) { * }
# Gegenbauer Functions
sub gsl_sf_gegenpoly_1(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_1_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_2(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_2_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_3(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_3_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_n(int32 $n, num64 $lambda, num64 $x --> num64) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_n_e(int32 $n, num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:gegen) { * }
sub gsl_sf_gegenpoly_array(int32 $nmax, num64 $lambda, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:gegen) { * }
# Hermite Polynomials and Functions
# Hermite Polynomials
sub gsl_sf_hermite_phys(int32 $n, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_array(int32 $nmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_series(int32 $n, num64 $x, CArray[num64] $a --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_series_e(int32 $n, num64 $x, CArray[num64] $a, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob(int32 $n, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_array(int32 $nmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_series(int32 $n, num64 $x, CArray[num64] $a --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_series_e(int32 $n, num64 $x, CArray[num64] $a, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
# Derivatives of Hermite Polynomials
sub gsl_sf_hermite_phys_der(int32 $n, int32 $m, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_der_e(int32 $n, int32 $m, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_array_der(int32 $m, int32 $nmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_der_array(int32 $mmax, int32 $n, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_der(int32 $m, int32 $n, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_der_e(int32 $m, int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_array_der(int32 $m, int32 $nmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_der_array(int32 $mmax, int32 $n, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
# Hermite Functions
sub gsl_sf_hermite_func(int32 $n, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_array(int32 $nmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_series(int32 $n, num64 $x, CArray[num64] $a is rw --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_series_e(int32 $n, num64 $x, CArray[num64] $a is rw, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
# Derivatives of Hermite Functions
sub gsl_sf_hermite_func_der(int32 $m, int32 $n, num64 $x --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_der_e(int32 $m, int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
# Zeros of Hermite Polynomials and Hermite Functions
sub gsl_sf_hermite_phys_zero(int32 $n, int32 $s --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_phys_zero_e(int32 $n, int32 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_zero(int32 $n, int32 $s --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_prob_zero_e(int32 $n, int32 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_zero(int32 $n, int32 $s --> num64) is native(LIB) is export(:hermite) { * }
sub gsl_sf_hermite_func_zero_e(int32 $n, int32 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:hermite) { * }
# Hypergeometric Functions
sub gsl_sf_hyperg_0F1(num64 $c, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_0F1_e(num64 $c, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_1F1_int(int32 $m, int32 $n, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_1F1_int_e(int32 $m, int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_1F1(num64 $a, num64 $b, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_1F1_e(num64 $a, num64 $b, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U_int(int32 $m, int32 $n, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U_int_e(int32 $m, int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U_int_e10_e(int32 $m, int32 $n, num64 $x, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U(num64 $a, num64 $b, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U_e(num64 $a, num64 $b, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_U_e10_e(num64 $a, num64 $b, num64 $x, gsl_sf_result_e10 $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1(num64 $a, num64 $b, num64 $c, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_e(num64 $a, num64 $b, num64 $c, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_conj(num64 $aR, num64 $aI, num64 $c, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_conj_e(num64 $aR, num64 $aI, num64 $c, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_renorm(num64 $a, num64 $b, num64 $c, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_renorm_e(num64 $a, num64 $b, num64 $c, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_conj_renorm(num64 $aR, num64 $aI, num64 $c, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F1_conj_renorm_e(num64 $aR, num64 $aI, num64 $c, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F0(num64 $a, num64 $b, num64 $x --> num64) is native(LIB) is export(:hyperg) { * }
sub gsl_sf_hyperg_2F0_e(num64 $a, num64 $b, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:hyperg) { * }
# Laguerre Functions
sub gsl_sf_laguerre_1(num64 $a, num64 $x --> num64) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_1_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_2(num64 $a, num64 $x --> num64) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_2_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_3(num64 $a, num64 $x --> num64) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_3_e(num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_n(int32 $n, num64 $a, num64 $x --> num64) is native(LIB) is export(:laguerre) { * }
sub gsl_sf_laguerre_n_e(int32 $n, num64 $a, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:laguerre) { * }
# Lambert W Functions
sub gsl_sf_lambert_W0(num64 $x --> num64) is native(LIB) is export(:lambert) { * }
sub gsl_sf_lambert_W0_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:lambert) { * }
sub gsl_sf_lambert_Wm1(num64 $x --> num64) is native(LIB) is export(:lambert) { * }
sub gsl_sf_lambert_Wm1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:lambert) { * }
# Legendre Functions and Spherical Harmonics
# Legendre Polynomials
sub gsl_sf_legendre_P1(num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_P1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_P2(num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_P2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_P3(num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_P3_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Pl(int32 $l, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Pl_e(int32 $l, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Pl_array(int32 $lmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Pl_deriv_array(int32 $lmax, num64 $x, CArray[num64] $res_array, CArray[num64] $res_der_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Q0(num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Q0_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Q1(num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Q1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Ql(int32 $l, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Ql_e(int32 $l, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
# Associated Legendre Polynomials and Spherical Harmonics
sub gsl_sf_legendre_array(int32 $norm, int32 $lmax, num64 $x, CArray[num64] $res_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_array_e(int32 $norm, int32 $lmax, num64 $x, num64 $csphase, CArray[num64] $res_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv_array(int32 $norm, int32 $lmax, num64 $x, CArray[num64] $res_array, CArray[num64] $res_der_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv_array_e(int32 $norm, int32 $lmax, num64 $x, num64 $csphase, CArray[num64] $res_array, CArray[num64] $res_der_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv_alt_array(int32 $norm, int32 $lmax, num64 $x, CArray[num64] $res_array, CArray[num64] $res_der_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv_alt_array_e(int32 $norm, int32 $lmax, num64 $x, num64 $csphase, CArray[num64] $res_array, CArray[num64] $res_der_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv2_array(int32 $norm, int32 $lmax, num64 $x, CArray[num64] $res_array, CArray[num64] $res_der_array, CArray[num64] $res_der2_array --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv2_array_e(int32 $norm, int32 $lmax, num64 $x, num64 $csphase, CArray[num64] $res_array, CArray[num64] $res_der_array, CArray[num64] $res_der2_array  --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv2_alt_array(int32 $norm, int32 $lmax, num64 $x, CArray[num64] $res_array, CArray[num64] $res_der_array, CArray[num64] $res_der2_array  --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_deriv2_alt_array_e(int32 $norm, int32 $lmax, num64 $x, num64 $csphase, CArray[num64] $res_array, CArray[num64] $res_der_array, CArray[num64] $res_der2_array  --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_array_n(size_t $lmax --> size_t) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_array_index(size_t $l, size_t $m --> size_t) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_nlm(size_t $lmax --> size_t) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Plm(int32 $l, int32 $m, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_Plm_e(int32 $l, int32 $m, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_sphPlm(int32 $l, int32 $m, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_sphPlm_e(int32 $l, int32 $m, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
# Conical Functions
sub gsl_sf_conicalP_half(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_half_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_mhalf(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_mhalf_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_0(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_0_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_1(num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_1_e(num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_sph_reg(int32 $l, num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_sph_reg_e(int32 $l, num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_cyl_reg(int32 $m, num64 $lambda, num64 $x --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_conicalP_cyl_reg_e(int32 $m, num64 $lambda, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
# Radial Functions for Hyperbolic Space
sub gsl_sf_legendre_H3d_0(num64 $lambda, num64 $eta --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d_0_e(num64 $lambda, num64 $eta, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d_1(num64 $lambda, num64 $eta --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d_1_e(num64 $lambda, num64 $eta, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d(int32 $l, num64 $lambda, num64 $eta --> num64) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d_e(int32 $l, num64 $lambda, num64 $eta, gsl_sf_result $res --> int32) is native(LIB) is export(:legendre) { * }
sub gsl_sf_legendre_H3d_array(int32 $lmax, num64 $lambda, num64 $eta, CArray[num64] $res_array --> int32) is native(LIB) is export(:legendre) { * }
# Logarithm and Related Functions
sub gsl_sf_log(num64 $x --> num64) is native(LIB) is export(:log) { * }
sub gsl_sf_log_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:log) { * }
sub gsl_sf_log_abs(num64 $x --> num64) is native(LIB) is export(:log) { * }
sub gsl_sf_log_abs_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:log) { * }
sub gsl_sf_complex_log_e(num64 $zr, num64 $zi, gsl_sf_result $lnr, gsl_sf_result $theta --> int32) is native(LIB) is export(:log) { * }
sub gsl_sf_log_1plusx(num64 $x --> num64) is native(LIB) is export(:log) { * }
sub gsl_sf_log_1plusx_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:log) { * }
sub gsl_sf_log_1plusx_mx(num64 $x --> num64) is native(LIB) is export(:log) { * }
sub gsl_sf_log_1plusx_mx_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:log) { * }
# Mathieu Functions
# Mathieu Function Workspace
sub gsl_sf_mathieu_alloc(size_t $n, num64 $qmax --> gsl_sf_mathieu_workspace) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_free(gsl_sf_mathieu_workspace $work) is native(LIB) is export(:mathieu) { * }
# Mathieu Function Characteristic Values
sub gsl_sf_mathieu_a(int32 $n, num64 $q --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_a_e(int32 $n, num64 $q, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_b(int32 $n, num64 $q --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_b_e(int32 $n, num64 $q, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_a_array(int32 $order_min, int32 $order_max, num64 $q, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_b_array(int32 $order_min, int32 $order_max, num64 $q, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
# Angular Mathieu Functions
sub gsl_sf_mathieu_ce(int32 $n, num64 $q, num64 $x --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_ce_e(int32 $n, num64 $q, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_se(int32 $n, num64 $q, num64 $x --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_se_e(int32 $n, num64 $q, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_ce_array(int32 $n_min, int32 $nmax, num64 $q, num64 $x, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_se_array(int32 $n_min, int32 $nmax, num64 $q, num64 $x, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
# Radial Mathieu Functions
sub gsl_sf_mathieu_Mc(int32 $j, int32 $n, num64 $q, num64 $x --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_Mc_e(int32 $j, int32 $n, num64 $q, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_Ms(int32 $j, int32 $n, num64 $q, num64 $x --> num64) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_Ms_e(int32 $j, int32 $n, num64 $q, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_Mc_array(int32 $j, int32 $n_min, int32 $nmax, num64 $q, num64 $x, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
sub gsl_sf_mathieu_Ms_array(int32 $j, int32 $n_min, int32 $nmax, num64 $q, num64 $x, gsl_sf_mathieu_workspace $work, CArray[num64] $res_array --> int32) is native(LIB) is export(:mathieu) { * }
# Power Function
sub gsl_sf_pow_int(num64 $x, int32 $n --> num64) is native(LIB) is export(:pow) { * }
sub gsl_sf_pow_int_e(num64 $x, int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:pow) { * }
# Psi (Digamma) Function
# Digamma Function
sub gsl_sf_psi_int(int32 $n --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_int_e(int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi(num64 $x --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_1piy(num64 $y --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_1piy_e(num64 $y, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
# Trigamma Function
sub gsl_sf_psi_1_int(int32 $n --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_1_int_e(int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_1(num64 $x --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
# Polygamma Function
sub gsl_sf_psi_n(int32 $n, num64 $x --> num64) is native(LIB) is export(:psi) { * }
sub gsl_sf_psi_n_e(int32 $n, num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:psi) { * }
# Synchrotron Functions
sub gsl_sf_synchrotron_1(num64 $x --> num64) is native(LIB) is export(:sync) { * }
sub gsl_sf_synchrotron_1_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:sync) { * }
sub gsl_sf_synchrotron_2(num64 $x --> num64) is native(LIB) is export(:sync) { * }
sub gsl_sf_synchrotron_2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:sync) { * }
# Transport Functions
sub gsl_sf_transport_2(num64 $x --> num64) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_2_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_3(num64 $x --> num64) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_3_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_4(num64 $x --> num64) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_4_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_5(num64 $x --> num64) is native(LIB) is export(:transport) { * }
sub gsl_sf_transport_5_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:transport) { * }
# Trigonometric Functions
# Circular Trigonometric Functions
sub gsl_sf_sin(num64 $x --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_sin_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_cos(num64 $x --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_cos_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_hypot(num64 $x, num64 $y --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_hypot_e(num64 $x, num64 $y, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_sinc(num64 $x --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_sinc_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
# Trigonometric Functions for Complex Arguments
sub gsl_sf_complex_sin_e(num64 $zr, num64 $zi, gsl_sf_result $szr, gsl_sf_result $szi --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_complex_cos_e(num64 $zr, num64 $zi, gsl_sf_result $czr, gsl_sf_result $czi --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_complex_logsin_e(num64 $zr, num64 $zi, gsl_sf_result $lszr, gsl_sf_result $lszi --> int32) is native(LIB) is export(:trig) { * }
# Hyperbolic Trigonometric Functions
sub gsl_sf_lnsinh(num64 $x --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_lnsinh_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_lncosh(num64 $x --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_lncosh_e(num64 $x, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
# Conversion Functions
sub gsl_sf_polar_to_rect(num64 $r, num64 $theta, gsl_sf_result $x, gsl_sf_result $y --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_rect_to_polar(num64 $x, num64 $y, gsl_sf_result $r, gsl_sf_result $theta --> int32) is native(LIB) is export(:trig) { * }
# Restriction Functions
sub gsl_sf_angle_restrict_symm(num64 $theta --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_angle_restrict_symm_e(num64 $theta is rw --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_angle_restrict_pos(num64 $theta --> num64) is native(LIB) is export(:trig) { * }
sub gsl_sf_angle_restrict_pos_e(num64 $theta is rw --> int32) is native(LIB) is export(:trig) { * }
# Trigonometric Functions With Error Estimates
sub gsl_sf_sin_err_e(num64 $x, num64 $dx, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
sub gsl_sf_cos_err_e(num64 $x, num64 $dx, gsl_sf_result $res --> int32) is native(LIB) is export(:trig) { * }
# Zeta Functions
# Riemann Zeta Function
sub gsl_sf_zeta_int(int32 $n --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zeta_int_e(int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zeta(num64 $s --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zeta_e(num64 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
# Riemann Zeta Function Minus One
sub gsl_sf_zetam1_int(int32 $n --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zetam1_int_e(int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zetam1(num64 $s --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_zetam1_e(num64 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
# Hurwitz Zeta Function
sub gsl_sf_hzeta(num64 $s, num64 $q --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_hzeta_e(num64 $s, num64 $q, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
# Eta Function
sub gsl_sf_eta_int(int32 $n --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_eta_int_e(int32 $n, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }
sub gsl_sf_eta(num64 $s --> num64) is native(LIB) is export(:zeta) { * }
sub gsl_sf_eta_e(num64 $s, gsl_sf_result $res --> int32) is native(LIB) is export(:zeta) { * }

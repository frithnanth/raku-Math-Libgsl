use v6.c;

unit module Math::Libgsl::Raw::Complex:ver<0.0.1>:auth<cpan:FRITH>;

use NativeCall;

constant LIB  = ('gsl', v23);

class gsl_complex is repr('CStruct') is export {
  has num64 $.re;
  has num64 $.im;
}


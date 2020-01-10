use v6;

unit class Math::Libgsl::Block:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Complex :ALL;
use Math::Libgsl::Raw::Matrix :ALL;
use NativeCall;

has gsl_block $.block;

multi method new(Int $size!) { self.bless(:$size) }
multi method new(Int :$size!) { self.bless(:$size) }

submethod BUILD(:$size!) { $!block = gsl_block_calloc($size) }
submethod DESTROY { gsl_block_free($!block) }

method write(Str $filename! --> Int) { mgsl_block_fwrite($filename, $!block) }
method read(Str $filename! --> Int) { mgsl_block_fread($filename, $!block) }
method printf(Str $filename!, Str $format! --> Int) { mgsl_block_fprintf($filename, $!block, $format) }
method scanf(Str $filename! --> Int) { mgsl_block_fscanf($filename, $!block) }

class Num32 {
  has gsl_block_float $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_float_calloc($size) }
  submethod DESTROY { gsl_block_float_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_float_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_float_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_float_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_float_fscanf($filename, $!block) }
}

class Int32 {
  has gsl_block_int $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_int_calloc($size) }
  submethod DESTROY { gsl_block_int_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_int_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_int_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_int_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_int_fscanf($filename, $!block) }
}

class UInt32 {
  has gsl_block_uint $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_uint_calloc($size) }
  submethod DESTROY { gsl_block_uint_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_uint_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_uint_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_uint_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_uint_fscanf($filename, $!block) }
}

class Int64 {
  has gsl_block_long $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_long_calloc($size) }
  submethod DESTROY { gsl_block_long_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_long_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_long_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_long_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_long_fscanf($filename, $!block) }
}

class UInt64 {
  has gsl_block_ulong $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_ulong_calloc($size) }
  submethod DESTROY { gsl_block_ulong_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_ulong_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_ulong_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_ulong_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_ulong_fscanf($filename, $!block) }
}

class Int16 {
  has gsl_block_short $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_short_calloc($size) }
  submethod DESTROY { gsl_block_short_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_short_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_short_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_short_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_short_fscanf($filename, $!block) }
}

class UInt16 {
  has gsl_block_ushort $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_ushort_calloc($size) }
  submethod DESTROY { gsl_block_ushort_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_ushort_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_ushort_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_ushort_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_ushort_fscanf($filename, $!block) }
}

class Int8 {
  has gsl_block_char $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_char_calloc($size) }
  submethod DESTROY { gsl_block_char_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_char_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_char_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_char_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_char_fscanf($filename, $!block) }
}

class UInt8 {
  has gsl_block_uchar $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_uchar_calloc($size) }
  submethod DESTROY { gsl_block_uchar_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_uchar_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_uchar_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_uchar_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_uchar_fscanf($filename, $!block) }
}

class Complex64 {
  has gsl_block_complex $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_complex_calloc($size) }
  submethod DESTROY { gsl_block_complex_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_complex_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_complex_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_complex_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_complex_fscanf($filename, $!block) }
}

class Complex32 {
  has gsl_block_complex_float $.block;

  multi method new(Int $size!) { self.bless(:$size) }
  multi method new(Int :$size!) { self.bless(:$size) }

  submethod BUILD(:$size!) { $!block = gsl_block_complex_float_calloc($size) }
  submethod DESTROY { gsl_block_complex_float_free($!block) }

  method write(Str $filename! --> Int) { mgsl_block_complex_float_fwrite($filename, $!block) }
  method read(Str $filename! --> Int) { mgsl_block_complex_float_fread($filename, $!block) }
  method printf(Str $filename!, Str $format! --> Int) { mgsl_block_complex_float_fprintf($filename, $!block, $format) }
  method scanf(Str $filename! --> Int) { mgsl_block_complex_float_fscanf($filename, $!block) }
}

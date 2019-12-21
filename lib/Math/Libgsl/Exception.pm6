use v6;

unit module Math::Libgsl::Exception:ver<0.0.1>:auth<cpan:FRITH>;

class X::Libgssl is Exception
{
  has Int $.errno;
  has Str $.error;
  method message { "Error {$!errno}: $!error" }
}

use v6;

class X::Libgssl is Exception
{
  has Int $.errno;
  has Str $.error;
  method message { "Error {$!errno}: $!error" }
}

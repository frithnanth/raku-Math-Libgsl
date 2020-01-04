use v6;

unit class Math::Libgsl::Vector:ver<0.0.3>:auth<cpan:FRITH>;

use Math::Libgsl::Raw::Complex :ALL;
use Math::Libgsl::Raw::Matrix :ALL;
use NativeCall;

has gsl_vector $.vector;
has            @!views;

multi method new(Int $size!) { self.bless(:$size) }
multi method new(Int :$size!) { self.bless(:$size) }
multi method new(gsl_vector :$vector!) { self.bless(:$vector) }

submethod BUILD(Int :$size?, gsl_vector :$vector?) {
  $!vector = gsl_vector_calloc($size) with $size;
  $!vector = $vector with $vector;
}

submethod DESTROY {
  free_gsl_vector_view($_) for @!views;
  gsl_vector_free($!vector);
}
# Accessors
method get(Int:D $index! --> Num) { gsl_vector_get($!vector, $index) }
multi method AT-POS(Math::Libgsl::Vector:D: Int:D $index! --> Num) { gsl_vector_get(self.vector, $index) }
multi method AT-POS(Math::Libgsl::Vector:D: Range:D $range! --> List) { gsl_vector_get(self.vector, $_) for $range }
method set(Int:D $index!, Num(Cool) $x!) { gsl_vector_set($!vector, $index, $x) }
multi method ASSIGN-POS(Math::Libgsl::Vector:D: Int:D $index!, Num(Cool) $x!) { gsl_vector_set(self.vector, $index, $x) }
method setall(Num(Cool) $x!) { gsl_vector_set_all($!vector, $x) }
method zero() { gsl_vector_set_zero($!vector) }
method basis(Int:D $index! --> Int) { gsl_vector_set_basis($!vector, $index) }
# IO
method write(Str $filename! --> Int) { mgsl_vector_fwrite($filename, $!vector) }
method read(Str $filename! --> Int) { mgsl_vector_fread($filename, $!vector) }
method printf(Str $filename!, Str $format! --> Int) { mgsl_vector_fprintf($filename, $!vector, $format) }
method scanf(Str $filename! --> Int) { mgsl_vector_fscanf($filename, $!vector) }
# View
method subvector(Int $offset!, Int $n! --> Math::Libgsl::Vector)
{
  my gsl_vector_view $view = alloc_gsl_vector_view();
  my gsl_vector $vv = mgsl_vector_subvector($view, $!vector, $offset, $n);
  @!views.push: $view;
  Math::Libgsl::Vector.new: :vector($vv);
}

method subvector-stride(Int $offset!, Int $n!, Int $stride! --> Math::Libgsl::Vector)
{
  my gsl_vector_view $view = alloc_gsl_vector_view();
  my gsl_vector $vv = mgsl_vector_subvector_with_stride($view, $!vector, $offset, $stride, $n);
  @!views.push: $view;
  Math::Libgsl::Vector.new: :vector($vv);
}

# TODO gsl_vector_complex_real gsl_vector_complex_imag

method subarray(@array! --> Math::Libgsl::Vector)
{
  my gsl_vector_view $view = alloc_gsl_vector_view();
  my $array = CArray[num64].new: @array».Num;
  my gsl_vector $vv = mgsl_vector_view_array($view, $array, @array.elems);
  @!views.push: $view;
  Math::Libgsl::Vector.new: :vector($vv);
}

method subarray-stride(Int $stride!, @array! --> Math::Libgsl::Vector)
{
  my gsl_vector_view $view = alloc_gsl_vector_view();
  my $array = CArray[num64].new: @array».Num;
  my gsl_vector $vv = mgsl_vector_view_array_with_stride($view, $array, $stride, @array.elems);
  @!views.push: $view;
  Math::Libgsl::Vector.new: :vector($vv);
}
# Copy


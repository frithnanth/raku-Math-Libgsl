#!/usr/bin/env raku

use lib 'lib';
use Math::Libgsl::Vector;

# Create a 30-element vector
my Math::Libgsl::Vector $v .= new(30);
# Get a subvector view with stride
my Math::Libgsl::Vector $vv = $v.subvector-stride(0, 3, 10);
# Set all elements of the subvector view to 42
$vv.setall(42);
# Print the original vector
say $v[^30]; # output: (42 0 0 42 0 0 42 0 0 42 0 0 42 0 0 42 0 0 42 0 0 42 0 0 42 0 0 42 0 0)

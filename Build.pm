#! /usr/bin/env raku
#Note `zef build .` will run this script
use v6;

class Build {
  need LibraryMake;
  # adapted from deprecated Native::Resources

  #| Sets up a C<Makefile> and runs C<make>.  C<$folder> should be
  #| C<"$folder/resources/lib"> and C<$libname> should be the name of the library
  #| without any prefixes or extensions.
  sub make(Str $folder, Str $destfolder, IO() :$libname!) {
    my %vars = LibraryMake::get-vars($destfolder);
    %vars<LIB-NAME> = ~ $*VM.platform-library-name($libname);
    %vars<LIB-LDFLAGS> = '-lgsl';
    %vars<LIB-CFLAGS>  = '-I/usr/include/gsl';
    s/:s '-DNDEBUG'// for %vars<CCFLAGS>, %vars<LDFLAGS>;

    mkdir($destfolder);
    LibraryMake::process-makefile($folder, %vars);
    shell(%vars<MAKE>);
  }

  method build($workdir) {
    my $destdir = 'resources/libraries';
    mkdir $destdir;
    make($workdir, "$destdir", :libname<gslhelper>);
    True;
  }
}

# Build.pm can also be run standalone
sub MAIN(Str $working-directory = '.' ) {
  Build.new.build($working-directory);
}

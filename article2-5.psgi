#!/usr/bin/plackup
use strict;
use warnings;
use Plack::Request;

my $dir = '/path/to/data/files/';

my $app = sub {
  my $req  = Plack::Request(shift);
  my $file = $req->parameters->{filename};

  if ($file =~ /^(\w[\w\.]*)$/) {
    $file = $1;
  } else {
    die "Bad filename: $file\n";
  }

  open my $fh, '<', $file or die "Can't open $file: $!\n";

  return [ 200, [ 'Content-type' => 'text/plain' ],
           [ <$fh> ] ];
};

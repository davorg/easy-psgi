#!/usr/bin/plackup
use strict;
use warnings;
use Plack::Request;

my $dir = '/path/to/data/files/';

my $app = sub {
  my $req  = Plack::Request->new(shift);
  my $file = $dir . $req->parameters->{filename};

  open my $fh, '<', $file or die "Can't open $file: $!\n";

  return [ 200, [ 'Content-type' => 'text/plain' ],
           [ <$fh> ] ]
}

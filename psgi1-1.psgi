#!/usr/bin/plackup

use strict;
use warnings;

my $app = sub {
  return [ 200, [ 'Content-type' => 'text/plain' ], [ 'Hello world' ] ];
};

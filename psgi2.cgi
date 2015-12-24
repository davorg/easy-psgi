#!/usr/bin/plackup

use strict;
use warnings;

my $app = sub {
  my $now = localtime;

  return [
    200,
    [ 'Content-type' => 'text/plain' ],
    [ "The time is $now" ]
  ];
};

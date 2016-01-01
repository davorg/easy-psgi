#!/usr/bin/perl -T
use strict;
use warnings;
use CGI ':standard';

my $dir = '/path/to/data/files/';
my $file = param('filename');

if ($file =~ /^(\w[\w\.]*)$/) {
  $file = $1;
} else {
  die "Bad filename: $file\n";
}

print header(-type => 'text/plain');

open my $fh, '<', $file or die "Can't open $file: $!\n";

while (<$fh>) {
  print;
}

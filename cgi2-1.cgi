#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard';

my $file = param('filename');

print header(-type => 'text/plain');

open my $fh, '<', $file or die "Can't open $file: $!\n";

while (<$fh>) {
  print;
}

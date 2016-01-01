#!/usr/bin/perl
use strict;
use warnings;

print "Content-type: text/plain\n\n";
my $now = localtime;
print "The time is $now";

#!/usr/bin/perl -T
use strict;
use warnings;
use CGI ':standard';

$ENV{PATH} = '/bin:/usr/bin:/usr/local/bin';

my $user = param('user');

if ($user =~ /^(\w+)$/) {
  $user = $1;
} else {
  die "Invalid user: $user\n";
}

my $who = `finger $user`;

print header(-type => 'text/plain');

print "Here are the results for user $user\n\n";

print $who;

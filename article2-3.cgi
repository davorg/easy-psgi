#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard';

my $user = param('user');
my $who = `finger $user`;

print header(-type => 'text/plain');

print "Here are the results for user $user\n\n";

print $who;

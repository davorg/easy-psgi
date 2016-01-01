#!/usr/bin/perl -T

use strict;
use warnings;
use CGI ':standard';

my $info = path_info;

print header,
start_html,
h1('Path Info'),
p('Here are the contents of $ENV{PATH_INFO}');

my @info = split /\//, $info;

print ul(li([@info]));

print end_html;

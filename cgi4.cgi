#!/usr/bin/perl -wT
use strict;
use CGI ':standard';

print header;
my $now = localtime;

print start_html(-title=>'Time'),
h1('Time'),
p("The time is $now"),
end_html;

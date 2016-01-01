#!/usr/bin/perl -T

use strict;
use warnings;
use CGI ':standard';

my $time_cookie = cookie(-name=>'time',
                         -value=>scalar localtime,
                         -expires=>'+1y');

print header(-cookie => $time_cookie),
start_html(-title=>'Cookie test'),
h1('Cookie test');

if (my $time = cookie('time')) {
  print p("You last visited this page at $time");
} else {
  print p("You haven't visited this page before");
}

print end_html;

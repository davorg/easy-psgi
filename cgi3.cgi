#!/usr/bin/perl

use strict;
use warnings;

print "Content-type: text/html\n\n";
my $now = localtime;

print <<END_HTML;
<html>
  <head>
    <title>Time</title>
  </head>
  <body>
    <h1>Time</h1>
    <p>The time is $now</p>
  </body>
</html>
END_HTML

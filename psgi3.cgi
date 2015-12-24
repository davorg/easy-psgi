#!/usr/bin/plackup

use strict;
use warnings;

my $app = sub {
  my $now = localtime;

  return [
    200,
    [ 'Content-type' => 'text/html' ],
    [ "<html>
  <head>
    <title>Time</title>
  </head>
  <body>
    <h1>Time</h1>
    <p>The time is $now</p>
  </body>
</html>" ] ];
};


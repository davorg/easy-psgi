#!/usr/bin/perl -T

use strict;
use warnings;
use CGI ':standard';

my $name;
my $logged;

if (param('login')) {
  $logged = 1;
  $name = param('name');
  print header(-cookie => cookie(-name=>'name',
               -value=>$name,
               -expires=>'+1y'));
} elsif (param('logout')) {
  $logged = 0;
  $name = 'Guest';
  print header(-cookie => cookie(-name=>'name',
               -value=>'',
               -expires=>'-1d'));
} else {
  $logged = defined cookie('name');
  $name = cookie('name') || 'Guest';
  print header;
}

print start_html(-title => 'Cookies');

print h1('Cookies');
print p('This is a cookie test page');

$name =~ s/</&lt/g;
$name = b($name);

print p("Hello $name");

print start_form;
if ($logged) {
  print p(submit(-name=>'logout', -value=>'logout'));
} else {
  print p('Enter your name: ', textfield(-name=>'name'),
  submit(-name=>'login', -value=>'Set name'));
}
print end_form;
print end_html;

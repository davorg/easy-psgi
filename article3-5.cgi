#!/usr/bin/perl -T

use strict;
use warnings;
use CGI ':standard';
use Template;

my $name = param('name');
my $age = param('age');
my $gender = param('gender');
my @hobbies = param('hobby');

my $t = Template->new;

print header;

$t->process('form.tt', { name => $name,
  age => $age,
  gender => $gender,
  hobbies => \@hobbies })
  || die $t->error;

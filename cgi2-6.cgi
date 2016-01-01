#!usr/bin/perl -T

use strict;
use warnings;
use CGI ':standard';

my $name = param('name');
my $age = param('age');
my $gender = param('gender');
my @hobbies = param('hobby');

my $list;

if (@hobbies) {
  $list = join ', ', @hobbies;
} else {
  $list = 'None';
}

$name =~ s/</&lt;/g;
$age =~ s/</&lt;/g;
$gender =~ s/</&lt;/g;
$list =~ s/</&lt;/g;

print header,
      start_html(-title=>$name),
      h1("Welcome $name"),
      p('Here are your details:'),
      table(Tr(td('Name:'),
               td($name)),
            Tr(td('Age:'),
               td($age)),
            Tr(td('Gender:'),
               td($gender)),
            Tr(td('Hobbies:'),
               td($list))),
      end_html;
